import {
  PHRASE_PREFIX,
  type Scenario,
  type ScenarioExtras,
  type StringTable,
} from '@chronicle/engine';

/** Everything the app needs to play one scenario (served from `/content/<id>/`). */
export interface ScenarioContent {
  scenario: Scenario;
  strings: StringTable;
  extras: ScenarioExtras;
}

export const SCENARIOS = [
  { id: 'cost-of-disease', title: 'The Cost of Disease' },
  { id: 'fear-of-the-unknown', title: 'Fear of the Unknown' },
  { id: 'a-time-of-war', title: 'A Time of War' },
  // Not from the original: a fan-made scenario (content/the-thinning-veil/src).
  { id: 'the-thinning-veil', title: 'The Thinning Veil' },
] as const;
export type ScenarioId = (typeof SCENARIOS)[number]['id'];

export function isScenarioId(id: unknown): id is ScenarioId {
  return SCENARIOS.some((s) => s.id === id);
}

async function json<T>(url: string, signal?: AbortSignal): Promise<T> {
  const res = await fetch(url, { signal });
  if (!res.ok) throw new Error(`Could not load ${url} (${res.status})`);
  return (await res.json()) as T;
}

/**
 * A scenario with its texts in `language`. A text not translated yet keeps its English entry
 * (all versions of it), so a page never mixes two languages in one text.
 */
export async function loadContent(
  id: ScenarioId,
  language = 'en',
  signal?: AbortSignal,
): Promise<ScenarioContent> {
  const base = `content/${id}`;
  const [scenario, strings, translated, extras] = await Promise.all([
    json<Scenario>(`${base}/scenario.json`, signal),
    json<StringTable>(`${base}/strings.en.json`, signal),
    language === 'en'
      ? {}
      : json<StringTable>(`${base}/strings.${language}.json`, signal).catch((e: unknown) => {
          if (signal?.aborted) throw e;
          return {};
        }),
    json<ScenarioExtras>(`${base}/extras.json`, signal),
  ]);
  // The English table's `lit:` entries are for a story written in another language: they
  // translate its literals into English, so they don't apply to any other language.
  if (language !== 'en')
    for (const key in strings) if (key.startsWith(PHRASE_PREFIX)) delete strings[key];
  return { scenario, strings: { ...strings, ...translated }, extras };
}
