import { ChangeDetectionStrategy, Component, computed, inject, input } from '@angular/core';
import { parseMarkup } from '@chronicle/engine';

type Span = ReturnType<typeof parseMarkup>[number];
import { Library } from '../../../../core/services/library';

/** Renders string-table markup: **bold**, *italic*, {icon:NAME}, {0} placeholders. */
@Component({
  selector: 'cr-rich-text',
  changeDetection: ChangeDetectionStrategy.OnPush,
  templateUrl: './rich-text.html',
  styleUrl: './rich-text.css',
})
export class RichText {
  protected readonly library = inject(Library);
  readonly text = input.required<string>();
  readonly args = input<string[]>([]);

  /**
   * Punctuation right after an icon moves into the icon's span (`tail`), so it can't wrap away.
   * An icon on a line of its own (a scenario box, a location) is a picture: `alone`, shown large.
   */
  protected readonly spans = computed(() => {
    const spans: (Span & { tail?: string; alone?: boolean })[] = parseMarkup(
      this.text(),
      this.args(),
    );
    const glued = spans.map((span, i) => {
      const next = spans[i + 1];
      if (span.t !== 'icon' || next?.t !== 'text') return span;
      const tail = /^[.,;:!?)\]…]+/.exec(next.text)?.[0];
      if (!tail) return span;
      spans[i + 1] = { ...next, text: next.text.slice(tail.length) };
      return { ...span, tail };
    });
    /** Whether only blanks lie between the span at `i` and a line break (or the text's edge). */
    const lineEdge = (i: number, step: 1 | -1): boolean => {
      let span = glued[i];
      while (span?.t === 'text' && !span.text.trim()) span = glued[(i += step)];
      return !span || span.t === 'newline';
    };
    return glued.map((span, i) =>
      span.t === 'icon' && !span.tail && lineEdge(i - 1, -1) && lineEdge(i + 1, 1)
        ? { ...span, alone: true }
        : span,
    );
  });

  protected iconLabel(name: string): string {
    return name
      .replace(/^S\d_/, '')
      .replace(/_?Icon$/i, '')
      .replace(/_/g, ' ')
      .replace(/([a-z])([A-Z])/g, '$1 $2');
  }
}
