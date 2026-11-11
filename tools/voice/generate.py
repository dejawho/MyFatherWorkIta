# /// script
# requires-python = ">=3.11"
# dependencies = ["kokoro-onnx>=0.4", "soundfile", "numpy"]
# ///
"""
Generated voice-over: reads a passage's flavour text, in each reading mode that has its own text,
and writes the clips to content/assets/audio/voice/<voice>/ and their index to
content/assets/voices.json. Voices and their sound (speed, pauses, sibilance filter, loudness) are
set in tools/voice/voices.json, as is each scenario's introduction: the page the dev-only voice
test page (/voices) plays. Each voice reads one language (`language`: strings.<language>.json)
and skips the pages not translated into it yet; `like` is the original recording it stands in for.

Engines (`engine` in voices.json):
  kokoro      (default) Kokoro-82M via ONNX, on the CPU; the dependencies below.
  chatterbox  Chatterbox Multilingual (Resemble AI, MIT), cloning the voice of `reference`
              (tools/voice/refs/, Kokoro clips). Needs an NVIDIA GPU and its own environment:
                pip install torch==2.6.0 torchaudio==2.6.0 --index-url https://download.pytorch.org/whl/cu124
                pip install chatterbox-tts==0.1.7
              then run this file with that environment's python instead of uv.
ffmpeg must be on the PATH (loudness, filters, MP3).

Spoiler-free output: pages are counted ("page 3 of 9"), never named, and no text is printed.

Usage: uv run tools/voice/generate.py [--scenario ID] [--voices emma,george] [PASSAGE …]
       Without passages: the introduction and the passages the original app has voice-over for.
       uv run tools/voice/generate.py --try "Any text"   one clip per voice in build/voice-try/
"""

import argparse
import hashlib
import json
import re
import subprocess
import sys
import tempfile
import urllib.request
from pathlib import Path

import numpy as np
import pages
import soundfile as sf
from pages import CONTENT, ROOT

HERE = Path(__file__).parent
ASSETS = CONTENT / "assets"
INDEX = ASSETS / "voices.json"
CONFIG = json.loads((HERE / "voices.json").read_text(encoding="utf-8"))
CACHE = Path.home() / ".cache" / "chronicle" / "kokoro"


class Engines:
    """The speech models, each loaded the first time a voice needs it."""

    def __init__(self) -> None:
        self._kokoro = None
        self._chatterbox = None

    def say(self, voice: dict, text: str) -> tuple[np.ndarray, int]:
        """One paragraph as mono float audio and its sample rate."""
        if voice.get("engine", "kokoro") == "chatterbox":
            return self._say_chatterbox(voice, text)
        audio, rate = self.kokoro().create(text, voice=voice["kokoro"], speed=voice["speed"], lang=voice["lang"])
        return audio.astype(np.float32), rate

    def kokoro(self):
        if self._kokoro is None:
            from kokoro_onnx import Kokoro

            CACHE.mkdir(parents=True, exist_ok=True)
            files = {}
            for name, url in CONFIG["model"].items():
                path = CACHE / url.rsplit("/", 1)[1]
                if not path.exists():
                    print(f"downloading {path.name} …", file=sys.stderr)
                    urllib.request.urlretrieve(url, path)
                files[name] = path
            self._kokoro = Kokoro(str(files["onnx"]), str(files["voices"]))
        return self._kokoro

    def _say_chatterbox(self, voice: dict, text: str) -> tuple[np.ndarray, int]:
        import torch

        if self._chatterbox is None:
            try:
                from chatterbox.mtl_tts import ChatterboxMultilingualTTS
            except ImportError:
                sys.exit("chatterbox voices need chatterbox-tts: see the top of tools/voice/generate.py")
            device = "cuda" if torch.cuda.is_available() else "cpu"
            self._chatterbox = ChatterboxMultilingualTTS.from_pretrained(device=device)
        model = self._chatterbox
        pause = np.zeros(int(model.sr * 0.25), dtype=np.float32)
        out: list[np.ndarray] = []
        # One sentence at a time: the model reads short texts best.
        for sentence in [s for s in re.split(r"(?<=[.!?])\s+|(?<=[.!?][\"”])\s+", text) if s.strip()]:
            out += [self._sentence(voice, sentence), pause]
        return np.concatenate(out[:-1]), model.sr

    def _sentence(self, voice: dict, sentence: str) -> np.ndarray:
        """A sentence, generated again (up to twice) when it comes out much too short: the model
        sometimes stops early. Seeded by the text, so a run repeats itself."""
        import torch

        model = self._chatterbox
        best = np.zeros(0, dtype=np.float32)
        for attempt in range(3):
            seed = int(hashlib.sha256(f"{attempt}:{sentence}".encode()).hexdigest()[:8], 16)
            torch.manual_seed(seed)
            wav = model.generate(sentence, language_id=voice["lang"], audio_prompt_path=str(HERE / voice["reference"]))
            audio = wav.squeeze(0).cpu().numpy().astype(np.float32)
            if len(audio) > len(best):
                best = audio
            # Italian narration runs at about 14 characters a second; under 25 is cut short.
            if len(audio) / model.sr >= len(sentence) / 25:
                break
        return best


def plain(text: str) -> str:
    """String-table markup to speakable text (see engine/src/text.ts)."""
    text = re.sub(r"\{icon:[^}]*\}", "", text)
    text = re.sub(r"\\(.)", r"\1", re.sub(r"(?<!\\)\*+", "", text))
    return text.strip()


def texts(passage: dict, strings: dict) -> dict[str, list[str]] | None:
    """The passage's flavour text per reading mode, as plain text."""
    keys = [n["key"] for n in passage["body"] if n.get("t") == "text" and n.get("kind") == "narrative"]
    if any(k not in strings or strings[k].get("untranslated") for k in keys):
        return None  # not translated into this voice's language yet
    by_mode = pages.texts(passage, strings)
    if not by_mode or any(pages.args(passage)):
        return None  # nothing to read, or names typed in at the table
    return {mode: [plain(t) for t in paras] for mode, paras in by_mode.items()}


def loudness(wav: str, voice: dict) -> str:
    """Two-pass loudness normalisation to the original recordings' level (about -14 LUFS)."""
    target = f"loudnorm=I={CONFIG['loudness']}:TP={CONFIG['truePeak']}:LRA=11"
    log = subprocess.run(
        ["ffmpeg", "-hide_banner", "-i", wav, "-af", f"{voice['filter']},{target}:print_format=json", "-f", "null", "-"],
        capture_output=True, text=True, check=True,
    ).stderr
    # The measurement is the last {…} block; newer ffmpeg versions print more lines after it.
    start = log.rindex("{")
    m = json.loads(log[start:log.index("}", start) + 1])
    return (f"{target}:measured_I={m['input_i']}:measured_TP={m['input_tp']}:measured_LRA={m['input_lra']}"
            f":measured_thresh={m['input_thresh']}:offset={m['target_offset']}:linear=true")


def speak(engines: Engines, voice: dict, paragraphs: list[str], target: Path) -> float:
    chunks, rate = [], 24000
    for text in paragraphs:
        audio, rate = engines.say(voice, text)
        chunks += [audio, np.zeros(int(rate * CONFIG["paragraphPause"]), dtype=audio.dtype)]
    # A folder rather than an open temporary file: on Windows ffmpeg cannot open that one.
    with tempfile.TemporaryDirectory() as folder:
        wav = str(Path(folder) / "clip.wav")
        sf.write(wav, np.concatenate(chunks), rate)
        target.parent.mkdir(parents=True, exist_ok=True)
        subprocess.run(
            ["ffmpeg", "-v", "error", "-y", "-i", wav, "-af", f"{voice['filter']},{loudness(wav, voice)}",
             "-ar", "24000", "-ac", "1", "-b:a", CONFIG["bitrate"], str(target)],
            check=True,
        )
    return sum(len(c) for c in chunks) / rate


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--scenario", default="cost-of-disease")
    parser.add_argument("--voices", default=",".join(CONFIG["voices"]))
    parser.add_argument("--try", dest="text", help="read this text instead, into build/voice-try/")
    parser.add_argument("passages", nargs="*")
    args = parser.parse_args()
    voices = args.voices.split(",")
    if unknown := [v for v in voices if v not in CONFIG["voices"]]:
        sys.exit(f"unknown voice: {', '.join(unknown)}")

    engines = Engines()
    if args.text:
        for voice in voices:
            target = ROOT / "build" / "voice-try" / f"{voice}.mp3"
            seconds = speak(engines, CONFIG["voices"][voice], [p for p in args.text.split("\n\n") if p.strip()], target)
            print(f"{target.relative_to(ROOT)}: {seconds:.0f} s")
        return

    folder = CONTENT / args.scenario
    scenario = json.loads((folder / "scenario.json").read_text(encoding="utf-8"))
    tables = {
        lang: json.loads((folder / f"strings.{lang}.json").read_text(encoding="utf-8"))
        for lang in {CONFIG["voices"][v]["language"] for v in voices}
    }
    intro = CONFIG["intros"].get(args.scenario)
    passages = args.passages or pages.voiced(args.scenario, intro)
    if unknown := [p for p in passages if p not in scenario["passages"]]:
        sys.exit(f"unknown passage: {', '.join(unknown)}")

    index = json.loads(INDEX.read_text(encoding="utf-8")) if INDEX.exists() else {"voices": {}, "clips": {}}
    index["voices"] = {
        v: {"label": c["label"], "language": c["language"], "like": c["like"]} for v, c in CONFIG["voices"].items()
    }
    index["intros"] = CONFIG["intros"]
    for number, name in enumerate(passages, 1):
        page = f"page {number} of {len(passages)}"
        for voice in voices:
            strings = tables[CONFIG["voices"][voice]["language"]]
            by_mode = texts(scenario["passages"][name], strings)
            if by_mode is None:
                print(f"{page} · {voice}: skipped (no flavour text, not translated, or names typed in at the table)")
                continue
            clips = {}
            for mode, paragraphs in by_mode.items():
                file = Path("audio/voice") / voice / pages.clip(name, mode)
                seconds = speak(engines, CONFIG["voices"][voice], paragraphs, ASSETS / file)
                clips[mode] = file.as_posix()
                print(f"{page} · {voice} · {mode}: {seconds:.0f} s", flush=True)
            index["clips"].setdefault(name, {})[voice] = clips
            # Saved after each page, so an interrupted run keeps what it has done.
            INDEX.write_text(json.dumps(index, indent=1, sort_keys=True) + "\n")
    INDEX.write_text(json.dumps(index, indent=1, sort_keys=True) + "\n")


if __name__ == "__main__":
    main()
