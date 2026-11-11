/** The narrator choice for no voice-over at all. */
export const NO_VOICE = 'none';

/** A narrator in the settings. */
export interface VoiceChoice {
  value: string;
  label: string;
  /** One of the original app's recordings: they read only the original English text. */
  original: boolean;
  /** The language it reads; empty for no voice. */
  language: string;
  /** The original recording it is like (female or male); none for no voice. */
  like?: 'female' | 'male';
}

/**
 * The narrators that can read the text shown now: the voices of `language` (the original
 * recordings only with the original English text), then `none`.
 */
export function narratorsFor(
  all: readonly VoiceChoice[],
  language: string,
  originalText: boolean,
  none: VoiceChoice,
): VoiceChoice[] {
  return [...all.filter((v) => (v.original ? originalText : v.language === language)), none];
}

/**
 * The narrator to use instead of `voice` when it is not among `choices`: one like it (female
 * stays female from English to Italian and back), else the first choice; `voice` itself when it
 * is a choice.
 */
export function standIn(
  voice: string,
  choices: readonly VoiceChoice[],
  all: readonly VoiceChoice[],
): string {
  if (choices.some((c) => c.value === voice)) return voice;
  const like = all.find((v) => v.value === voice)?.like;
  return (choices.find((c) => like && c.like === like) ?? choices[0])?.value ?? voice;
}
