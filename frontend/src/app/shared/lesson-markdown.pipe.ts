import { Pipe, PipeTransform, SecurityContext, inject } from '@angular/core';
import { DomSanitizer, SafeHtml } from '@angular/platform-browser';

/**
 * Convertit le Markdown restreint des leçons en HTML.
 *
 * <p>Écrit sur mesure plutôt qu'importé d'une bibliothèque, pour trois
 * raisons : le poids (les apprenants visés ont des forfaits de données
 * limités), le contrôle exact de la syntaxe autorisée, et la sécurité —
 * tout le texte est échappé <em>avant</em> l'ajout de la moindre balise,
 * si bien qu'aucun contenu ne peut injecter de HTML.</p>
 *
 * <p>Syntaxe prise en charge : titres de niveau 3, paragraphes, listes à
 * puces et numérotées, citations, tableaux, gras, italique, code en ligne.
 * Tout le reste est rendu littéralement.</p>
 */
@Pipe({
  name: 'lessonMarkdown',
  standalone: true
})
export class LessonMarkdownPipe implements PipeTransform {
  private readonly sanitizer = inject(DomSanitizer);

  transform(markdown: string | null | undefined): SafeHtml {
    if (!markdown) {
      return '';
    }

    const html = this.render(markdown);

    // Ceinture et bretelles : le texte est déjà échappé, mais le contenu
    // repasse par le nettoyage d'Angular avant l'insertion dans le DOM.
    return this.sanitizer.bypassSecurityTrustHtml(
      this.sanitizer.sanitize(SecurityContext.HTML, html) ?? ''
    );
  }

  private render(markdown: string): string {
    const lines = markdown.replace(/\r\n/g, '\n').split('\n');
    const output: string[] = [];

    let index = 0;
    while (index < lines.length) {
      const line = lines[index];

      if (line.trim() === '') {
        index++;
        continue;
      }

      if (this.isTableRow(line) && this.isTableSeparator(lines[index + 1] ?? '')) {
        const [table, next] = this.renderTable(lines, index);
        output.push(table);
        index = next;
        continue;
      }

      if (/^#{1,6}\s+/.test(line)) {
        const text = line.replace(/^#{1,6}\s+/, '');
        output.push(`<h3>${this.renderInline(text)}</h3>`);
        index++;
        continue;
      }

      if (/^>\s?/.test(line)) {
        const [quote, next] = this.renderBlockquote(lines, index);
        output.push(quote);
        index = next;
        continue;
      }

      if (/^[-*]\s+/.test(line)) {
        const [list, next] = this.renderList(lines, index, 'ul', /^[-*]\s+/);
        output.push(list);
        index = next;
        continue;
      }

      if (/^\d+[.)]\s+/.test(line)) {
        const [list, next] = this.renderList(lines, index, 'ol', /^\d+[.)]\s+/);
        output.push(list);
        index = next;
        continue;
      }

      const [paragraph, next] = this.renderParagraph(lines, index);
      output.push(paragraph);
      index = next;
    }

    return output.join('\n');
  }

  private renderTable(lines: string[], start: number): [string, number] {
    const header = this.splitRow(lines[start]);
    let index = start + 2;
    const body: string[] = [];

    while (index < lines.length && this.isTableRow(lines[index])) {
      const cells = this.splitRow(lines[index])
        .map((cell) => `<td>${this.renderInline(cell)}</td>`)
        .join('');
      body.push(`<tr>${cells}</tr>`);
      index++;
    }

    const headerCells = header.map((cell) => `<th>${this.renderInline(cell)}</th>`).join('');
    const table =
      '<div class="table-wrapper"><table>' +
      `<thead><tr>${headerCells}</tr></thead>` +
      `<tbody>${body.join('')}</tbody>` +
      '</table></div>';

    return [table, index];
  }

  private renderBlockquote(lines: string[], start: number): [string, number] {
    const collected: string[] = [];
    let index = start;

    while (index < lines.length && /^>\s?/.test(lines[index])) {
      collected.push(lines[index].replace(/^>\s?/, ''));
      index++;
    }

    const paragraphs = collected
      .join('\n')
      .split(/\n{2,}/)
      .filter((block) => block.trim() !== '')
      .map((block) => `<p>${this.renderInline(block.replace(/\n/g, ' '))}</p>`)
      .join('');

    return [`<blockquote>${paragraphs}</blockquote>`, index];
  }

  private renderList(
    lines: string[],
    start: number,
    tag: 'ul' | 'ol',
    marker: RegExp
  ): [string, number] {
    const items: string[] = [];
    let index = start;

    while (index < lines.length && marker.test(lines[index])) {
      items.push(`<li>${this.renderInline(lines[index].replace(marker, ''))}</li>`);
      index++;
    }

    return [`<${tag}>${items.join('')}</${tag}>`, index];
  }

  private renderParagraph(lines: string[], start: number): [string, number] {
    const collected: string[] = [];
    let index = start;

    while (
      index < lines.length &&
      lines[index].trim() !== '' &&
      !/^#{1,6}\s+/.test(lines[index]) &&
      !/^>\s?/.test(lines[index]) &&
      !/^[-*]\s+/.test(lines[index]) &&
      !/^\d+[.)]\s+/.test(lines[index]) &&
      !this.isTableRow(lines[index])
    ) {
      collected.push(lines[index].trim());
      index++;
    }

    return [`<p>${this.renderInline(collected.join(' '))}</p>`, index];
  }

  /** Le balisage en ligne n'est appliqué qu'après échappement du texte. */
  private renderInline(text: string): string {
    return this.escape(text)
      .replace(/`([^`]+)`/g, '<code>$1</code>')
      .replace(/\*\*([^*]+)\*\*/g, '<strong>$1</strong>')
      .replace(/(^|[^*])\*([^*\n]+)\*/g, '$1<em>$2</em>');
  }

  private escape(text: string): string {
    return text
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;');
  }

  private isTableRow(line: string): boolean {
    return /^\s*\|.*\|\s*$/.test(line);
  }

  private isTableSeparator(line: string): boolean {
    return /^\s*\|[\s:|-]+\|\s*$/.test(line) && line.includes('-');
  }

  private splitRow(line: string): string[] {
    return line
      .trim()
      .replace(/^\|/, '')
      .replace(/\|$/, '')
      .split('|')
      .map((cell) => cell.trim());
  }
}
