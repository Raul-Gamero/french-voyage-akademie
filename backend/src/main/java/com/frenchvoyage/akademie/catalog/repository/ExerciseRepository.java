package com.frenchvoyage.akademie.catalog.repository;

import com.frenchvoyage.akademie.catalog.entity.Exercise;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ExerciseRepository extends JpaRepository<Exercise, Long> {

    List<Exercise> findByLessonIdOrderByPositionAsc(Long lessonId);
}
