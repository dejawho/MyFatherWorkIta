import assert from 'node:assert/strict';
import { describe, it } from 'node:test';
import { escapeMarkup, localizeArg, markPhrase, parseMarkup, resolveText } from './text.ts';

describe('localizeArg', () => {
  const table = { 'lit:To blame ': { full: 'Dare la colpa a ' }, 'lit:Separatists': { full: 'Separatisti' } };

  it('shows marked literals and whole literal values from the table', () => {
    assert.equal(localizeArg(`${markPhrase('To blame ')}Ada${markPhrase('.')}`, table), 'Dare la colpa a Ada.');
    assert.equal(localizeArg(`${markPhrase('The ')}Separatists`, table), 'The Separatisti');
  });

  it('keeps what the table lacks, without the marks', () => {
    assert.equal(localizeArg(markPhrase('Ada'), table), 'Ada');
    assert.equal(localizeArg('Ada', {}), 'Ada');
  });
});

describe('parseMarkup', () => {
  it('parses bold, italic, icons and placeholders', () => {
    assert.deepEqual(parseMarkup('Give **{0}** a {icon:Heart} *now*', ['Ada']), [
      { t: 'text', text: 'Give ', bold: false, italic: false },
      { t: 'text', text: 'Ada', bold: true, italic: false },
      { t: 'text', text: ' a ', bold: false, italic: false },
      { t: 'icon', name: 'Heart', bold: false, italic: false },
      { t: 'text', text: ' ', bold: false, italic: false },
      { t: 'text', text: 'now', bold: false, italic: true },
    ]);
  });

  it('round-trips escaped characters', () => {
    const raw = 'a * b {c} \\ d';
    assert.deepEqual(parseMarkup(escapeMarkup(raw)), [{ t: 'text', text: raw, bold: false, italic: false }]);
  });
});

describe('resolveText', () => {
  const table = {
    n: { full: 'Long story.', short: 'Short.', shortReviewed: true, easy: 'Easy.' },
    u: { full: 'Long story.' },
    i: { full: 'Gain 5VP.', short: '5VP', shortReviewed: true },
  };

  it('uses short text, reviewed or not, for narrative only', () => {
    assert.equal(resolveText(table, 'n', 'short', 'narrative'), 'Short.');
    assert.equal(resolveText(table, 'u', 'short', 'narrative'), 'Long story.');
    assert.equal(resolveText(table, 'i', 'short', 'instruction'), 'Gain 5VP.');
    assert.equal(resolveText(table, 'n', 'full', 'narrative'), 'Long story.');
  });

  it('uses easy text, reviewed or not, for narrative only', () => {
    assert.equal(resolveText(table, 'n', 'easy', 'narrative'), 'Easy.');
    assert.equal(resolveText(table, 'u', 'easy', 'narrative'), 'Long story.');
    assert.equal(resolveText(table, 'i', 'easy', 'instruction'), 'Gain 5VP.');
  });
});
