package com.frenchvoyage.akademie.user;

import com.frenchvoyage.akademie.security.AuthenticatedUser;
import com.frenchvoyage.akademie.user.dto.ChangePasswordRequest;
import com.frenchvoyage.akademie.user.dto.UpdateProfileRequest;
import com.frenchvoyage.akademie.user.dto.UserProfileResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/** Profil de l'apprenant connecté et exercice de ses droits RGPD. */
@RestController
@RequestMapping("/api/v1/me")
@Tag(name = "Profil", description = "Compte de l'apprenant connecté")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    @Operation(summary = "Consulter son profil",
            description = "Droit d'accès aux données personnelles (RGPD, art. 15).")
    public ResponseEntity<UserProfileResponse> profile(@AuthenticationPrincipal AuthenticatedUser principal) {
        return ResponseEntity.ok(UserProfileResponse.from(userService.requireById(principal.getId())));
    }

    @PutMapping
    @Operation(summary = "Mettre à jour son nom d'affichage et sa langue d'interface",
            description = "Droit de rectification (RGPD, art. 16).")
    public ResponseEntity<UserProfileResponse> update(@AuthenticationPrincipal AuthenticatedUser principal,
                                                      @Valid @RequestBody UpdateProfileRequest request) {
        return ResponseEntity.ok(UserProfileResponse.from(
                userService.updateProfile(principal.getId(), request)));
    }

    @PostMapping("/password")
    @Operation(summary = "Changer son mot de passe")
    public ResponseEntity<Void> changePassword(@AuthenticationPrincipal AuthenticatedUser principal,
                                               @Valid @RequestBody ChangePasswordRequest request) {
        userService.changePassword(principal.getId(), request);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping
    @Operation(summary = "Supprimer définitivement son compte",
            description = "Droit à l'effacement (RGPD, art. 17). Supprime aussi toute la progression associée.")
    public ResponseEntity<Void> deleteAccount(@AuthenticationPrincipal AuthenticatedUser principal) {
        userService.deleteAccount(principal.getId());
        return ResponseEntity.noContent().build();
    }
}
