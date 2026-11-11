import { computed, effect, inject, Injectable, signal, untracked } from '@angular/core';
import {
  resolveEntry,
  type AssetManifest,
  type GeneratedVoices,
  type ReadingMode,
  type UiText,
} from '@chronicle/engine';
import { NO_VOICE, narratorsFor, standIn, type VoiceChoice } from '../utils/narrators';
import { I18n } from './i18n';
import { Settings } from './settings';

const BASE = 'content';

/**
 * The original app's voices, named by its screen texts. They only read the original English
 * text; with another version or language a generated voice `like` them takes over.
 */
const ORIGINAL_VOICES = [
  { value: 'female', key: 'UI/VoiceTrack/Viewarea/Prompt/Female/Lable', fallback: 'Feminine' },
  { value: 'male', key: 'UI/VoiceTrack/Viewarea/Prompt/Male/Lable', fallback: 'Masculine' },
] as const;

/**
 * Content shared by all scenarios: the original app's screen texts and the asset manifest
 * (icons, pictures, UI art, audio). Loaded once at start-up.
 */
@Injectable({ providedIn: 'root' })
export class Library {
  private readonly settings = inject(Settings);
  private readonly tr = inject(I18n).tr;
  private readonly english = signal<UiText>({});
  /** Screen texts by language, loaded when the language is first chosen. */
  private readonly translations = signal<Record<string, UiText>>({});
  /** The screen texts in the chosen language; one it lacks stays English. */
  readonly texts = computed<UiText>(() => ({
    ...this.english(),
    ...this.translations()[this.settings.language()],
  }));
  readonly assets = signal<AssetManifest | undefined>(undefined);
  private readonly generated = signal<GeneratedVoices>({ voices: {}, clips: {} });
  private loading?: Promise<void>;

  constructor() {
    effect(() => {
      const language = this.settings.language();
      if (language === 'en' || untracked(this.translations)[language]) return;
      void fetch(`${BASE}/ui.${language}.json`)
        .then((r) => (r.ok ? (r.json() as Promise<UiText>) : {}))
        .catch(() => ({}))
        .then((texts) => this.translations.update((t) => ({ ...t, [language]: texts })));
    });
    // A narrator that cannot read the text chosen now (another language or version): a voice
    // like it takes over, so female stays female from English to Italian and back.
    effect(() => {
      if (!Object.keys(this.generated().voices).length) return; // not loaded yet
      const voice = this.settings.voice();
      const instead = standIn(voice, this.voices(), this.allVoices());
      if (instead !== voice) this.settings.voice.set(instead);
    });
  }

  /** True while the original recordings can be chosen: English in its original version. */
  private readonly originalText = computed(
    () => this.settings.language() === 'en' && this.settings.readingMode() === 'full',
  );

  /** Every voice: the original recordings, then the generated voices. */
  readonly allVoices = computed<VoiceChoice[]>(() => [
    ...ORIGINAL_VOICES.map((v) => ({
      value: v.value,
      label: this.tr('{0} (original)', this.text(v.key, v.fallback)),
      original: true,
      language: 'en',
      like: v.value,
    })),
    ...Object.entries(this.generated().voices).map(([value, v]) => ({
      value,
      label: this.tr('{0} (generated)', v.label),
      original: false,
      language: v.language,
      like: v.like,
    })),
  ]);

  /**
   * Narrator choices: the voices that read the story in the chosen language (the original
   * recordings only the original English text), then no voice at all.
   */
  readonly voices = computed<VoiceChoice[]>(() =>
    narratorsFor(this.allVoices(), this.settings.language(), this.originalText(), {
      value: NO_VOICE,
      label: this.tr('No voice'),
      original: false,
      language: '',
    }),
  );

  /** Scenario id → its introduction's passage (voice test page). */
  readonly intros = computed(() => this.generated().intros ?? {});

  load(): Promise<void> {
    this.loading ??= (async () => {
      const [texts, assets, generated] = await Promise.all([
        fetch(`${BASE}/ui.en.json`).then((r) => (r.ok ? (r.json() as Promise<UiText>) : {})),
        fetch(`${BASE}/assets/manifest.json`).then((r) =>
          r.ok ? (r.json() as Promise<AssetManifest>) : undefined,
        ),
        fetch(`${BASE}/assets/voices.json`).then((r) =>
          r.ok ? (r.json() as Promise<GeneratedVoices>) : undefined,
        ),
      ]);
      this.english.set(texts);
      this.assets.set(assets);
      if (generated) this.generated.set(generated);
    })();
    return this.loading;
  }

  /**
   * A screen text by key; `fallback` while texts load or if the key is missing. Texts with
   * variants follow the reading mode.
   */
  text(key: string, fallback = ''): string {
    const v = this.texts()[key];
    if (typeof v === 'string') return v;
    return v && !Array.isArray(v) ? resolveEntry(v, this.settings.readingMode()) : fallback;
  }

  list(key: string): string[] {
    const v = this.texts()[key];
    return Array.isArray(v) ? v : [];
  }

  private url(path: string | undefined): string | undefined {
    return path ? `${BASE}/assets/${path}` : undefined;
  }

  /** An icon by name; the original's texts aren't consistent about case (`storybook`). */
  icon(name: string): string | undefined {
    const icons = this.assets()?.icons;
    if (!icons) return undefined;
    const key = name in icons ? name : this.iconKeys().get(name.toLowerCase());
    return this.url(key ? icons[key] : undefined);
  }

  private readonly iconKeys = computed(
    () => new Map(Object.keys(this.assets()?.icons ?? {}).map((k) => [k.toLowerCase(), k])),
  );

  setupImage(name: string): string | undefined {
    return this.url(this.assets()?.setup[name]);
  }

  /** UI art by its key in the manifest, e.g. `general/main-bg`. */
  ui(key: string): string | undefined {
    return this.url(this.assets()?.ui[key]);
  }

  music(scenario?: string): string | undefined {
    const m = this.assets()?.music;
    return this.url((scenario && m?.scenario[scenario]) || m?.title);
  }

  endingMusic(): string | undefined {
    return this.url(this.assets()?.music.ending);
  }

  effect(name: string): string | undefined {
    return this.url(this.assets()?.effects[name]);
  }

  /**
   * A passage's voice-over in `mode`: `full` unless the page shows easy or short text. The
   * original recordings only read the full text.
   */
  voiceOver(passage: string, voice: string, mode: ReadingMode): string | undefined {
    const generated = this.generated().clips[passage]?.[voice]?.[mode];
    const original =
      mode === 'full' && (voice === 'male' || voice === 'female')
        ? this.assets()?.voiceOver[passage]?.[voice]
        : undefined;
    return this.url(generated ?? original);
  }
}
