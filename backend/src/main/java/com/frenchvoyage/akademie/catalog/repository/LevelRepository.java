package com.frenchvoyage.akademie.catalog.repository;

import com.frenchvoyage.akademie.catalog.entity.Level;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface LevelRepository extends JpaRepository<Level, Long> {

    List<Level> findAllByOrderByPositionAsc();

    Optional<Level> findByCodeIgnoreCase(String code);
}
