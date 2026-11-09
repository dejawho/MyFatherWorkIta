import { inject, Injectable } from '@angular/core';
import { IT } from '../i18n/it';
import { Settings } from './settings';

/** Chronicle's own texts by language, each keyed by its English text. */
const DICTIONARIES: Record<string, Record<string, string>> = { it: IT };

/** Fills `{0}`, `{1}` … with `args`. */
export function fill(text: string, args: readonly (string | number)[]): string {
  return text.replace(/\{(\d+)\}/g, (m, i: string) => String(args[+i] ?? m));
}

/**
 * Chronicle's own texts (the original's screen texts are in Library): written in English in the
 * code and looked up by that text in the chosen language. A text without a translation stays
 * English. Read in a template or a `computed`, it follows a change of language.
 */
@Injectable({ providedIn: 'root' })
export class I18n {
  private readonly settings = inject(Settings);

  /** `english` in the chosen language, with `{0}` … filled from `args`. */
  readonly tr = (english: string, ...args: (string | number)[]): string =>
    fill(DICTIONARIES[this.settings.language()]?.[english] ?? english, args);
}
