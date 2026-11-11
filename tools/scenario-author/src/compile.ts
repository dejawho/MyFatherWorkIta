/**
 * Compiles a story written as text into the engine's data: the scenario, its string table and
 * its extras. One source can be split over several files; they are read in order.
 *
 * Sections:
 *   ::vars                     one `name = value` per line: every story variable and its start value
 *   ::round <progress> <n>     an end-of-round screen (`n` = rounds done, 0 = the generation's last)
 *                              with `fine: …` and `poi: …` lines
 *   :: <Passage> [tag tag]     a passage; its body follows, indented by two spaces per level; the
 *                              tag `voice` marks a page the generated voices read aloud (its
 *                              flavour text outside `if`s, without values filled in during play)
 *   ::for X in A B C | After   repeats the lines up to `::endfor` per item (`%X%`, `%X.n%`,
 *                              `%X.next%` – the next item, `After` for the last)
 *
 * Body lines:
 *   # text  > text  ! text  @ text  @@ text
 *                              title, narrative, instruction, command, hand-over command; a text
 *                              may end with links, shown right after it
 *   [[label -> Passage]]       link; `=>` for a link that only moves on ("Continua…"),
 *                              `~>` to reveal a fragment of this passage in its place
 *   set var = expr | goto target | include Passage | prompt var number|text: question
 *   ui name key=expr … [text: …]
 *                              an app screen (end of round, vote, scoring …); `text:` gives the
 *                              screen its text (the steps of an end of generation)
 *   if expr: / elif expr: / else: / block style [next=Passage] [list=items|steps]:
 *   fragment name:             (top level only) a part revealed by a `~>` link
 *   an empty line              starts a new paragraph
 *   // …                       comment
 *
 * In texts, labels and questions `{$var}` shows a variable's value; other markup (**bold**,
 * *italic*, {icon:NAME}) passes through. A target is a passage name or an expression (`$ending`).
 */
import type { BlockStyle, Expr, Node, Passage, Scenario, ScenarioExtras, StringTable, TextKind, Value } from '@chronicle/engine';
import { APP_VARIABLES, FORMAT_VERSION, SETUP_CONTINUE_KEY } from '@chronicle/engine';
import { parseExpr } from './expr.ts';

export interface SourceFile {
  name: string;
  text: string;
}

export interface Compiled {
  scenario: Scenario;
  strings: StringTable;
  extras: ScenarioExtras;
  problems: string[];
}

interface Line {
  indent: number;
  text: string;
  where: string;
}

const KINDS: Record<string, TextKind> = { '#': 'title', '>': 'narrative', '!': 'instruction', '@': 'command' };
const BLOCK_STYLES: readonly BlockStyle[] = ['setup', 'setupEvent', 'hubTitle', 'hubDetails', 'heading'];
const LINK = /\[\[(.+?)\s*(->|=>|~>)\s*(.+?)\]\]/g;

/** The story starts in the first passage of the first file. */
export function compile(id: string, files: SourceFile[]): Compiled {
  const problems: string[] = [];
  const variables: Record<string, Value> = {
    ...Object.fromEntries(Object.entries(APP_VARIABLES).map(([k, t]) => [k, t === 'number' ? 0 : ''])),
    _SetupImage: '',
  };
  const passages: Record<string, Passage> = {};
  // The app's button that confirms a setup box.
  const strings: StringTable = { [SETUP_CONTINUE_KEY]: { full: 'Continua' } };
  const byText = new Map<string, string>();
  const extras: ScenarioExtras = { endOfRound: {}, logBook: {}, voiceOver: {} };

  /** A string key for this text: the same text always gets the same key. */
  const keyFor = (text: string, wanted: string): string => {
    const known = byText.get(text);
    if (known) return known;
    if (strings[wanted]) throw new Error(`duplicate string key ${wanted}`);
    strings[wanted] = { full: text };
    byText.set(text, wanted);
    return wanted;
  };
  /** `{$var}` → `{n}` plus the argument list. */
  const placeholders = (text: string): { text: string; args?: Expr[] } => {
    const args: Expr[] = [];
    const out = text.replace(/\{\$([A-Za-z_]\w*)\}/g, (_, v: string) => `{${args.push({ var: v }) - 1}}`);
    return args.length ? { text: out, args } : { text: out };
  };
  const target = (src: string): Expr => (/^[$(]/.test(src.trim()) ? parseExpr(src) : { lit: src.trim() });

  // Split every file into sections.
  type Section = { head: string; lines: Line[]; where: string };
  const sections: Section[] = [];
  for (const file of files) {
    expandLoops(file.text.split(/\r?\n/), file.name, problems).forEach(([raw, i]) => {
      const where = `${file.name}:${i + 1}`;
      if (raw.startsWith('::')) return sections.push({ head: raw.slice(2).trim(), lines: [], where });
      if (/^\s*\/\//.test(raw)) return;
      const indent = raw.length - raw.trimStart().length;
      if (raw.trim() && !sections.length) return problems.push(`${where}: text outside a section`);
      sections.at(-1)?.lines.push({ indent: raw.trim() ? indent : -1, text: raw.trim(), where });
    });
  }

  for (const section of sections) {
    if (section.head === 'vars') {
      for (const l of section.lines) {
        if (l.indent < 0) continue;
        const m = /^(\w+)\s*=\s*(.+)$/.exec(l.text);
        if (!m) { problems.push(`${l.where}: expected name = value`); continue; }
        const e = parseExpr(m[2]!);
        if ('lit' in e) variables[m[1]!] = e.lit;
        else if ('fn' in e && e.fn === 'array' && e.args.length === 0) variables[m[1]!] = [];
        else problems.push(`${l.where}: a start value must be a plain value`);
      }
      continue;
    }
    const round = /^round\s+(\S+)\s+(\d+)$/.exec(section.head);
    if (round) {
      const [, progress, n] = round;
      const get = (label: string) => section.lines.find((l) => l.text.startsWith(`${label}:`))?.text.slice(label.length + 1).trim();
      const end = get('fine'), then = get('poi');
      if (!end || !then) { problems.push(`${section.where}: a round needs "fine:" and "poi:"`); continue; }
      extras.endOfRound[progress!] = {
        round: Number(n),
        text: keyFor(end, `round.${progress}.end`),
        then: keyFor(then, `round.${progress}.then`),
      };
      continue;
    }
    const head = /^(\S+)(?:\s+\[([^\]]*)\])?$/.exec(section.head);
    if (!head) { problems.push(`${section.where}: bad passage header`); continue; }
    const name = head[1]!;
    if (passages[name]) { problems.push(`${section.where}: passage ${name} defined twice`); continue; }
    let counter = 0;
    const fragments: Record<string, Node[]> = {};
    const nextKey = () => `${name}.${++counter}`;

    /** Parses lines at one indentation into nodes; nested lines belong to the line above. */
    const parse = (lines: Line[], top: boolean): Node[] => {
      const nodes: Node[] = [];
      let i = 0;
      const base = lines.find((l) => l.indent >= 0)?.indent ?? 0;
      const childrenOf = (at: number): [Line[], number] => {
        let j = at + 1;
        while (j < lines.length && (lines[j]!.indent < 0 || lines[j]!.indent > base)) j++;
        // Trailing empty lines belong to the outer level.
        let end = j;
        while (end > at + 1 && lines[end - 1]!.indent < 0) end--;
        return [lines.slice(at + 1, end), end];
      };
      while (i < lines.length) {
        const l = lines[i]!;
        if (l.indent < 0) {
          if (nodes.length) nodes.push({ t: 'br' });
          i++;
          continue;
        }
        if (l.indent > base) { problems.push(`${l.where}: unexpected indentation`); i++; continue; }
        const text = l.text;
        try {
          let m: RegExpExecArray | null;
          if ((m = /^(if|elif)\s+(.+):$/.exec(text)) || text === 'else:') {
            const [body, next] = childrenOf(i);
            const branch = { ...(m ? { cond: parseExpr(m[2]!) } : {}), body: parse(body, false) };
            const last = nodes.at(-1);
            if (m?.[1] === 'if') nodes.push({ t: 'if', branches: [branch] });
            else if (last?.t === 'if' && last.branches.at(-1)?.cond) last.branches.push(branch);
            else problems.push(`${l.where}: "${text}" without an "if" before it`);
            i = next;
            continue;
          }
          if ((m = /^block\s+(\w+)((?:\s+\w+=\S+)*):$/.exec(text))) {
            const style = m[1] as BlockStyle;
            if (!BLOCK_STYLES.includes(style)) problems.push(`${l.where}: unknown block style ${style}`);
            const opts = Object.fromEntries([...m[2]!.matchAll(/(\w+)=(\S+)/g)].map((x) => [x[1], x[2]]));
            const [body, next] = childrenOf(i);
            nodes.push({
              t: 'block', style, body: parse(body, false),
              ...(opts['next'] ? { next: target(opts['next']) } : {}),
              ...(opts['list'] ? { list: opts['list'] as 'items' | 'steps' } : {}),
            });
            i = next;
            continue;
          }
          if ((m = /^fragment\s+(\S+):$/.exec(text))) {
            if (!top) problems.push(`${l.where}: a fragment must be at the top of the passage`);
            const [body, next] = childrenOf(i);
            fragments[m[1]!] = parse(body, false);
            i = next;
            continue;
          }
          if ((m = /^set\s+(\w+)\s*=\s*(.+)$/.exec(text))) nodes.push({ t: 'set', var: m[1]!, value: parseExpr(m[2]!) });
          else if ((m = /^goto\s+(.+)$/.exec(text))) nodes.push({ t: 'goto', to: target(m[1]!) });
          else if ((m = /^include\s+(.+)$/.exec(text))) nodes.push({ t: 'include', passage: target(m[1]!) });
          else if ((m = /^prompt\s+(\w+)\s+(number|text):\s*(.+)$/.exec(text))) {
            const q = placeholders(m[3]!);
            nodes.push({ t: 'prompt', var: m[1]!, input: m[2] as 'number' | 'text', key: keyFor(q.text, nextKey()), ...(q.args ? { args: q.args } : {}) });
            nodes.push({ t: 'br' });
          } else if ((m = /^ui\s+(\w+)(.*?)(?:\s+text:\s*(.+))?$/.exec(text))) {
            const args: Record<string, Expr> = Object.fromEntries([...m[2]!.matchAll(/(\w+)=("[^"]*"|\S+)/g)].map((x) => [x[1]!, parseExpr(x[2]!)]));
            if (m[3]) args['text'] = { lit: keyFor(m[3], nextKey()) };
            nodes.push({ t: 'ui', ui: m[1]!, ...(Object.keys(args).length ? { args } : {}) });
          } else {
            // A text with links at its end, or links alone.
            const prefix = /^(@@|[#>!@])\s?/.exec(text);
            const body = prefix ? text.slice(prefix[0].length) : text;
            const firstLink = body.search(/\[\[/);
            const before = (firstLink < 0 ? body : body.slice(0, firstLink)).trimEnd();
            if (prefix && before) {
              const p = placeholders(before);
              nodes.push({
                t: 'text', key: keyFor(p.text, nextKey()), kind: KINDS[prefix[1]![0]!]!,
                ...(prefix[1] === '@@' ? { role: 'handover' as const } : {}), ...(p.args ? { args: p.args } : {}),
              });
            } else if (!prefix && firstLink !== 0) {
              throw new Error(`not a statement: ${text}`);
            }
            if (firstLink >= 0) {
              for (const lm of body.slice(firstLink).matchAll(LINK)) {
                const label = placeholders(lm[1]!);
                const link: Node = lm[2] === '~>'
                  ? { t: 'link', key: keyFor(label.text, nextKey()), reveal: lm[3]!.trim(), replace: true }
                  : { t: 'link', key: keyFor(label.text, nextKey()), to: target(lm[3]!), ...(lm[2] === '=>' ? { role: 'continue' as const } : {}) };
                if (label.args) (link as { args?: Expr[] }).args = label.args;
                nodes.push(link);
              }
            }
            nodes.push({ t: 'br' });
          }
        } catch (e) {
          problems.push(`${l.where}: ${(e as Error).message}`);
        }
        i++;
      }
      return nodes;
    };

    while (section.lines.at(-1)?.indent === -1) section.lines.pop();
    const body = parse(section.lines, true);
    const all = head[2]?.split(/\s+/).filter(Boolean) ?? [];
    // `voice`: a page read aloud by the generated voices (tools/voice), not a passage tag.
    if (all.includes('voice')) extras.voiceOver[name] = {};
    const tags = all.filter((t) => t !== 'voice');
    passages[name] = { name, tags, body, fragments, source: { file: section.where.split(':')[0]!, line: Number(section.where.split(':')[1]) } };
  }

  const scenario: Scenario = { format: FORMAT_VERSION, id, start: Object.keys(passages)[0] ?? '', variables, passages };
  problems.push(...check(scenario));
  return { scenario, strings, extras, problems };
}

/**
 * Repeats the lines between `::for X in a b c | after` and `::endfor` once per item, replacing
 * `%X%` with the item, `%X.n%` with its position (from 1) and `%X.next%` with the next item (or
 * `after` for the last). Returns each line with its line number in the file (from 0).
 */
function expandLoops(lines: string[], file: string, problems: string[]): [string, number][] {
  const out: [string, number][] = [];
  for (let i = 0; i < lines.length; i++) {
    const m = /^::for\s+(\w+)\s+in\s+([^|]+?)(?:\s*\|\s*(\S+))?\s*$/.exec(lines[i]!);
    if (!m) {
      out.push([lines[i]!, i]);
      continue;
    }
    const end = lines.findIndex((l, j) => j > i && /^::endfor\s*$/.test(l));
    if (end < 0) {
      problems.push(`${file}:${i + 1}: ::for without ::endfor`);
      break;
    }
    const [, name, list, after = ''] = m;
    const items = list!.trim().split(/\s+/);
    items.forEach((item, n) => {
      for (let j = i + 1; j < end; j++) {
        out.push([
          lines[j]!
            .replaceAll(`%${name}.next%`, items[n + 1] ?? after)
            .replaceAll(`%${name}.n%`, String(n + 1))
            .replaceAll(`%${name}%`, item),
          j,
        ]);
      }
    });
    i = end;
  }
  return out;
}

/** References that cannot work: unknown passages, fragments and variables. */
function check(s: Scenario): string[] {
  const problems: string[] = [];
  const declared = new Set(Object.keys(s.variables));
  const exprVars = (e: Expr | undefined, out: string[] = []): string[] => {
    if (!e) return out;
    if ('var' in e) out.push(e.var);
    if ('a' in e) exprVars(e.a, out);
    if ('b' in e) exprVars(e.b, out);
    if ('args' in e) e.args.forEach((x) => exprVars(x, out));
    if ('at' in e) { exprVars(e.at, out); exprVars(e.key, out); }
    if ('cases' in e) e.cases.forEach((c) => { exprVars(c.cond, out); exprVars(c.value, out); });
    return out;
  };
  const passage = (e: Expr | undefined, where: string) => {
    if (e && 'lit' in e && typeof e.lit === 'string' && !s.passages[e.lit]) problems.push(`${where}: no passage "${e.lit}"`);
  };
  for (const p of Object.values(s.passages)) {
    const where = `${p.source?.file}:${p.source?.line} (${p.name})`;
    const visit = (nodes: Node[]) => {
      for (const n of nodes) {
        const exprs: (Expr | undefined)[] = [];
        switch (n.t) {
          case 'text': case 'prompt': exprs.push(...(n.args ?? [])); break;
          case 'set': exprs.push(n.value); if (!declared.has(n.var)) problems.push(`${where}: variable ${n.var} not in ::vars`); break;
          case 'link':
            exprs.push(...(n.args ?? []), n.to); passage(n.to, where);
            if (n.reveal && !p.fragments[n.reveal]) problems.push(`${where}: no fragment "${n.reveal}"`);
            break;
          case 'goto': exprs.push(n.to); passage(n.to, where); break;
          case 'include': exprs.push(n.passage); passage(n.passage, where); break;
          case 'block': exprs.push(n.next); passage(n.next, where); visit(n.body); break;
          case 'if': n.branches.forEach((b) => { exprs.push(b.cond); visit(b.body); }); break;
          case 'ui': for (const [k, v] of Object.entries(n.args ?? {})) { exprs.push(v); if (k === 'next') passage(v, where); } break;
        }
        if (n.t === 'prompt' && !declared.has(n.var)) problems.push(`${where}: variable ${n.var} not in ::vars`);
        for (const v of exprs.flatMap((e) => exprVars(e))) if (!declared.has(v)) problems.push(`${where}: variable ${v} not in ::vars`);
      }
    };
    visit(p.body);
    Object.values(p.fragments).forEach(visit);
  }
  if (!s.passages[s.start]) problems.push(`start passage "${s.start}" missing`);
  return [...new Set(problems)];
}
