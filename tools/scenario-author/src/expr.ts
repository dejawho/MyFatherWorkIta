/**
 * Expressions as written in story sources, parsed into the engine's `Expr`:
 * `$var`, numbers, "strings", true/false, `== != < <= > >= && || + - * / %`, `!x`, `-x`,
 * `( … )`, `[a, b]` (a list) and the engine's functions (`either(a, b)`, `random(1, 6)` …).
 */
import type { BinaryOp, Expr, FnName } from '@chronicle/engine';

const FUNCTIONS: readonly FnName[] = ['either', 'random', 'num', 'str', 'array', 'shuffled', 'max', 'min', 'count', 'replace'];

type Token = { t: 'num'; v: number } | { t: 'str'; v: string } | { t: 'var'; v: string } | { t: 'id'; v: string } | { t: 'op'; v: string };

/** Longest operators first, so `<=` is not read as `<` and `=`. */
const OPERATORS = ['==', '!=', '<=', '>=', '&&', '||', '<', '>', '+', '-', '*', '/', '%', '!', '(', ')', '[', ']', ','];

function tokenize(src: string): Token[] {
  const tokens: Token[] = [];
  let i = 0;
  while (i < src.length) {
    const c = src[i]!;
    if (/\s/.test(c)) {
      i++;
    } else if (/\d/.test(c)) {
      const m = /^\d+(\.\d+)?/.exec(src.slice(i))!;
      tokens.push({ t: 'num', v: Number(m[0]) });
      i += m[0].length;
    } else if (c === '"') {
      let s = '';
      i++;
      while (i < src.length && src[i] !== '"') {
        if (src[i] === '\\') i++;
        s += src[i++];
      }
      if (src[i] !== '"') throw new Error(`unterminated string in: ${src}`);
      i++;
      tokens.push({ t: 'str', v: s });
    } else if (c === '$') {
      const m = /^\$([A-Za-z_]\w*)/.exec(src.slice(i));
      if (!m) throw new Error(`bad variable at "${src.slice(i)}"`);
      tokens.push({ t: 'var', v: m[1]! });
      i += m[0].length;
    } else if (/[A-Za-z_]/.test(c)) {
      const m = /^[A-Za-z_]\w*/.exec(src.slice(i))!;
      tokens.push({ t: 'id', v: m[0] });
      i += m[0].length;
    } else {
      const op = OPERATORS.find((o) => src.startsWith(o, i));
      if (!op) throw new Error(`unexpected "${c}" in: ${src}`);
      tokens.push({ t: 'op', v: op });
      i += op.length;
    }
  }
  return tokens;
}

/** Binding power of each binary operator: higher binds tighter. */
const PRECEDENCE: Record<string, number> = {
  '||': 1, '&&': 2, '==': 3, '!=': 3, '<': 4, '<=': 4, '>': 4, '>=': 4, '+': 5, '-': 5, '*': 6, '/': 6, '%': 6,
};

export function parseExpr(src: string): Expr {
  const tokens = tokenize(src);
  let pos = 0;
  const peek = () => tokens[pos];
  const expect = (v: string) => {
    const t = tokens[pos++];
    if (t?.t !== 'op' || t.v !== v) throw new Error(`expected "${v}" in: ${src}`);
  };
  const list = (close: string): Expr[] => {
    const items: Expr[] = [];
    if (peek()?.t === 'op' && peek()!.v === close) {
      pos++;
      return items;
    }
    for (;;) {
      items.push(binary(0));
      const t = tokens[pos++];
      if (t?.t === 'op' && t.v === close) return items;
      if (t?.t !== 'op' || t.v !== ',') throw new Error(`expected "," or "${close}" in: ${src}`);
    }
  };
  const unary = (): Expr => {
    const t = tokens[pos++];
    if (!t) throw new Error(`unexpected end of: ${src}`);
    switch (t.t) {
      case 'num':
      case 'str':
        return { lit: t.v };
      case 'var':
        return { var: t.v };
      case 'id':
        if (t.v === 'true' || t.v === 'false') return { lit: t.v === 'true' };
        if (!(FUNCTIONS as readonly string[]).includes(t.v)) throw new Error(`unknown function "${t.v}" in: ${src}`);
        expect('(');
        return { fn: t.v as FnName, args: list(')') };
      case 'op':
        if (t.v === '!') return { op: 'not', a: unary() };
        if (t.v === '-') return { op: 'neg', a: unary() };
        if (t.v === '[') return { fn: 'array', args: list(']') };
        if (t.v === '(') {
          const e = binary(0);
          expect(')');
          return e;
        }
    }
    throw new Error(`unexpected "${t.v}" in: ${src}`);
  };
  const binary = (min: number): Expr => {
    let a = unary();
    for (;;) {
      const t = peek();
      const p = t?.t === 'op' ? PRECEDENCE[t.v] : undefined;
      if (p === undefined || p <= min) return a;
      pos++;
      a = { op: t!.v as BinaryOp, a, b: binary(p) };
    }
  };
  const e = binary(0);
  if (pos < tokens.length) throw new Error(`unexpected "${String(tokens[pos]!.v)}" in: ${src}`);
  return e;
}
