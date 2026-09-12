package com.frenchvoyage.akademie.catalog.repository;

import com.frenchvoyage.akademie.catalog.entity.Lesson;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface LessonRepository extends JpaRepository<Lesson, Long> {

    Optional<Lesson> findBySlugAndPublishedTrue(String slug);

    List<Lesson> findByUnitIdAndPublishedTrueOrderByPositionAsc(Long unitId);

    /** Toutes les leçons publiées d'un niveau, dans l'ordre du parcours. */
    @Query("""
            SELECT l FROM Lesson l
            JOIN l.unit u
            JOIN u.level lv
            WHERE lv.code = :levelCode AND l.published = true AND u.published = true
            ORDER BY u.position ASC, l.position ASC
            """)
    List<Lesson> findPublishedByLevelCode(@Param("levelCode") String levelCode);

    @Query("SELECT COUNT(l) FROM Lesson l WHERE l.published = true")
    long countPublished();
}
