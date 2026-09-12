package com.frenchvoyage.akademie.progress.repository;

import com.frenchvoyage.akademie.progress.entity.LessonProgress;
import com.frenchvoyage.akademie.progress.entity.ProgressStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface LessonProgressRepository extends JpaRepository<LessonProgress, Long> {

    Optional<LessonProgress> findByUserIdAndLessonId(Long userId, Long lessonId);

    @Query("""
            SELECT p FROM LessonProgress p
            JOIN FETCH p.lesson l
            JOIN FETCH l.unit u
            WHERE p.user.id = :userId
            ORDER BY u.position ASC, l.position ASC
            """)
    List<LessonProgress> findAllByUser(@Param("userId") Long userId);

    long countByUserIdAndStatus(Long userId, ProgressStatus status);

    @Query("SELECT COALESCE(SUM(p.score), 0) FROM LessonProgress p WHERE p.user.id = :userId")
    int totalScore(@Param("userId") Long userId);
}
