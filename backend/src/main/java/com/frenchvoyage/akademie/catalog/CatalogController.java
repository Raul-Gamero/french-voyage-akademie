package com.frenchvoyage.akademie.catalog;

import com.frenchvoyage.akademie.catalog.dto.LessonDetailResponse;
import com.frenchvoyage.akademie.catalog.dto.LevelSummaryResponse;
import com.frenchvoyage.akademie.catalog.dto.UnitSummaryResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.security.SecurityRequirements;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.CacheControl;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.Duration;
import java.util.List;

/**
 * Consultation du contenu académique.
 *
 * <p>Ces ressources sont publiques et mises en cache : elles doivent rester
 * consultables sans compte, et la PWA s'en sert pour son mode hors connexion.</p>
 */
@RestController
@RequestMapping("/api/v1/catalog")
@Tag(name = "Catalogue", description = "Niveaux, unités et leçons")
@SecurityRequirements
public class CatalogController {

    private static final CacheControl PUBLIC_CACHE = CacheControl.maxAge(Duration.ofMinutes(30)).cachePublic();

    private final CatalogService catalogService;

    public CatalogController(CatalogService catalogService) {
        this.catalogService = catalogService;
    }

    @GetMapping("/levels")
    @Operation(summary = "Lister les niveaux CECR et leur état de publication")
    public ResponseEntity<List<LevelSummaryResponse>> listLevels(
            @Parameter(description = "Langue d'affichage : en ou fr")
            @RequestParam(required = false) String locale,
            @RequestHeader(value = "Accept-Language", required = false) String acceptLanguage) {

        return ResponseEntity.ok()
                .cacheControl(PUBLIC_CACHE)
                .body(catalogService.listLevels(locale != null ? locale : acceptLanguage));
    }

    @GetMapping("/levels/{levelCode}/units")
    @Operation(summary = "Lister les unités publiées d'un niveau, avec leurs leçons")
    public ResponseEntity<List<UnitSummaryResponse>> listUnits(
            @PathVariable String levelCode,
            @RequestParam(required = false) String locale,
            @RequestHeader(value = "Accept-Language", required = false) String acceptLanguage) {

        return ResponseEntity.ok()
                .cacheControl(PUBLIC_CACHE)
                .body(catalogService.listUnits(levelCode, locale != null ? locale : acceptLanguage));
    }

    @GetMapping("/lessons/{slug}")
    @Operation(summary = "Consulter une leçon complète",
            description = "Renvoie sections, vocabulaire et exercices. Les corrections ne sont jamais incluses.")
    public ResponseEntity<LessonDetailResponse> getLesson(
            @PathVariable String slug,
            @RequestParam(required = false) String locale,
            @RequestHeader(value = "Accept-Language", required = false) String acceptLanguage) {

        return ResponseEntity.ok()
                .cacheControl(PUBLIC_CACHE)
                .body(catalogService.getLesson(slug, locale != null ? locale : acceptLanguage));
    }
}
