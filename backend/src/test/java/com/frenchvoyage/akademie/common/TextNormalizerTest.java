package com.frenchvoyage.akademie.common;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

import static org.assertj.core.api.Assertions.assertThat;

@DisplayName("Normalisation des réponses libres")
class TextNormalizerTest {

    @ParameterizedTest(name = "\"{0}\" est accepté pour \"{1}\"")
    @CsvSource({
            "Je suis étudiant, je suis etudiant",
            "  ÉCOLE  , ecole",
            "J'habite à Paris., j habite a Paris",
            "ça va, Ca va"
    })
    @DisplayName("accepte les écarts de casse, d'accent et de ponctuation")
    void acceptsToleratedVariations(String submitted, String expected) {
        assertThat(TextNormalizer.matches(submitted, expected)).isTrue();
    }

    @Test
    @DisplayName("refuse une réponse réellement différente")
    void rejectsDifferentAnswer() {
        assertThat(TextNormalizer.matches("je suis", "j'ai")).isFalse();
    }

    @Test
    @DisplayName("refuse une réponse vide, même face à une attente vide")
    void rejectsEmptyAnswers() {
        assertThat(TextNormalizer.matches("", "")).isFalse();
        assertThat(TextNormalizer.matches(null, "bonjour")).isFalse();
    }

    @Test
    @DisplayName("réduit les espaces multiples à un seul")
    void collapsesWhitespace() {
        assertThat(TextNormalizer.normalize("  je    suis   ")).isEqualTo("je suis");
    }
}
