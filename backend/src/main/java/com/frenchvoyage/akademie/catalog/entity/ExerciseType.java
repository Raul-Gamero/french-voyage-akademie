package com.frenchvoyage.akademie.catalog.entity;

/**
 * Types d'exercices du niveau A1.
 *
 * <p>Volontairement limités à trois : ils couvrent les descripteurs A1
 * (reconnaître, discriminer, produire une forme courte) et restent
 * corrigibles automatiquement, sans intervention humaine.</p>
 */
public enum ExerciseType {
    /** Choix multiple : une seule option correcte. */
    MULTIPLE_CHOICE,

    /** Vrai ou faux : cas particulier du choix multiple, à deux options. */
    TRUE_FALSE,

    /** Texte à trous : saisie libre comparée après normalisation. */
    FILL_BLANK
}
