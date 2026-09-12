#!/usr/bin/env python3
"""Génère les migrations Flyway de contenu à partir des fichiers JSON de `content/`.

Le contenu académique est rédigé en JSON — format lisible par un professeur,
sans une ligne de SQL — puis converti en migrations versionnées. Le SQL produit
est commité : Flyway reste la seule source de vérité au démarrage, et ce script
n'est nécessaire que pour retoucher le contenu.

    python tools/generate_seed.py            # régénère toutes les unités
    python tools/generate_seed.py --check    # échoue si le SQL commité est périmé

Les insertions passent par des sous-requêtes sur les `slug` : aucun identifiant
technique n'est écrit en dur, les migrations restent donc rejouables sur une
base vierge quel que soit l'ordre des séquences.
"""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CONTENT_DIR = ROOT / "content" / "a1"
MIGRATION_DIR = ROOT / "backend" / "src" / "main" / "resources" / "db" / "migration"

# V1 = schéma, V2 = niveaux. Le contenu commence donc à V3.
FIRST_CONTENT_VERSION = 3

LOCALES = ("en", "fr")

TRUE_FALSE_LABELS = {
    "Vrai": {"en": "True", "fr": "Vrai"},
    "Faux": {"en": "False", "fr": "Faux"},
}


def quote(value) -> str:
    """Littéral SQL : NULL, ou chaîne avec apostrophes doublées."""
    if value is None:
        return "NULL"
    if isinstance(value, bool):
        return "TRUE" if value else "FALSE"
    if isinstance(value, int):
        return str(value)
    return "'" + str(value).replace("'", "''") + "'"


def text_for(field: dict | None, locale: str) -> str | None:
    if not field:
        return None
    return field.get(locale) or field.get("en")


class UnitWriter:
    def __init__(self, unit: dict):
        self.unit = unit
        self.slug = unit["slug"]
        self.lines: list[str] = []

    def emit(self, line: str = "") -> None:
        self.lines.append(line)

    # -- unité ---------------------------------------------------------
    def write_unit(self) -> None:
        unit = self.unit
        self.emit(f"-- Unité {unit['position']} : {text_for(unit['title'], 'fr')}")
        self.emit(
            "INSERT INTO units (level_id, slug, position, published)\n"
            f"SELECT id, {quote(self.slug)}, {unit['position']}, {quote(unit.get('published', True))}\n"
            f"FROM levels WHERE code = {quote(unit.get('level', 'A1'))};"
        )
        self.emit()
        for locale in LOCALES:
            self.emit(
                "INSERT INTO unit_translations (unit_id, locale, title, description)\n"
                f"SELECT id, {quote(locale)}, {quote(text_for(unit['title'], locale))}, "
                f"{quote(text_for(unit.get('description'), locale))}\n"
                f"FROM units WHERE slug = {quote(self.slug)};"
            )
        self.emit()

    # -- leçons --------------------------------------------------------
    def write_lesson(self, lesson: dict) -> None:
        slug = lesson["slug"]
        self.emit("-- " + "-" * 66)
        self.emit(f"-- Leçon {lesson['position']} : {text_for(lesson['title'], 'fr')}")
        self.emit("-- " + "-" * 66)
        self.emit(
            "INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)\n"
            f"SELECT id, {quote(slug)}, {lesson['position']}, {lesson.get('minutes', 25)}, "
            f"{quote(lesson.get('published', True))}\n"
            f"FROM units WHERE slug = {quote(self.slug)};"
        )
        self.emit()
        for locale in LOCALES:
            self.emit(
                "INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)\n"
                f"SELECT id, {quote(locale)}, {quote(text_for(lesson['title'], locale))}, "
                f"{quote(text_for(lesson.get('summary'), locale))}, "
                f"{quote(text_for(lesson.get('objective'), locale))}\n"
                f"FROM lessons WHERE slug = {quote(slug)};"
            )
        self.emit()

        for index, section in enumerate(lesson.get("sections", []), start=1):
            self.write_section(slug, index, section)
        for index, item in enumerate(lesson.get("vocabulary", []), start=1):
            self.write_vocabulary(slug, index, item)
        for index, exercise in enumerate(lesson.get("exercises", []), start=1):
            self.write_exercise(slug, index, exercise)

    def write_section(self, lesson_slug: str, position: int, section: dict) -> None:
        media = section.get("media") or {}
        self.emit(
            "INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)\n"
            f"SELECT id, {position}, {quote(section['type'])}, {quote(media.get('url'))}, "
            f"{quote(media.get('type'))}\n"
            f"FROM lessons WHERE slug = {quote(lesson_slug)};"
        )
        for locale in LOCALES:
            self.emit(
                "INSERT INTO lesson_section_translations (section_id, locale, title, body)\n"
                f"SELECT s.id, {quote(locale)}, {quote(text_for(section['title'], locale))}, "
                f"{quote(text_for(section.get('body'), locale))}\n"
                "FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id\n"
                f"WHERE l.slug = {quote(lesson_slug)} AND s.position = {position};"
            )
        self.emit()

    def write_vocabulary(self, lesson_slug: str, position: int, item: dict) -> None:
        self.emit(
            "INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)\n"
            f"SELECT id, {position}, {quote(item['term'])}, {quote(item.get('phonetic'))}, "
            f"{quote(item.get('example'))}\n"
            f"FROM lessons WHERE slug = {quote(lesson_slug)};"
        )
        for locale in LOCALES:
            gloss = text_for(item["gloss"], locale)
            self.emit(
                "INSERT INTO vocabulary_translations (item_id, locale, translation, note)\n"
                f"SELECT v.id, {quote(locale)}, {quote(gloss)}, {quote(text_for(item.get('note'), locale))}\n"
                "FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id\n"
                f"WHERE l.slug = {quote(lesson_slug)} AND v.position = {position};"
            )
        self.emit()

    def write_exercise(self, lesson_slug: str, position: int, exercise: dict) -> None:
        self.emit(
            "INSERT INTO exercises (lesson_id, position, exercise_type, points)\n"
            f"SELECT id, {position}, {quote(exercise['type'])}, {exercise.get('points', 1)}\n"
            f"FROM lessons WHERE slug = {quote(lesson_slug)};"
        )
        for locale in LOCALES:
            self.emit(
                "INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)\n"
                f"SELECT e.id, {quote(locale)}, {quote(text_for(exercise['prompt'], locale))}, "
                f"{quote(text_for(exercise.get('explanation'), locale))}\n"
                "FROM exercises e JOIN lessons l ON l.id = e.lesson_id\n"
                f"WHERE l.slug = {quote(lesson_slug)} AND e.position = {position};"
            )

        for option_index, option in enumerate(exercise.get("options", []), start=1):
            label, correct = option[0], option[1]
            overrides = option[2] if len(option) > 2 else TRUE_FALSE_LABELS.get(label)
            self.emit(
                "INSERT INTO exercise_options (exercise_id, position, label, correct)\n"
                f"SELECT e.id, {option_index}, {quote(label)}, {quote(correct)}\n"
                "FROM exercises e JOIN lessons l ON l.id = e.lesson_id\n"
                f"WHERE l.slug = {quote(lesson_slug)} AND e.position = {position};"
            )
            for locale, translated in (overrides or {}).items():
                self.emit(
                    "INSERT INTO exercise_option_translations (option_id, locale, label)\n"
                    f"SELECT o.id, {quote(locale)}, {quote(translated)}\n"
                    "FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id\n"
                    "JOIN lessons l ON l.id = e.lesson_id\n"
                    f"WHERE l.slug = {quote(lesson_slug)} AND e.position = {position} "
                    f"AND o.position = {option_index};"
                )

        for answer in exercise.get("answers", []):
            self.emit(
                "INSERT INTO exercise_answers (exercise_id, normalized_answer)\n"
                f"SELECT e.id, {quote(answer)}\n"
                "FROM exercises e JOIN lessons l ON l.id = e.lesson_id\n"
                f"WHERE l.slug = {quote(lesson_slug)} AND e.position = {position};"
            )
        self.emit()

    def render(self) -> str:
        unit = self.unit
        header = [
            "-- " + "=" * 66,
            f"-- Contenu académique — niveau A1, unité {unit['position']}",
            f"-- {text_for(unit['title'], 'fr')}",
            "--",
            "-- FICHIER GÉNÉRÉ. Ne pas modifier à la main : éditer",
            f"--   content/a1/unit-{unit['position']}.json",
            "-- puis relancer  python tools/generate_seed.py",
            "-- " + "=" * 66,
            "",
        ]
        self.lines = []
        self.write_unit()
        for lesson in unit["lessons"]:
            self.write_lesson(lesson)
        return "\n".join(header + self.lines).rstrip() + "\n"


def validate(unit: dict, path: Path) -> list[str]:
    """Contrôles de cohérence pédagogique avant génération."""
    problems: list[str] = []
    slugs: set[str] = set()

    for lesson in unit["lessons"]:
        where = f"{path.name} / {lesson.get('slug', '?')}"
        if lesson["slug"] in slugs:
            problems.append(f"{where} : slug en double")
        slugs.add(lesson["slug"])

        for locale in LOCALES:
            if not text_for(lesson["title"], locale):
                problems.append(f"{where} : titre manquant en « {locale} »")

        if not lesson.get("exercises"):
            problems.append(f"{where} : aucune activité de vérification")

        for index, exercise in enumerate(lesson.get("exercises", []), start=1):
            kind = exercise["type"]
            options = exercise.get("options", [])
            answers = exercise.get("answers", [])
            if kind in ("MULTIPLE_CHOICE", "TRUE_FALSE"):
                correct = [option for option in options if option[1]]
                if len(correct) != 1:
                    problems.append(
                        f"{where} / exercice {index} : il faut exactement une bonne réponse, "
                        f"{len(correct)} trouvée(s)"
                    )
                if len(options) < 2:
                    problems.append(f"{where} / exercice {index} : moins de deux options")
            elif kind == "FILL_BLANK":
                if not answers:
                    problems.append(f"{where} / exercice {index} : aucune réponse attendue")
                if options:
                    problems.append(f"{where} / exercice {index} : un texte à trous n'a pas d'options")
            else:
                problems.append(f"{where} / exercice {index} : type inconnu « {kind} »")

    return problems


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true",
                        help="vérifie que le SQL commité correspond au JSON, sans rien écrire")
    args = parser.parse_args()

    sources = sorted(CONTENT_DIR.glob("unit-*.json"))
    if not sources:
        print(f"Aucun contenu trouvé dans {CONTENT_DIR}", file=sys.stderr)
        return 1

    stale = False
    lesson_total = 0

    for path in sources:
        unit = json.loads(path.read_text(encoding="utf-8"))

        problems = validate(unit, path)
        if problems:
            print("Contenu invalide :", file=sys.stderr)
            for problem in problems:
                print(f"  - {problem}", file=sys.stderr)
            return 1

        version = FIRST_CONTENT_VERSION + unit["position"] - 1
        target = MIGRATION_DIR / f"V{version}__seed_a1_unit{unit['position']}.sql"
        sql = UnitWriter(unit).render()
        lesson_total += len(unit["lessons"])

        if args.check:
            current = target.read_text(encoding="utf-8") if target.exists() else ""
            if current != sql:
                print(f"PÉRIMÉ : {target.relative_to(ROOT)}", file=sys.stderr)
                stale = True
            continue

        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(sql, encoding="utf-8")
        print(f"{target.relative_to(ROOT)} — {len(unit['lessons'])} leçons")

    if args.check:
        if stale:
            print("Relancez : python tools/generate_seed.py", file=sys.stderr)
            return 1
        print(f"SQL à jour ({lesson_total} leçons).")
    else:
        print(f"Total : {lesson_total} leçons générées.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
