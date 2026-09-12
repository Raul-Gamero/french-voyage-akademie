package com.frenchvoyage.akademie.catalog.entity;

import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapKeyColumn;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.util.LinkedHashMap;
import java.util.Map;

/** Bloc de contenu d'une leçon : explication, tableau de conjugaison, vidéo, lecture. */
@Entity
@Table(name = "lesson_sections")
@Getter
@Setter
public class LessonSection {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "lesson_id", nullable = false)
    private Lesson lesson;

    @Column(nullable = false)
    private Integer position;

    @Enumerated(EnumType.STRING)
    @Column(name = "section_type", nullable = false, length = 24)
    private SectionType sectionType;

    @Column(name = "media_url", columnDefinition = "text")
    private String mediaUrl;

    @Enumerated(EnumType.STRING)
    @Column(name = "media_type", length = 16)
    private MediaType mediaType;

    @ElementCollection(fetch = FetchType.LAZY)
    @CollectionTable(name = "lesson_section_translations", joinColumns = @JoinColumn(name = "section_id"))
    @MapKeyColumn(name = "locale", length = 8)
    private Map<String, SectionText> translations = new LinkedHashMap<>();
}
