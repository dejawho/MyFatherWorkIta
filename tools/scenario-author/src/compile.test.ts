import assert from 'node:assert/strict';
import { test } from 'node:test';
import { compile } from './compile.ts';
import { parseExpr } from './expr.ts';

test('expressions follow the usual precedence', () => {
  assert.deepEqual(parseExpr('$a + 2 * 3 >= 7 && !$b'), {
    op: '&&',
    a: { op: '>=', a: { op: '+', a: { var: 'a' }, b: { op: '*', a: { lit: 2 }, b: { lit: 3 } } }, b: { lit: 7 } },
    b: { op: 'not', a: { var: 'b' } },
  });
  assert.deepEqual(parseExpr('either($nameA, "x")'), { fn: 'either', args: [{ var: 'nameA' }, { lit: 'x' }] });
  assert.throws(() => parseExpr('$a +'), /unexpected end/);
});

const story = `::vars
velo = 0

::round Uno 1
fine: Il primo Round è finito.
poi: Preparate il secondo.

:: Inizio [intro]
  # **Titolo**
  > Bussano alla porta di {$nameA}.

  ! Scegliete. [[Apri -> Aperto]] [[Ignora ~> zitto]]
  fragment zitto:
    set velo = $velo + 1
    goto Aperto

:: Aperto
  if $velo > 0:
    > Nessuno risponde.
  else:
    > Entra il vento.
  block setup next=Fine:
    ! Prendete un token {icon:StorybookToken}.
  [[Continua... => Fine]]

:: Fine [ending]
  ui endOfRound progress="Uno" next="Inizio"
`;

test('a story compiles into passages, strings and extras', () => {
  const { scenario, strings, extras, problems } = compile('t', [{ name: 'a.story', text: story }]);
  assert.deepEqual(problems, []);
  assert.equal(scenario.start, 'Inizio');
  assert.equal(scenario.variables['velo'], 0);
  assert.equal(scenario.variables['players'], 0);
  const start = scenario.passages['Inizio']!;
  assert.deepEqual(start.tags, ['intro']);
  assert.deepEqual(start.body.map((n) => n.t), ['text', 'br', 'text', 'br', 'br', 'text', 'link', 'link', 'br']);
  assert.deepEqual(start.body[2], { t: 'text', key: 'Inizio.2', kind: 'narrative', args: [{ var: 'nameA' }] });
  assert.equal(strings['Inizio.2']!.full, 'Bussano alla porta di {0}.');
  assert.deepEqual(start.body[7], { t: 'link', key: 'Inizio.5', reveal: 'zitto', replace: true });
  assert.deepEqual(start.fragments['zitto']!.map((n) => n.t), ['set', 'goto']);
  const open = scenario.passages['Aperto']!;
  assert.equal(open.body[0]!.t === 'if' && open.body[0].branches.length, 2);
  assert.deepEqual(open.body.at(-2), { t: 'link', key: 'Aperto.4', to: { lit: 'Fine' }, role: 'continue' });
  assert.deepEqual(extras.endOfRound['Uno'], { round: 1, text: 'round.Uno.end', then: 'round.Uno.then' });
});

test('broken references are reported', () => {
  const { problems } = compile('t', [{ name: 'a.story', text: ':: A\n  [[Via -> Nessuna]]\n  set ignota = 1\n' }]);
  assert.deepEqual(problems, ['a.story:1 (A): no passage "Nessuna"', 'a.story:1 (A): variable ignota not in ::vars']);
});
