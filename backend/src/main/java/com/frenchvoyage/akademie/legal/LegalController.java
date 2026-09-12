package com.frenchvoyage.akademie.legal;

import com.frenchvoyage.akademie.common.LocaleSupport;
import com.frenchvoyage.akademie.common.NotFoundException;
import com.frenchvoyage.akademie.config.AppProperties;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirements;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Set;

/**
 * Textes légaux : politique de confidentialité et mentions légales.
 *
 * <p>Servis par l'API plutôt que figés dans le client, afin qu'une mise à jour
 * de la politique s'applique immédiatement à la PWA déjà installée. La version
 * publiée accompagne le texte : c'est elle qui est enregistrée avec le
 * consentement de chaque personne.</p>
 */
@RestController
@RequestMapping("/api/v1/legal")
@Tag(name = "Mentions légales", description = "Politique de confidentialité et mentions légales")
@SecurityRequirements
public class LegalController {

    private static final Set<String> DOCUMENTS = Set.of("privacy", "terms");

    private final AppProperties properties;

    public LegalController(AppProperties properties) {
        this.properties = properties;
    }

    @GetMapping("/{document}")
    @Operation(summary = "Lire un document légal",
            description = "Documents disponibles : `privacy` (confidentialité) et `terms` (mentions légales).")
    public ResponseEntity<LegalDocumentResponse> read(
            @PathVariable String document,
            @RequestParam(required = false) String locale,
            @RequestHeader(value = "Accept-Language", required = false) String acceptLanguage) {

        if (!DOCUMENTS.contains(document)) {
            throw NotFoundException.of("Document légal", document);
        }

        String resolved = LocaleSupport.normalize(locale != null ? locale : acceptLanguage);
        String body = load(document, resolved);

        return ResponseEntity.ok(new LegalDocumentResponse(
                document, resolved, properties.privacyPolicyVersion(), body));
    }

    private String load(String document, String locale) {
        ClassPathResource resource = new ClassPathResource("legal/%s.%s.md".formatted(document, locale));
        ClassPathResource fallback = new ClassPathResource(
                "legal/%s.%s.md".formatted(document, LocaleSupport.DEFAULT_LOCALE));

        ClassPathResource selected = resource.exists() ? resource : fallback;
        try (var input = selected.getInputStream()) {
            return new String(input.readAllBytes(), StandardCharsets.UTF_8);
        } catch (IOException ex) {
            throw NotFoundException.of("Document légal", document);
        }
    }

    /** Document légal et version à laquelle un consentement se rattache. */
    public record LegalDocumentResponse(String document, String locale, String version, String body) {
    }
}
