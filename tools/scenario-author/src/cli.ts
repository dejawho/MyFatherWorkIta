/**
 * Builds a scenario written as text (content/<id>/src/*.story, read in name order) into the
 * files the app and the tester read: scenario.json, extras.json and the string tables.
 *
 * The story is written in Italian: strings.it.json is the source text. strings.en.json, which the
 * app needs for every key, takes the English text from src/en.json where there is one and the
 * Italian text otherwise (marked `untranslated`), until the translation is done.
 *
 * src/en.json maps each Italian text, as it is in strings.it.json (`{0}` for values filled in
 * during play), to its English text. Keyed by the text rather than by the string key (which
 * changes when passages are edited): an Italian text that changes loses its translation instead
 * of keeping a wrong one. Translations whose Italian text no longer exists are reported. A
 * literal of the story that a page shows (an `either` option) is translated the same way.
 *
 * Usage: node tools/scenario-author/src/cli.ts <id> [--content content] [--check]
 *   --check  fail if the built files are not up to date instead of writing them
 */
import { existsSync, readdirSync, readFileSync, writeFileSync } from 'node:fs';
import { join } from 'node:path';
import { parseArgs } from 'node:util';
import { PHRASE_PREFIX, SETUP_CONTINUE_KEY, type StringTable } from '@chronicle/engine';
import { compile } from './compile.ts';

const { values, positionals } = parseArgs({
  allowPositionals: true,
  options: { content: { type: 'string', default: 'content' }, check: { type: 'boolean', default: false } },
});
const id = positionals[0];
if (!id) {
  console.error('Usage: cli.ts <id> [--content content] [--check]');
  process.exit(2);
}
const dir = join(values.content, id);
const src = join(dir, 'src');
const files = readdirSync(src).filter((f) => f.endsWith('.story')).sort().map((f) => ({ name: f, text: readFileSync(join(src, f), 'utf8') }));
const { scenario, strings, extras, problems } = compile(id, files);
if (problems.length) {
  console.error(problems.map((p) => `  ${p}`).join('\n'));
  console.error(`${problems.length} problem(s) in ${src}`);
  process.exit(1);
}

// Italian text → English text.
const byText: Record<string, string> = existsSync(join(src, 'en.json'))
  ? (JSON.parse(readFileSync(join(src, 'en.json'), 'utf8')) as Record<string, string>)
  : {};
const english: Record<string, string> = { [SETUP_CONTINUE_KEY]: 'Continue' };
for (const [key, entry] of Object.entries(strings)) if (byText[entry.full] !== undefined) english[key] = byText[entry.full]!;
const en: StringTable = Object.fromEntries(
  Object.entries(strings).map(([k, v]) => [k, english[k] !== undefined ? { full: english[k]! } : { full: v.full, untranslated: true }]),
);
// The story's own literals that a page shows (`either('…', '…')`): translated under `lit:`
// (see localizeArg in the engine). Without a translation they stay Italian in English too.
const literals = new Set<string>();
const collect = (x: unknown): void => {
  if (Array.isArray(x)) x.forEach(collect);
  else if (x && typeof x === 'object') {
    if ('lit' in x && typeof x.lit === 'string' && /\p{L}/u.test(x.lit)) literals.add(x.lit);
    Object.values(x).forEach(collect);
  }
};
collect(scenario.passages);
for (const lit of literals) if (byText[lit] !== undefined) en[PHRASE_PREFIX + lit] = { full: byText[lit]! };
const sources = new Set([...Object.values(strings).map((e) => e.full), ...literals]);
const unused = Object.keys(byText).filter((t) => !sources.has(t));
const outputs: Record<string, unknown> = { 'scenario.json': scenario, 'extras.json': extras, 'strings.it.json': strings, 'strings.en.json': en };

let stale = 0;
for (const [file, data] of Object.entries(outputs)) {
  const text = JSON.stringify(data, null, 1) + '\n';
  const path = join(dir, file);
  if (values.check) {
    if (!existsSync(path) || readFileSync(path, 'utf8').replace(/\r\n/g, '\n') !== text) {
      console.error(`  ${path} is not up to date`);
      stale++;
    }
  } else writeFileSync(path, text);
}
const translated = Object.keys(strings).filter((k) => english[k]).length;
console.log(`${id}: ${Object.keys(scenario.passages).length} passages, ${Object.keys(strings).length} strings (${translated} in English)`);
if (unused.length) {
  // Spoiler-free: only how many, and how each starts.
  console.error(`  ${unused.length} translation(s) in src/en.json whose Italian text no longer exists (edited?):`);
  for (const t of unused) console.error(`    "${t.slice(0, 30)}…"`);
}
if (stale) {
  console.error(`${stale} file(s) out of date: run node tools/scenario-author/src/cli.ts ${id}`);
  process.exit(1);
}
