package com.frenchvoyage.akademie.catalog.repository;

import com.frenchvoyage.akademie.catalog.entity.Unit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface UnitRepository extends JpaRepository<Unit, Long> {

    @Query("""
            SELECT u FROM Unit u
            WHERE u.level.code = :levelCode AND u.published = true
            ORDER BY u.position ASC
            """)
    List<Unit> findPublishedByLevelCode(@Param("levelCode") String levelCode);

    Optional<Unit> findBySlugAndPublishedTrue(String slug);
}
