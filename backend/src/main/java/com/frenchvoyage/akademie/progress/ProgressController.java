package com.frenchvoyage.akademie.progress;

import com.frenchvoyage.akademie.progress.dto.AnswerResultResponse;
import com.frenchvoyage.akademie.progress.dto.LessonProgressResponse;
import com.frenchvoyage.akademie.progress.dto.ProgressSummaryResponse;
import com.frenchvoyage.akademie.progress.dto.SubmitAnswerRequest;
import com.frenchvoyage.akademie.security.AuthenticatedUser;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * Progression de l'apprenant connecté.
 *
 * <p>Toutes les ressources sont implicitement portées par le jeton : aucun
 * identifiant d'utilisateur ne circule dans l'URL, ce qui rend impossible
 * la lecture de la progression d'autrui.</p>
 */
@RestController
@RequestMapping("/api/v1/progress")
@Tag(name = "Progression", description = "Suivi et évaluation de l'apprenant connecté")
public class ProgressController {

    private final ProgressService progressService;

    public ProgressController(ProgressService progressService) {
        this.progressService = progressService;
    }

    @GetMapping
    @Operation(summary = "Tableau de bord : leçons commencées, terminées et score global")
    public ResponseEntity<ProgressSummaryResponse> summary(
            @AuthenticationPrincipal AuthenticatedUser principal,
            @RequestParam(required = false) String locale,
            @RequestHeader(value = "Accept-Language", required = false) String acceptLanguage) {

        return ResponseEntity.ok(progressService.getSummary(
                principal.getId(), locale != null ? locale : acceptLanguage));
    }

    @GetMapping("/lessons/{slug}")
    @Operation(summary = "Consulter la progression sur une leçon")
    public ResponseEntity<LessonProgressResponse> lessonProgress(
            @AuthenticationPrincipal AuthenticatedUser principal,
            @PathVariable String slug,
            @RequestParam(required = false) String locale,
            @RequestHeader(value = "Accept-Language", required = false) String acceptLanguage) {

        return ResponseEntity.ok(progressService.getLessonProgress(
                principal.getId(), slug, locale != null ? locale : acceptLanguage));
    }

    @PostMapping("/lessons/{slug}/start")
    @Operation(summary = "Commencer une leçon", description = "Opération idempotente : rejouable sans effet de bord.")
    public ResponseEntity<LessonProgressResponse> start(
            @AuthenticationPrincipal AuthenticatedUser principal,
            @PathVariable String slug,
            @RequestParam(required = false) String locale,
            @RequestHeader(value = "Accept-Language", required = false) String acceptLanguage) {

        return ResponseEntity.ok(progressService.startLesson(
                principal.getId(), slug, locale != null ? locale : acceptLanguage));
    }

    @PostMapping("/lessons/{slug}/answers")
    @Operation(summary = "Soumettre la réponse à un exercice",
            description = "Les points ne sont attribués qu'à la première réponse correcte.")
    public ResponseEntity<AnswerResultResponse> submit(
            @AuthenticationPrincipal AuthenticatedUser principal,
            @PathVariable String slug,
            @Valid @RequestBody SubmitAnswerRequest request,
            @RequestParam(required = false) String locale,
            @RequestHeader(value = "Accept-Language", required = false) String acceptLanguage) {

        return ResponseEntity.ok(progressService.submitAnswer(
                principal.getId(), slug, request, locale != null ? locale : acceptLanguage));
    }

    @PostMapping("/lessons/{slug}/complete")
    @Operation(summary = "Marquer une leçon comme terminée")
    public ResponseEntity<LessonProgressResponse> complete(
            @AuthenticationPrincipal AuthenticatedUser principal,
            @PathVariable String slug,
            @RequestParam(required = false) String locale,
            @RequestHeader(value = "Accept-Language", required = false) String acceptLanguage) {

        return ResponseEntity.ok(progressService.completeLesson(
                principal.getId(), slug, locale != null ? locale : acceptLanguage));
    }
}
