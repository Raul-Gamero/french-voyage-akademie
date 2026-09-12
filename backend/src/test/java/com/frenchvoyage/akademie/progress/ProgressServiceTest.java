package com.frenchvoyage.akademie.progress;

import com.frenchvoyage.akademie.catalog.entity.Exercise;
import com.frenchvoyage.akademie.catalog.entity.ExerciseAnswer;
import com.frenchvoyage.akademie.catalog.entity.ExerciseOption;
import com.frenchvoyage.akademie.catalog.entity.ExerciseText;
import com.frenchvoyage.akademie.catalog.entity.ExerciseType;
import com.frenchvoyage.akademie.catalog.entity.Lesson;
import com.frenchvoyage.akademie.catalog.entity.LessonText;
import com.frenchvoyage.akademie.catalog.entity.Level;
import com.frenchvoyage.akademie.catalog.entity.Unit;
import com.frenchvoyage.akademie.catalog.repository.ExerciseRepository;
import com.frenchvoyage.akademie.catalog.repository.LessonRepository;
import com.frenchvoyage.akademie.common.NotFoundException;
import com.frenchvoyage.akademie.progress.dto.AnswerResultResponse;
import com.frenchvoyage.akademie.progress.dto.LessonProgressResponse;
import com.frenchvoyage.akademie.progress.dto.SubmitAnswerRequest;
import com.frenchvoyage.akademie.progress.entity.ExerciseAttempt;
import com.frenchvoyage.akademie.progress.entity.LessonProgress;
import com.frenchvoyage.akademie.progress.entity.ProgressStatus;
import com.frenchvoyage.akademie.progress.repository.ExerciseAttemptRepository;
import com.frenchvoyage.akademie.progress.repository.LessonProgressRepository;
import com.frenchvoyage.akademie.user.User;
import com.frenchvoyage.akademie.user.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.junit.jupiter.MockitoSettings;
import org.mockito.quality.Strictness;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
@MockitoSettings(strictness = Strictness.LENIENT)
@DisplayName("Suivi de la progression et correction des exercices")
class ProgressServiceTest {

    private static final long USER_ID = 7L;
    private static final String SLUG = "a1-u1-l01-se-presenter";

    @Mock
    private LessonRepository lessonRepository;

    @Mock
    private ExerciseRepository exerciseRepository;

    @Mock
    private LessonProgressRepository progressRepository;

    @Mock
    private ExerciseAttemptRepository attemptRepository;

    @Mock
    private UserRepository userRepository;

    private ProgressService progressService;
    private Lesson lesson;
    private Exercise multipleChoice;
    private Exercise fillBlank;

    @BeforeEach
    void setUp() {
        progressService = new ProgressService(lessonRepository, exerciseRepository,
                progressRepository, attemptRepository, userRepository);

        lesson = buildLesson();
        multipleChoice = lesson.getExercises().get(0);
        fillBlank = lesson.getExercises().get(1);

        when(lessonRepository.findBySlugAndPublishedTrue(SLUG)).thenReturn(Optional.of(lesson));
        when(userRepository.findById(USER_ID)).thenReturn(Optional.of(buildUser()));
        when(progressRepository.save(any(LessonProgress.class)))
                .thenAnswer(invocation -> invocation.getArgument(0));
        when(attemptRepository.save(any(ExerciseAttempt.class)))
                .thenAnswer(invocation -> invocation.getArgument(0));
    }

    @Test
    @DisplayName("commencer une leçon crée une progression au score maximal attendu")
    void startLessonCreatesProgress() {
        when(progressRepository.findByUserIdAndLessonId(USER_ID, 10L)).thenReturn(Optional.empty());

        LessonProgressResponse response = progressService.startLesson(USER_ID, SLUG, "fr");

        assertThat(response.status()).isEqualTo(ProgressStatus.IN_PROGRESS.name());
        assertThat(response.maxScore()).isEqualTo(3);
        assertThat(response.score()).isZero();
        assertThat(response.lessonTitle()).isEqualTo("Se présenter");
    }

    @Test
    @DisplayName("commencer deux fois la même leçon ne crée pas de doublon")
    void startLessonIsIdempotent() {
        LessonProgress existing = buildProgress(2, ProgressStatus.IN_PROGRESS);
        when(progressRepository.findByUserIdAndLessonId(USER_ID, 10L)).thenReturn(Optional.of(existing));

        LessonProgressResponse response = progressService.startLesson(USER_ID, SLUG, "en");

        assertThat(response.score()).isEqualTo(2);
        verify(progressRepository, org.mockito.Mockito.never()).save(any());
    }

    @Test
    @DisplayName("une leçon inconnue ou non publiée est introuvable")
    void unknownLessonIsRejected() {
        when(lessonRepository.findBySlugAndPublishedTrue("inconnue")).thenReturn(Optional.empty());

        assertThatThrownBy(() -> progressService.startLesson(USER_ID, "inconnue", "fr"))
                .isInstanceOf(NotFoundException.class);
    }

    @Nested
    @DisplayName("Correction")
    class Correction {

        @Test
        @DisplayName("une bonne option de QCM rapporte ses points une seule fois")
        void firstCorrectAnswerScores() {
            when(progressRepository.findByUserIdAndLessonId(USER_ID, 10L))
                    .thenReturn(Optional.of(buildProgress(0, ProgressStatus.IN_PROGRESS)));
            when(attemptRepository.existsByUserIdAndExerciseIdAndCorrectTrue(USER_ID, 100L))
                    .thenReturn(false);

            AnswerResultResponse result = progressService.submitAnswer(
                    USER_ID, SLUG, new SubmitAnswerRequest(100L, "1001"), "fr");

            assertThat(result.correct()).isTrue();
            assertThat(result.pointsAwarded()).isEqualTo(1);
            assertThat(result.lessonScore()).isEqualTo(1);
            assertThat(result.explanation()).isEqualTo("« Je suis » vient du verbe être.");
        }

        @Test
        @DisplayName("refaire un exercice déjà réussi ne rapporte plus de points")
        void repeatedCorrectAnswerScoresNothing() {
            when(progressRepository.findByUserIdAndLessonId(USER_ID, 10L))
                    .thenReturn(Optional.of(buildProgress(1, ProgressStatus.IN_PROGRESS)));
            when(attemptRepository.existsByUserIdAndExerciseIdAndCorrectTrue(USER_ID, 100L))
                    .thenReturn(true);

            AnswerResultResponse result = progressService.submitAnswer(
                    USER_ID, SLUG, new SubmitAnswerRequest(100L, "1001"), "fr");

            assertThat(result.correct()).isTrue();
            assertThat(result.pointsAwarded()).isZero();
            assertThat(result.lessonScore()).isEqualTo(1);
        }

        @Test
        @DisplayName("une mauvaise option est enregistrée comme tentative sans point")
        void wrongAnswerIsRecorded() {
            when(progressRepository.findByUserIdAndLessonId(USER_ID, 10L))
                    .thenReturn(Optional.of(buildProgress(0, ProgressStatus.IN_PROGRESS)));

            AnswerResultResponse result = progressService.submitAnswer(
                    USER_ID, SLUG, new SubmitAnswerRequest(100L, "1002"), "fr");

            assertThat(result.correct()).isFalse();
            assertThat(result.pointsAwarded()).isZero();

            ArgumentCaptor<ExerciseAttempt> captor = ArgumentCaptor.forClass(ExerciseAttempt.class);
            verify(attemptRepository).save(captor.capture());
            assertThat(captor.getValue().isCorrect()).isFalse();
            assertThat(captor.getValue().getSubmittedAnswer()).isEqualTo("1002");
        }

        @Test
        @DisplayName("un texte à trous est corrigé sans tenir compte des accents ni de la casse")
        void fillBlankIgnoresAccentsAndCase() {
            when(progressRepository.findByUserIdAndLessonId(USER_ID, 10L))
                    .thenReturn(Optional.of(buildProgress(0, ProgressStatus.IN_PROGRESS)));
            when(attemptRepository.existsByUserIdAndExerciseIdAndCorrectTrue(USER_ID, 200L))
                    .thenReturn(false);

            AnswerResultResponse result = progressService.submitAnswer(
                    USER_ID, SLUG, new SubmitAnswerRequest(200L, "  Je M'Appelle  "), "fr");

            assertThat(result.correct()).isTrue();
            assertThat(result.pointsAwarded()).isEqualTo(2);
        }

        @Test
        @DisplayName("un exercice d'une autre leçon est refusé")
        void exerciseFromAnotherLessonIsRejected() {
            Lesson other = new Lesson();
            other.setId(99L);
            Exercise foreign = new Exercise();
            foreign.setId(300L);
            foreign.setLesson(other);
            foreign.setExerciseType(ExerciseType.MULTIPLE_CHOICE);
            when(exerciseRepository.findById(300L)).thenReturn(Optional.of(foreign));

            assertThatThrownBy(() -> progressService.submitAnswer(
                    USER_ID, SLUG, new SubmitAnswerRequest(300L, "1"), "fr"))
                    .isInstanceOf(IllegalArgumentException.class);
        }
    }

    @Test
    @DisplayName("terminer une leçon horodate l'achèvement")
    void completeLessonSetsTimestamp() {
        LessonProgress existing = buildProgress(3, ProgressStatus.IN_PROGRESS);
        when(progressRepository.findByUserIdAndLessonId(USER_ID, 10L)).thenReturn(Optional.of(existing));

        LessonProgressResponse response = progressService.completeLesson(USER_ID, SLUG, "fr");

        assertThat(response.status()).isEqualTo(ProgressStatus.COMPLETED.name());
        assertThat(response.completedAt()).isNotNull();
        assertThat(response.percentage()).isEqualTo(100);
    }

    @Test
    @DisplayName("le tableau de bord rapporte l'avancement au nombre de leçons publiées")
    void summaryComputesCompletionPercentage() {
        when(progressRepository.findAllByUser(USER_ID))
                .thenReturn(List.of(buildProgress(3, ProgressStatus.COMPLETED)));
        when(progressRepository.countByUserIdAndStatus(USER_ID, ProgressStatus.COMPLETED)).thenReturn(5L);
        when(progressRepository.countByUserIdAndStatus(USER_ID, ProgressStatus.IN_PROGRESS)).thenReturn(2L);
        when(progressRepository.totalScore(USER_ID)).thenReturn(14);
        when(lessonRepository.countPublished()).thenReturn(10L);

        var summary = progressService.getSummary(USER_ID, "en");

        assertThat(summary.lessonsCompleted()).isEqualTo(5);
        assertThat(summary.lessonsInProgress()).isEqualTo(2);
        assertThat(summary.lessonsAvailable()).isEqualTo(10);
        assertThat(summary.totalScore()).isEqualTo(14);
        assertThat(summary.completionPercentage()).isEqualTo(50);
        assertThat(summary.lessons()).hasSize(1);
    }

    // ------------------------------------------------------------------

    private User buildUser() {
        User user = new User();
        user.setId(USER_ID);
        user.setEmail("marie@example.org");
        user.setDisplayName("Marie");
        return user;
    }

    private LessonProgress buildProgress(int score, ProgressStatus status) {
        LessonProgress progress = new LessonProgress();
        progress.setId(1L);
        progress.setUser(buildUser());
        progress.setLesson(lesson);
        progress.setScore(score);
        progress.setMaxScore(3);
        progress.setStatus(status);
        return progress;
    }

    private Lesson buildLesson() {
        Level level = new Level();
        level.setCode("A1");

        Unit unit = new Unit();
        unit.setId(1L);
        unit.setSlug("a1-unit-1");
        unit.setLevel(level);

        Lesson built = new Lesson();
        built.setId(10L);
        built.setSlug(SLUG);
        built.setPosition(1);
        built.setUnit(unit);
        built.setEstimatedMinutes(30);
        built.setTranslations(Map.of("fr", new LessonText("Se présenter", null, null),
                "en", new LessonText("Introducing yourself", null, null)));

        Exercise qcm = new Exercise();
        qcm.setId(100L);
        qcm.setLesson(built);
        qcm.setPosition(1);
        qcm.setExerciseType(ExerciseType.MULTIPLE_CHOICE);
        qcm.setPoints(1);
        qcm.setTranslations(Map.of("fr",
                new ExerciseText("Complétez : … étudiant.", "« Je suis » vient du verbe être.")));
        qcm.setOptions(List.of(option(1001L, qcm, 1, "Je suis", true), option(1002L, qcm, 2, "J'ai", false)));

        Exercise blank = new Exercise();
        blank.setId(200L);
        blank.setLesson(built);
        blank.setPosition(2);
        blank.setExerciseType(ExerciseType.FILL_BLANK);
        blank.setPoints(2);
        blank.setTranslations(Map.of("fr", new ExerciseText("Écrivez : … Marie.", "On dit « je m'appelle ».")));
        ExerciseAnswer answer = new ExerciseAnswer();
        answer.setId(1L);
        answer.setExercise(blank);
        answer.setNormalizedAnswer("je m'appelle");
        blank.setAnswers(List.of(answer));

        built.setExercises(List.of(qcm, blank));

        when(exerciseRepository.findById(100L)).thenReturn(Optional.of(qcm));
        when(exerciseRepository.findById(200L)).thenReturn(Optional.of(blank));
        return built;
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
