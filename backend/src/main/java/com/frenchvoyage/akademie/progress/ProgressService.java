package com.frenchvoyage.akademie.progress;

import com.frenchvoyage.akademie.catalog.entity.Exercise;
import com.frenchvoyage.akademie.catalog.entity.ExerciseText;
import com.frenchvoyage.akademie.catalog.entity.Lesson;
import com.frenchvoyage.akademie.catalog.entity.LessonText;
import com.frenchvoyage.akademie.catalog.repository.ExerciseRepository;
import com.frenchvoyage.akademie.catalog.repository.LessonRepository;
import com.frenchvoyage.akademie.common.LocaleSupport;
import com.frenchvoyage.akademie.common.NotFoundException;
import com.frenchvoyage.akademie.progress.dto.AnswerResultResponse;
import com.frenchvoyage.akademie.progress.dto.LessonProgressResponse;
import com.frenchvoyage.akademie.progress.dto.ProgressSummaryResponse;
import com.frenchvoyage.akademie.progress.dto.SubmitAnswerRequest;
import com.frenchvoyage.akademie.progress.entity.ExerciseAttempt;
import com.frenchvoyage.akademie.progress.entity.LessonProgress;
import com.frenchvoyage.akademie.progress.entity.ProgressStatus;
import com.frenchvoyage.akademie.progress.repository.ExerciseAttemptRepository;
import com.frenchvoyage.akademie.progress.repository.LessonProgressRepository;
import com.frenchvoyage.akademie.user.User;
import com.frenchvoyage.akademie.user.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.util.List;

/**
 * Suivi de la progression et évaluation par compétences.
 *
 * <p>Règle de notation : les points d'un exercice ne sont attribués qu'à la
 * première réponse correcte. Réessayer reste donc encouragé — c'est l'objet
 * même d'un exercice — sans permettre de gonfler artificiellement un score.</p>
 */
@Service
public class ProgressService {

    private final LessonRepository lessonRepository;
    private final ExerciseRepository exerciseRepository;
    private final LessonProgressRepository progressRepository;
    private final ExerciseAttemptRepository attemptRepository;
    private final UserRepository userRepository;

    public ProgressService(LessonRepository lessonRepository,
                           ExerciseRepository exerciseRepository,
                           LessonProgressRepository progressRepository,
                           ExerciseAttemptRepository attemptRepository,
                           UserRepository userRepository) {
        this.lessonRepository = lessonRepository;
        this.exerciseRepository = exerciseRepository;
        this.progressRepository = progressRepository;
        this.attemptRepository = attemptRepository;
        this.userRepository = userRepository;
    }

    /** Ouvre (ou retrouve) la progression d'une leçon. Idempotent. */
    @Transactional
    public LessonProgressResponse startLesson(Long userId, String lessonSlug, String locale) {
        Lesson lesson = requireLesson(lessonSlug);
        LessonProgress progress = progressRepository.findByUserIdAndLessonId(userId, lesson.getId())
                .orElseGet(() -> createProgress(userId, lesson));
        return toResponse(progress, LocaleSupport.normalize(locale));
    }

    @Transactional
    public AnswerResultResponse submitAnswer(Long userId, String lessonSlug,
                                             SubmitAnswerRequest request, String locale) {
        Lesson lesson = requireLesson(lessonSlug);
        Exercise exercise = exerciseRepository.findById(request.exerciseId())
                .orElseThrow(() -> NotFoundException.of("Exercice", request.exerciseId()));

        if (!exercise.getLesson().getId().equals(lesson.getId())) {
            throw new IllegalArgumentException("Cet exercice n'appartient pas à la leçon indiquée.");
        }

        LessonProgress progress = progressRepository.findByUserIdAndLessonId(userId, lesson.getId())
                .orElseGet(() -> createProgress(userId, lesson));

        boolean correct = exercise.isCorrect(request.answer());
        boolean alreadyScored = attemptRepository
                .existsByUserIdAndExerciseIdAndCorrectTrue(userId, exercise.getId());
        int pointsAwarded = correct && !alreadyScored ? exercise.getPoints() : 0;

        ExerciseAttempt attempt = new ExerciseAttempt();
        attempt.setUser(requireUser(userId));
        attempt.setExercise(exercise);
        attempt.setSubmittedAnswer(request.answer());
        attempt.setCorrect(correct);
        attempt.setPointsAwarded(pointsAwarded);
        attemptRepository.save(attempt);

        if (pointsAwarded > 0) {
            progress.setScore(progress.getScore() + pointsAwarded);
            progressRepository.save(progress);
        }

        ExerciseText text = LocaleSupport.resolve(exercise.getTranslations(), locale);
        return new AnswerResultResponse(
                exercise.getId(),
                correct,
                pointsAwarded,
                text == null ? null : text.getExplanation(),
                progress.getScore(),
                progress.getMaxScore());
    }

    /** Marque la leçon comme terminée. L'apprenant décide : aucun score minimal n'est exigé. */
    @Transactional
    public LessonProgressResponse completeLesson(Long userId, String lessonSlug, String locale) {
        Lesson lesson = requireLesson(lessonSlug);
        LessonProgress progress = progressRepository.findByUserIdAndLessonId(userId, lesson.getId())
                .orElseGet(() -> createProgress(userId, lesson));

        progress.setStatus(ProgressStatus.COMPLETED);
        if (progress.getCompletedAt() == null) {
            progress.setCompletedAt(Instant.now());
        }
        return toResponse(progressRepository.save(progress), LocaleSupport.normalize(locale));
    }

    @Transactional(readOnly = true)
    public ProgressSummaryResponse getSummary(Long userId, String locale) {
        String resolved = LocaleSupport.normalize(locale);
        List<LessonProgressResponse> lessons = progressRepository.findAllByUser(userId).stream()
                .map(progress -> toResponse(progress, resolved))
                .toList();

        long completed = progressRepository.countByUserIdAndStatus(userId, ProgressStatus.COMPLETED);
        long inProgress = progressRepository.countByUserIdAndStatus(userId, ProgressStatus.IN_PROGRESS);
        long available = lessonRepository.countPublished();
        int completion = available == 0 ? 0 : Math.round((completed * 100f) / available);

        return new ProgressSummaryResponse(
                completed,
                inProgress,
                available,
                progressRepository.totalScore(userId),
                completion,
                lessons);
    }

    @Transactional(readOnly = true)
    public LessonProgressResponse getLessonProgress(Long userId, String lessonSlug, String locale) {
        Lesson lesson = requireLesson(lessonSlug);
        return progressRepository.findByUserIdAndLessonId(userId, lesson.getId())
                .map(progress -> toResponse(progress, LocaleSupport.normalize(locale)))
                .orElseThrow(() -> NotFoundException.of("Progression", lessonSlug));
    }

    // ------------------------------------------------------------------

    private LessonProgress createProgress(Long userId, Lesson lesson) {
        User user = requireUser(userId);

        LessonProgress progress = new LessonProgress();
        progress.setUser(user);
        progress.setLesson(lesson);
        progress.setStatus(ProgressStatus.IN_PROGRESS);
        progress.setScore(0);
        progress.setMaxScore(lesson.maxScore());
        return progressRepository.save(progress);
    }

    private User requireUser(Long userId) {
        return userRepository.findById(userId)
                .orElseThrow(() -> NotFoundException.of("Utilisateur", userId));
    }

    private Lesson requireLesson(String slug) {
        return lessonRepository.findBySlugAndPublishedTrue(slug)
                .orElseThrow(() -> NotFoundException.of("Leçon", slug));
    }

    LessonProgressResponse toResponse(LessonProgress progress, String locale) {
        Lesson lesson = progress.getLesson();
        LessonText text = LocaleSupport.resolve(lesson.getTranslations(), locale);

        return new LessonProgressResponse(
                lesson.getId(),
                lesson.getSlug(),
                text == null ? lesson.getSlug() : text.getTitle(),
                lesson.getUnit().getSlug(),
                progress.getStatus().name(),
                progress.getScore(),
                progress.getMaxScore(),
                progress.percentage(),
                progress.getStartedAt(),
                progress.getCompletedAt());
    }
}
