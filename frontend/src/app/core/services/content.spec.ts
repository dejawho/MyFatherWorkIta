import type { StringTable } from '@chronicle/engine';
import { loadContent } from './content';

describe('loadContent', () => {
  // A story written in Italian: the English table translates its literals.
  const files: Record<string, unknown> = {
    'scenario.json': {},
    'extras.json': {},
    'strings.en.json': {
      'A.1': { full: 'Hello' },
      'lit:segreto': { full: 'secret' },
    } satisfies StringTable,
    'strings.it.json': { 'A.1': { full: 'Ciao' } } satisfies StringTable,
  };

  beforeEach(() =>
    vi.stubGlobal(
      'fetch',
      async (url: string) => new Response(JSON.stringify(files[url.split('/').pop()!])),
    ),
  );
  afterEach(() => vi.unstubAllGlobals());

  it('shows literals from the English table only in English', async () => {
    expect((await loadContent('the-thinning-veil', 'en')).strings['lit:segreto']?.full).toBe(
      'secret',
    );
    const italian = await loadContent('the-thinning-veil', 'it');
    expect(italian.strings['A.1']?.full).toBe('Ciao');
    expect(italian.strings['lit:segreto']).toBeUndefined();
  });
});
