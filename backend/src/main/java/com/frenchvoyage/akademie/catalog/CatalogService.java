package com.frenchvoyage.akademie.catalog;

import com.frenchvoyage.akademie.catalog.dto.ExerciseOptionResponse;
import com.frenchvoyage.akademie.catalog.dto.ExerciseResponse;
import com.frenchvoyage.akademie.catalog.dto.LessonDetailResponse;
import com.frenchvoyage.akademie.catalog.dto.LessonSummaryResponse;
import com.frenchvoyage.akademie.catalog.dto.LevelSummaryResponse;
import com.frenchvoyage.akademie.catalog.dto.SectionResponse;
import com.frenchvoyage.akademie.catalog.dto.UnitSummaryResponse;
import com.frenchvoyage.akademie.catalog.dto.VocabularyResponse;
import com.frenchvoyage.akademie.catalog.entity.Exercise;
import com.frenchvoyage.akademie.catalog.entity.ExerciseOption;
import com.frenchvoyage.akademie.catalog.entity.ExerciseText;
import com.frenchvoyage.akademie.catalog.entity.Lesson;
import com.frenchvoyage.akademie.catalog.entity.LessonSection;
import com.frenchvoyage.akademie.catalog.entity.LessonText;
import com.frenchvoyage.akademie.catalog.entity.Level;
import com.frenchvoyage.akademie.catalog.entity.LevelText;
import com.frenchvoyage.akademie.catalog.entity.SectionText;
import com.frenchvoyage.akademie.catalog.entity.Unit;
import com.frenchvoyage.akademie.catalog.entity.UnitText;
import com.frenchvoyage.akademie.catalog.entity.VocabularyItem;
import com.frenchvoyage.akademie.catalog.entity.VocabularyText;
import com.frenchvoyage.akademie.catalog.repository.LessonRepository;
import com.frenchvoyage.akademie.catalog.repository.LevelRepository;
import com.frenchvoyage.akademie.catalog.repository.UnitRepository;
import com.frenchvoyage.akademie.common.LocaleSupport;
import com.frenchvoyage.akademie.common.NotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Lecture du catalogue académique.
 *
 * <p>Chaque méthode reçoit la langue demandée et renvoie des objets déjà
 * résolus : le client n'a jamais à choisir entre plusieurs traductions.</p>
 */
@Service
@Transactional(readOnly = true)
public class CatalogService {

    private final LevelRepository levelRepository;
    private final UnitRepository unitRepository;
    private final LessonRepository lessonRepository;

    public CatalogService(LevelRepository levelRepository,
                          UnitRepository unitRepository,
                          LessonRepository lessonRepository) {
        this.levelRepository = levelRepository;
        this.unitRepository = unitRepository;
        this.lessonRepository = lessonRepository;
    }

    public List<LevelSummaryResponse> listLevels(String locale) {
        String resolved = LocaleSupport.normalize(locale);
        return levelRepository.findAllByOrderByPositionAsc().stream()
                .map(level -> toSummary(level, resolved))
                .toList();
    }

    public List<UnitSummaryResponse> listUnits(String levelCode, String locale) {
        String resolved = LocaleSupport.normalize(locale);
        levelRepository.findByCodeIgnoreCase(levelCode)
                .orElseThrow(() -> NotFoundException.of("Niveau", levelCode));

        return unitRepository.findPublishedByLevelCode(levelCode.toUpperCase()).stream()
                .map(unit -> toSummary(unit, resolved))
                .toList();
    }

    public LessonDetailResponse getLesson(String slug, String locale) {
        Lesson lesson = lessonRepository.findBySlugAndPublishedTrue(slug)
                .orElseThrow(() -> NotFoundException.of("Leçon", slug));
        return toDetail(lesson, LocaleSupport.normalize(locale));
    }

    /** Nombre de leçons publiées : alimente l'indicateur de suivi du projet. */
    public long countPublishedLessons() {
        return lessonRepository.countPublished();
    }

    // ------------------------------------------------------------------
    // Conversion entité -> DTO
    // ------------------------------------------------------------------

    private LevelSummaryResponse toSummary(Level level, String locale) {
        LevelText text = LocaleSupport.resolve(level.getTranslations(), locale);
        List<Unit> publishedUnits = level.getUnits().stream().filter(Unit::isPublished).toList();
        int lessonCount = publishedUnits.stream()
                .mapToInt(unit -> (int) unit.getLessons().stream().filter(Lesson::isPublished).count())
                .sum();

        return new LevelSummaryResponse(
                level.getCode(),
                text == null ? level.getCode() : text.getName(),
                text == null ? null : text.getDescription(),
                level.isPublished(),
                publishedUnits.size(),
                lessonCount);
    }

    private UnitSummaryResponse toSummary(Unit unit, String locale) {
        UnitText text = LocaleSupport.resolve(unit.getTranslations(), locale);
        List<LessonSummaryResponse> lessons = lessonRepository
                .findByUnitIdAndPublishedTrueOrderByPositionAsc(unit.getId()).stream()
                .map(lesson -> toSummary(lesson, locale))
                .toList();

        return new UnitSummaryResponse(
                unit.getId(),
                unit.getSlug(),
                unit.getPosition(),
                text == null ? unit.getSlug() : text.getTitle(),
                text == null ? null : text.getDescription(),
                lessons);
    }

    private LessonSummaryResponse toSummary(Lesson lesson, String locale) {
        LessonText text = LocaleSupport.resolve(lesson.getTranslations(), locale);
        return new LessonSummaryResponse(
                lesson.getId(),
                lesson.getSlug(),
                lesson.getPosition(),
                text == null ? lesson.getSlug() : text.getTitle(),
                text == null ? null : text.getSummary(),
                lesson.getEstimatedMinutes(),
                lesson.getExercises().size());
    }

    private LessonDetailResponse toDetail(Lesson lesson, String locale) {
        LessonText text = LocaleSupport.resolve(lesson.getTranslations(), locale);
        Unit unit = lesson.getUnit();
        UnitText unitText = LocaleSupport.resolve(unit.getTranslations(), locale);

        return new LessonDetailResponse(
                lesson.getId(),
                lesson.getSlug(),
                lesson.getPosition(),
                text == null ? lesson.getSlug() : text.getTitle(),
                text == null ? null : text.getSummary(),
                text == null ? null : text.getObjective(),
                lesson.getEstimatedMinutes(),
                unit.getSlug(),
                unitText == null ? unit.getSlug() : unitText.getTitle(),
                unit.getLevel().getCode(),
                lesson.maxScore(),
                lesson.getSections().stream().map(section -> toResponse(section, locale)).toList(),
                lesson.getVocabulary().stream().map(item -> toResponse(item, locale)).toList(),
                lesson.getExercises().stream().map(exercise -> toResponse(exercise, locale)).toList());
    }

    private SectionResponse toResponse(LessonSection section, String locale) {
        SectionText text = LocaleSupport.resolve(section.getTranslations(), locale);
        return new SectionResponse(
                section.getId(),
                section.getPosition(),
                section.getSectionType().name(),
                text == null ? "" : text.getTitle(),
                text == null ? null : text.getBody(),
                section.getMediaUrl(),
                section.getMediaType() == null ? null : section.getMediaType().name());
    }

    private VocabularyResponse toResponse(VocabularyItem item, String locale) {
        VocabularyText text = LocaleSupport.resolve(item.getTranslations(), locale);
        return new VocabularyResponse(
                item.getId(),
                item.getPosition(),
                item.getTerm(),
                item.getPhonetic(),
                text == null ? "" : text.getTranslation(),
                text == null ? null : text.getNote(),
                item.getExampleSentence(),
                item.getAudioUrl());
    }

    private ExerciseResponse toResponse(Exercise exercise, String locale) {
        ExerciseText text = LocaleSupport.resolve(exercise.getTranslations(), locale);
        List<ExerciseOptionResponse> options = exercise.getOptions().stream()
                .map(option -> new ExerciseOptionResponse(
                        option.getId(),
                        option.getPosition(),
                        optionLabel(option, locale)))
                .toList();

        return new ExerciseResponse(
                exercise.getId(),
                exercise.getPosition(),
                exercise.getExerciseType().name(),
                text == null ? "" : text.getPrompt(),
                exercise.getPoints(),
                options);
    }

    private String optionLabel(ExerciseOption option, String locale) {
        String translated = LocaleSupport.resolve(option.getTranslations(), locale);
        return translated == null || translated.isBlank() ? option.getLabel() : translated;
    }
}
