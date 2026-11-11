import type { ReadingMode, StringEntry, StringTable, TextKind } from './schema.ts';

/**
 * Picks the text for a key. Only narrative text uses the easy or short variant; everything
 * else always shows the full text so no game instruction can get lost.
 */
export function resolveText(table: StringTable, key: string, mode: ReadingMode = 'full', kind: TextKind = 'narrative'): string {
  const entry = table[key];
  return entry ? resolveEntry(entry, mode, kind) : `⟦${key}⟧`;
}

/** {@link resolveText} for one entry. */
export function resolveEntry(entry: StringEntry, mode: ReadingMode = 'full', kind: TextKind = 'narrative'): string {
  if (kind !== 'narrative') return entry.full;
  if (mode === 'easy' && entry.easy !== undefined) return entry.easy;
  if (mode === 'short' && entry.short !== undefined) return entry.short;
  return entry.full;
}

/**
 * Story literals shown in a text's arguments (`either('a', 'b')`, `'To blame ' + $name`) are
 * written in the story's own language. The engine marks each one in the output (between
 * {@link PHRASE_OPEN} and {@link PHRASE_CLOSE}, invisible isolate marks), so the output stays
 * the same in every language; {@link localizeArg} then shows it from the string table, under
 * the key `lit:` + the literal. A literal with no entry is shown as it is.
 */
export const PHRASE_OPEN = '⁨';
export const PHRASE_CLOSE = '⁩';
export const PHRASE_PREFIX = 'lit:';

/** Marks a literal as shown text (see {@link PHRASE_OPEN}). */
export function markPhrase(text: string): string {
  return PHRASE_OPEN + text + PHRASE_CLOSE;
}

/**
 * An output argument in the table's language: each marked literal, and each unmarked part
 * (a variable's value) that is a literal of the table as a whole, from its `lit:` entry.
 */
export function localizeArg(arg: string, table: StringTable): string {
  if (!arg) return arg;
  const parts = arg.split(/⁨([^⁩]*)⁩/);
  return parts.map((part) => (part ? (table[PHRASE_PREFIX + part]?.full ?? part) : part)).join('');
}

export type Span =
  | { t: 'text'; text: string; bold: boolean; italic: boolean }
  | { t: 'icon'; name: string; bold: boolean; italic: boolean }
  | { t: 'newline' };

/**
 * Parses string-table markup into spans:
 *   **bold**  *italic*  {icon:NAME}  {0}  `\` escapes the next character, newline = line break.
 */
export function parseMarkup(src: string, args: readonly string[] = []): Span[] {
  const spans: Span[] = [];
  let bold = false, italic = false, buf = '';
  const flush = () => {
    if (buf) spans.push({ t: 'text', text: buf, bold, italic });
    buf = '';
  };

  for (let i = 0; i < src.length; i++) {
    const c = src[i]!;
    if (c === '\\' && i + 1 < src.length) {
      buf += src[++i];
    } else if (c === '*' && src[i + 1] === '*') {
      flush();
      bold = !bold;
      i++;
    } else if (c === '*') {
      flush();
      italic = !italic;
    } else if (c === '\n') {
      flush();
      spans.push({ t: 'newline' });
    } else if (c === '{') {
      const end = src.indexOf('}', i);
      const inner = end < 0 ? '' : src.slice(i + 1, end);
      if (/^\d+$/.test(inner)) {
        buf += args[Number(inner)] ?? '';
      } else if (inner.startsWith('icon:')) {
        flush();
        spans.push({ t: 'icon', name: inner.slice(5), bold, italic });
      } else {
        buf += c;
        continue;
      }
      i = end;
    } else {
      buf += c;
    }
  }
  flush();
  return spans;
}

/** Escapes characters that have a meaning in markup. */
export function escapeMarkup(s: string): string {
  return s.replace(/[\\*{}]/g, (c) => '\\' + c);
}
