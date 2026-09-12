package com.frenchvoyage.akademie.auth;

import com.frenchvoyage.akademie.auth.dto.AuthResponse;
import com.frenchvoyage.akademie.auth.dto.LoginRequest;
import com.frenchvoyage.akademie.security.AuthenticatedUser;
import com.frenchvoyage.akademie.security.JwtService;
import com.frenchvoyage.akademie.user.User;
import com.frenchvoyage.akademie.user.UserService;
import com.frenchvoyage.akademie.user.dto.RegisterRequest;
import com.frenchvoyage.akademie.user.dto.UserProfileResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.security.SecurityRequirements;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/** Inscription et connexion. Seuls points d'entrée accessibles sans jeton. */
@RestController
@RequestMapping("/api/v1/auth")
@Tag(name = "Authentification", description = "Création de compte et obtention du jeton d'accès")
@SecurityRequirements
public class AuthController {

    private final UserService userService;
    private final AuthenticationManager authenticationManager;
    private final JwtService jwtService;

    public AuthController(UserService userService,
                          AuthenticationManager authenticationManager,
                          JwtService jwtService) {
        this.userService = userService;
        this.authenticationManager = authenticationManager;
        this.jwtService = jwtService;
    }

    @PostMapping("/register")
    @Operation(summary = "Créer un compte apprenant",
            description = "Le consentement explicite à la politique de confidentialité est obligatoire (RGPD, art. 7).")
    @ApiResponses({
            @ApiResponse(responseCode = "201", description = "Compte créé, jeton délivré"),
            @ApiResponse(responseCode = "400", description = "Champs invalides", content = @io.swagger.v3.oas.annotations.media.Content),
            @ApiResponse(responseCode = "409", description = "Adresse déjà enregistrée", content = @io.swagger.v3.oas.annotations.media.Content)
    })
    public ResponseEntity<AuthResponse> register(@Valid @RequestBody RegisterRequest request) {
        User user = userService.register(request);
        String token = jwtService.issueToken(new AuthenticatedUser(user));

        return ResponseEntity.status(HttpStatus.CREATED)
                .body(AuthResponse.of(token, jwtService.validitySeconds(), UserProfileResponse.from(user)));
    }

    @PostMapping("/login")
    @Operation(summary = "Se connecter et obtenir un jeton d'accès")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Connexion réussie"),
            @ApiResponse(responseCode = "401", description = "Identifiants invalides", content = @io.swagger.v3.oas.annotations.media.Content)
    })
    public ResponseEntity<AuthResponse> login(@Valid @RequestBody LoginRequest request) {
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(request.email(), request.password()));

        AuthenticatedUser principal = (AuthenticatedUser) authentication.getPrincipal();
        User user = userService.requireById(principal.getId());
        userService.recordLogin(user);

        String token = jwtService.issueToken(principal);
        return ResponseEntity.ok(
                AuthResponse.of(token, jwtService.validitySeconds(), UserProfileResponse.from(user)));
    }
}
