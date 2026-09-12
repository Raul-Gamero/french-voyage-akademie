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
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Entrée de vocabulaire rattachée à une leçon.
 *
 * <p>Le champ {@code term} porte le mot français — langue enseignée, donc
 * jamais traduite —, tandis que les gloses vivent dans {@code translations}.</p>
 */
@Entity
@Table(name = "vocabulary_items")
@Getter
@Setter
public class VocabularyItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "lesson_id", nullable = false)
    private Lesson lesson;

    @Column(nullable = false)
    private Integer position;

    @Column(nullable = false, length = 160)
    private String term;

    /** Transcription en alphabet phonétique international. */
    @Column(length = 160)
    private String phonetic;

    @Column(name = "example_sentence", columnDefinition = "text")
    private String exampleSentence;

    @Column(name = "audio_url", columnDefinition = "text")
    private String audioUrl;

    @ElementCollection(fetch = FetchType.LAZY)
    @CollectionTable(name = "vocabulary_translations", joinColumns = @JoinColumn(name = "item_id"))
    @MapKeyColumn(name = "locale", length = 8)
    private Map<String, VocabularyText> translations = new LinkedHashMap<>();
}
