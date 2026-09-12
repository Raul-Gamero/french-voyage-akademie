import { TestBed } from '@angular/core/testing';
import { DomSanitizer } from '@angular/platform-browser';

import { LessonMarkdownPipe } from './lesson-markdown.pipe';

describe('LessonMarkdownPipe', () => {
  let pipe: LessonMarkdownPipe;
  let sanitizer: DomSanitizer;

  /**
   * Le pipe renvoie un SafeHtml. On l'insère dans un élément réel puis on relit
   * innerHTML : le navigateur resérialise alors les entités (&#234; → ê) comme
   * il le fera à l'écran, ce qui rend les assertions indépendantes de l'encodage.
   */
  function render(markdown: string | null | undefined): string {
    const html = sanitizer.sanitize(1 /* SecurityContext.HTML */, pipe.transform(markdown)) ?? '';
    const container = document.createElement('div');
    container.innerHTML = html;
    return container.innerHTML;
  }

  beforeEach(() => {
    TestBed.configureTestingModule({ providers: [LessonMarkdownPipe] });
    pipe = TestBed.inject(LessonMarkdownPipe);
    sanitizer = TestBed.inject(DomSanitizer);
  });

  it('rend un paragraphe simple', () => {
    expect(render('Bonjour tout le monde.')).toContain('<p>Bonjour tout le monde.</p>');
  });

  it('rend le gras et l’italique', () => {
    const html = render('Le verbe **être** est *irrégulier*.');
    expect(html).toContain('<strong>être</strong>');
    expect(html).toContain('<em>irrégulier</em>');
  });

  it('rend une liste à puces', () => {
    const html = render('- je suis\n- tu es\n- il est');
    expect(html).toContain('<ul>');
    expect(html).toContain('<li>je suis</li>');
    expect(html).toContain('<li>il est</li>');
  });

  it('rend un tableau de conjugaison dans un conteneur défilant', () => {
    const html = render('| personne | être |\n|---|---|\n| je | suis |\n| tu | es |');
    expect(html).toContain('table-wrapper');
    expect(html).toContain('<th>personne</th>');
    expect(html).toContain('<td>suis</td>');
  });

  it('rend une citation', () => {
    expect(render('> Madame, Monsieur,')).toContain('<blockquote>');
  });

  it('échappe le HTML présent dans le contenu', () => {
    const html = render('Tapez <script>alert(1)</script> pour voir.');
    expect(html).not.toContain('<script>');
    expect(html).toContain('&lt;script&gt;');
  });

  it('neutralise une tentative d’injection dans une cellule de tableau', () => {
    const container = document.createElement('div');
    container.innerHTML = render('| a | b |\n|---|---|\n| <img src=x onerror=alert(1)> | ok |');

    // La balise doit rester du texte affiché, jamais devenir un élément du DOM.
    expect(container.querySelector('img')).toBeNull();
    expect(container.querySelector('td')?.textContent).toContain('<img src=x onerror=alert(1)>');
  });

  it('renvoie une chaîne vide sur une entrée absente', () => {
    expect(render(null)).toBe('');
    expect(render(undefined)).toBe('');
    expect(render('')).toBe('');
  });
});
