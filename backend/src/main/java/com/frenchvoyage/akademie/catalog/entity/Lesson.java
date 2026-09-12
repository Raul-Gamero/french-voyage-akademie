package com.frenchvoyage.akademie.catalog.entity;

import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapKeyColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OrderBy;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Leçon : la plus petite unité autonome d'apprentissage.
 *
 * <p>Elle est conçue pour être terminée en une session courte — contrainte
 * de micro-apprentissage assumée pour des personnes qui étudient dans les
 * transports ou entre deux démarches administratives.</p>
 */
@Entity
@Table(name = "lessons")
@Getter
@Setter
public class Lesson {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "unit_id", nullable = false)
    private Unit unit;

    @Column(nullable = false, unique = true, length = 90)
    private String slug;

    @Column(nullable = false)
    private Integer position;

    @Column(name = "estimated_minutes", nullable = false)
    private Integer estimatedMinutes = 25;

    @Column(nullable = false)
    private boolean published;

    @ElementCollection(fetch = FetchType.LAZY)
    @CollectionTable(name = "lesson_translations", joinColumns = @JoinColumn(name = "lesson_id"))
    @MapKeyColumn(name = "locale", length = 8)
    private Map<String, LessonText> translations = new LinkedHashMap<>();

    @OneToMany(mappedBy = "lesson", fetch = FetchType.LAZY)
    @OrderBy("position ASC")
    private List<LessonSection> sections = new ArrayList<>();

    @OneToMany(mappedBy = "lesson", fetch = FetchType.LAZY)
    @OrderBy("position ASC")
    private List<VocabularyItem> vocabulary = new ArrayList<>();

    @OneToMany(mappedBy = "lesson", fetch = FetchType.LAZY)
    @OrderBy("position ASC")
    private List<Exercise> exercises = new ArrayList<>();

    /** Score maximal atteignable : somme des points des exercices. */
    public int maxScore() {
        return exercises.stream().mapToInt(Exercise::getPoints).sum();
    }
}
