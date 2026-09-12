package com.frenchvoyage.akademie.common;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.LinkedHashMap;
import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;

@DisplayName("Choix de la langue d'affichage")
class LocaleSupportTest {

    @Test
    @DisplayName("normalise les variantes régionales et les langues non gérées")
    void normalizesRequestedLocale() {
        assertThat(LocaleSupport.normalize("fr-FR")).isEqualTo("fr");
        assertThat(LocaleSupport.normalize("EN")).isEqualTo("en");
        assertThat(LocaleSupport.normalize("de")).isEqualTo("en");
        assertThat(LocaleSupport.normalize(null)).isEqualTo("en");
        assertThat(LocaleSupport.normalize("  ")).isEqualTo("en");
    }

    @Test
    @DisplayName("retient la traduction demandée quand elle existe")
    void resolvesRequestedTranslation() {
        Map<String, String> translations = new LinkedHashMap<>();
        translations.put("en", "Hello");
        translations.put("fr", "Bonjour");

        assertThat(LocaleSupport.resolve(translations, "fr")).isEqualTo("Bonjour");
    }

    @Test
    @DisplayName("se rabat sur l'anglais quand la traduction manque")
    void fallsBackToEnglish() {
        Map<String, String> translations = Map.of("en", "Hello");
        assertThat(LocaleSupport.resolve(translations, "fr")).isEqualTo("Hello");
    }

    @Test
    @DisplayName("renvoie une traduction disponible plutôt que rien")
    void fallsBackToAnyTranslation() {
        Map<String, String> translations = Map.of("fr", "Bonjour");
        assertThat(LocaleSupport.resolve(translations, "en")).isEqualTo("Bonjour");
    }

    @Test
    @DisplayName("renvoie null sur une absence totale de traduction")
    void returnsNullWhenEmpty() {
        assertThat(LocaleSupport.<String>resolve(Map.of(), "fr")).isNull();
        assertThat(LocaleSupport.<String>resolve(null, "fr")).isNull();
    }
}
