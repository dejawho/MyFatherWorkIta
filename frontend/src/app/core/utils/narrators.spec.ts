import { describe, expect, it } from 'vitest';
import { NO_VOICE, narratorsFor, standIn, type VoiceChoice } from './narrators';

const voice = (
  value: string,
  language: string,
  like: 'female' | 'male',
  original = false,
): VoiceChoice => ({
  value,
  label: value,
  original,
  language,
  like,
});
const ALL = [
  voice('female', 'en', 'female', true),
  voice('male', 'en', 'male', true),
  voice('emma', 'en', 'female'),
  voice('george', 'en', 'male'),
  voice('sara', 'it', 'female'),
  voice('nicola', 'it', 'male'),
];
const NONE: VoiceChoice = { value: NO_VOICE, label: 'No voice', original: false, language: '' };
const values = (choices: VoiceChoice[]) => choices.map((c) => c.value);

describe('narratorsFor', () => {
  it('offers the original recordings only with the original English text', () => {
    expect(values(narratorsFor(ALL, 'en', true, NONE))).toEqual([
      'female',
      'male',
      'emma',
      'george',
      'none',
    ]);
    expect(values(narratorsFor(ALL, 'en', false, NONE))).toEqual(['emma', 'george', 'none']);
  });

  it('offers the voices of the chosen language, and always no voice', () => {
    expect(values(narratorsFor(ALL, 'it', false, NONE))).toEqual(['sara', 'nicola', 'none']);
    expect(values(narratorsFor(ALL, 'de', false, NONE))).toEqual(['none']);
  });
});

describe('standIn', () => {
  it('keeps a narrator that can read the text', () => {
    const choices = narratorsFor(ALL, 'it', false, NONE);
    expect(standIn('nicola', choices, ALL)).toBe('nicola');
    expect(standIn(NO_VOICE, choices, ALL)).toBe(NO_VOICE);
  });

  it('swaps a narrator for one like it in the other language and back', () => {
    const italian = narratorsFor(ALL, 'it', false, NONE);
    expect(standIn('female', italian, ALL)).toBe('sara');
    expect(standIn('george', italian, ALL)).toBe('nicola');
    expect(standIn('sara', narratorsFor(ALL, 'en', true, NONE), ALL)).toBe('female');
    expect(standIn('nicola', narratorsFor(ALL, 'en', false, NONE), ALL)).toBe('george');
  });

  it('falls back to the first choice for a voice it does not know', () => {
    expect(standIn('gone', narratorsFor(ALL, 'it', false, NONE), ALL)).toBe('sara');
  });
});
