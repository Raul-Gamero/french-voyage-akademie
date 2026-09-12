package com.frenchvoyage.akademie.catalog.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/** Textes d'une unité dans une langue donnée. */
@Embeddable
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UnitText {

    @Column(nullable = false, length = 180)
    private String title;

    @Column(columnDefinition = "text")
    private String description;
}
