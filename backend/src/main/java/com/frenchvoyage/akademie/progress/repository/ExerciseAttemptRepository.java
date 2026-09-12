package com.frenchvoyage.akademie.progress.repository;

import com.frenchvoyage.akademie.progress.entity.ExerciseAttempt;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ExerciseAttemptRepository extends JpaRepository<ExerciseAttempt, Long> {

    /** Sert à n'attribuer les points d'un exercice qu'une seule fois. */
    boolean existsByUserIdAndExerciseIdAndCorrectTrue(Long userId, Long exerciseId);

    long countByUserId(Long userId);
}
