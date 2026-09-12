package com.frenchvoyage.akademie.catalog;

import com.frenchvoyage.akademie.catalog.entity.Exercise;
import com.frenchvoyage.akademie.catalog.entity.ExerciseOption;
import com.frenchvoyage.akademie.catalog.entity.ExerciseText;
import com.frenchvoyage.akademie.catalog.entity.ExerciseType;
import com.frenchvoyage.akademie.catalog.entity.Lesson;
import com.frenchvoyage.akademie.catalog.entity.LessonSection;
import com.frenchvoyage.akademie.catalog.entity.LessonText;
import com.frenchvoyage.akademie.catalog.entity.Level;
import com.frenchvoyage.akademie.catalog.entity.LevelText;
import com.frenchvoyage.akademie.catalog.entity.MediaType;
import com.frenchvoyage.akademie.catalog.entity.SectionText;
import com.frenchvoyage.akademie.catalog.entity.SectionType;
import com.frenchvoyage.akademie.catalog.entity.Unit;
import com.frenchvoyage.akademie.catalog.entity.UnitText;
import com.frenchvoyage.akademie.catalog.entity.VocabularyItem;
import com.frenchvoyage.akademie.catalog.entity.VocabularyText;
import com.frenchvoyage.akademie.catalog.repository.LessonRepository;
import com.frenchvoyage.akademie.catalog.repository.LevelRepository;
import com.frenchvoyage.akademie.catalog.repository.UnitRepository;
import com.frenchvoyage.akademie.common.NotFoundException;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.junit.jupiter.MockitoSettings;
import org.mockito.quality.Strictness;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
@MockitoSettings(strictness = Strictness.LENIENT)
@DisplayName("Lecture du catalogue académique")
class CatalogServiceTest {

    @Mock
    private LevelRepository levelRepository;

    @Mock
    private UnitRepository unitRepository;

    @Mock
    private LessonRepository lessonRepository;

    private CatalogService catalogService;
    private Lesson lesson;
    private Unit unit;
    private Level level;

    @BeforeEach
    void setUp() {
        catalogService = new CatalogService(levelRepository, unitRepository, lessonRepository);
        buildCatalog();
    }

    @Test
    @DisplayName("les niveaux comptent uniquement les unités et leçons publiées")
    void levelsCountOnlyPublishedContent() {
        when(levelRepository.findAllByOrderByPositionAsc()).thenReturn(List.of(level));

        var levels = catalogService.listLevels("fr");

        assertThat(levels).hasSize(1);
        assertThat(levels.get(0).code()).isEqualTo("A1");
        assertThat(levels.get(0).name()).isEqualTo("A1 — Débutant");
        assertThat(levels.get(0).unitCount()).isEqualTo(1);
        assertThat(levels.get(0).lessonCount()).isEqualTo(1);
    }

    @Test
    @DisplayName("une langue absente retombe sur l'anglais")
    void unknownLocaleFallsBackToEnglish() {
        when(levelRepository.findAllByOrderByPositionAsc()).thenReturn(List.of(level));

        var levels = catalogService.listLevels("de");

        assertThat(levels.get(0).name()).isEqualTo("A1 — Beginner");
    }

    @Test
    @DisplayName("un niveau inconnu est signalé comme introuvable")
    void unknownLevelIsRejected() {
        when(levelRepository.findByCodeIgnoreCase("Z9")).thenReturn(Optional.empty());

        assertThatThrownBy(() -> catalogService.listUnits("Z9", "fr"))
                .isInstanceOf(NotFoundException.class);
    }

    @Test
    @DisplayName("les unités portent la liste ordonnée de leurs leçons publiées")
    void unitsCarryTheirLessons() {
        when(levelRepository.findByCodeIgnoreCase("a1")).thenReturn(Optional.of(level));
        when(unitRepository.findPublishedByLevelCode("A1")).thenReturn(List.of(unit));
        when(lessonRepository.findByUnitIdAndPublishedTrueOrderByPositionAsc(1L)).thenReturn(List.of(lesson));

        var units = catalogService.listUnits("a1", "fr");

        assertThat(units).hasSize(1);
        assertThat(units.get(0).title()).isEqualTo("Premiers pas");
        assertThat(units.get(0).lessons()).hasSize(1);
        assertThat(units.get(0).lessons().get(0).title()).isEqualTo("Se présenter");
        assertThat(units.get(0).lessons().get(0).exerciseCount()).isEqualTo(1);
    }

    @Test
    @DisplayName("le détail d'une leçon expose sections, vocabulaire et exercices")
    void lessonDetailExposesContent() {
        when(lessonRepository.findBySlugAndPublishedTrue("a1-u1-l01")).thenReturn(Optional.of(lesson));

        var detail = catalogService.getLesson("a1-u1-l01", "fr");

        assertThat(detail.title()).isEqualTo("Se présenter");
        assertThat(detail.levelCode()).isEqualTo("A1");
        assertThat(detail.unitTitle()).isEqualTo("Premiers pas");
        assertThat(detail.maxScore()).isEqualTo(1);
        assertThat(detail.sections()).singleElement().satisfies(section -> {
            assertThat(section.type()).isEqualTo(SectionType.GRAMMAR.name());
            assertThat(section.mediaType()).isEqualTo(MediaType.VIDEO.name());
            assertThat(section.title()).isEqualTo("Le verbe être");
        });
        assertThat(detail.vocabulary()).singleElement().satisfies(item -> {
            assertThat(item.term()).isEqualTo("Bonjour");
            assertThat(item.translation()).isEqualTo("Bonjour (salutation du jour)");
        });
        assertThat(detail.exercises()).singleElement().satisfies(exercise -> {
            assertThat(exercise.prompt()).isEqualTo("Complétez : … étudiant.");
            assertThat(exercise.options()).hasSize(2);
        });
    }

    @Test
    @DisplayName("la bonne réponse ne figure jamais dans la charge utile envoyée au client")
    void correctAnswerIsNeverExposed() {
        when(lessonRepository.findBySlugAndPublishedTrue("a1-u1-l01")).thenReturn(Optional.of(lesson));

        var detail = catalogService.getLesson("a1-u1-l01", "fr");

        assertThat(detail.exercises().get(0).options())
                .extracting(Object::toString)
                .noneMatch(text -> text.contains("correct=true"));
    }

    @Test
    @DisplayName("une leçon non publiée reste introuvable")
    void unpublishedLessonIsNotFound() {
        when(lessonRepository.findBySlugAndPublishedTrue("brouillon")).thenReturn(Optional.empty());

        assertThatThrownBy(() -> catalogService.getLesson("brouillon", "fr"))
                .isInstanceOf(NotFoundException.class);
    }

    // ------------------------------------------------------------------

    private void buildCatalog() {
        level = new Level();
        level.setId(1L);
        level.setCode("A1");
        level.setPosition(1);
        level.setPublished(true);
        level.setTranslations(Map.of(
                "fr", new LevelText("A1 — Débutant", "Niveau découverte"),
                "en", new LevelText("A1 — Beginner", "Discovery level")));

        unit = new Unit();
        unit.setId(1L);
        unit.setSlug("a1-unit-1");
        unit.setPosition(1);
        unit.setPublished(true);
        unit.setLevel(level);
        unit.setTranslations(Map.of(
                "fr", new UnitText("Premiers pas", "Se présenter et compter"),
                "en", new UnitText("First steps", "Introduce yourself and count")));

        lesson = new Lesson();
        lesson.setId(10L);
        lesson.setSlug("a1-u1-l01");
        lesson.setPosition(1);
        lesson.setPublished(true);
        lesson.setEstimatedMinutes(30);
        lesson.setUnit(unit);
        lesson.setTranslations(Map.of(
                "fr", new LessonText("Se présenter", "Dire son nom", "Se présenter simplement"),
                "en", new LessonText("Introducing yourself", "Say your name", "Introduce yourself simply")));

        LessonSection section = new LessonSection();
        section.setId(50L);
        section.setLesson(lesson);
        section.setPosition(1);
        section.setSectionType(SectionType.GRAMMAR);
        section.setMediaUrl("https://example.org/video");
        section.setMediaType(MediaType.VIDEO);
        section.setTranslations(Map.of("fr", new SectionText("Le verbe être", "je suis, tu es, il est")));
        lesson.setSections(List.of(section));

        VocabularyItem item = new VocabularyItem();
        item.setId(60L);
        item.setLesson(lesson);
        item.setPosition(1);
        item.setTerm("Bonjour");
        item.setPhonetic("[bɔ̃.ʒuʁ]");
        item.setTranslations(Map.of(
                "fr", new VocabularyText("Bonjour (salutation du jour)", null),
                "en", new VocabularyText("Hello, good morning", null)));
        lesson.setVocabulary(List.of(item));

        Exercise exercise = new Exercise();
        exercise.setId(100L);
        exercise.setLesson(lesson);
        exercise.setPosition(1);
        exercise.setExerciseType(ExerciseType.MULTIPLE_CHOICE);
        exercise.setPoints(1);
        exercise.setTranslations(Map.of("fr",
                new ExerciseText("Complétez : … étudiant.", "« Je suis » vient du verbe être.")));
        exercise.setOptions(List.of(
                option(1001L, exercise, 1, "Je suis", true),
                option(1002L, exercise, 2, "J'ai", false)));
        lesson.setExercises(List.of(exercise));

        unit.setLessons(List.of(lesson));
        level.setUnits(List.of(unit));
    }

    private ExerciseOption option(Long id, Exercise exercise, int position, String label, boolean correct) {
        ExerciseOption option = new ExerciseOption();
        option.setId(id);
        option.setExercise(exercise);
        option.setPosition(position);
        option.setLabel(label);
        option.setCorrect(correct);
        return option;
    }
}
