package com.frenchvoyage.akademie.security;

import com.frenchvoyage.akademie.config.AppProperties;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.stereotype.Service;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.time.Duration;
import java.time.Instant;
import java.util.Date;
import java.util.Optional;

/**
 * Émission et vérification des jetons d'accès.
 *
 * <p>Authentification sans état : aucune session serveur n'est conservée,
 * ce qui permet de redéployer ou de redimensionner l'API sans déconnecter
 * les apprenants.</p>
 */
@Service
public class JwtService {

    private static final String ISSUER = "french-voyage-akademie";
    private static final String CLAIM_USER_ID = "uid";
    private static final String CLAIM_ROLE = "role";

    private final SecretKey signingKey;
    private final Duration validity;

    public JwtService(AppProperties properties) {
        byte[] secret = properties.jwtSecret().getBytes(StandardCharsets.UTF_8);
        if (secret.length < 32) {
            throw new IllegalStateException(
                    "FVA_JWT_SECRET doit comporter au moins 32 caractères pour signer en HMAC-SHA256.");
        }
        this.signingKey = Keys.hmacShaKeyFor(secret);
        this.validity = Duration.ofMinutes(properties.jwtExpirationMinutes());
    }

    public String issueToken(AuthenticatedUser user) {
        Instant now = Instant.now();
        return Jwts.builder()
                .issuer(ISSUER)
                .subject(user.getUsername())
                .claim(CLAIM_USER_ID, user.getId())
                .claim(CLAIM_ROLE, user.getAuthorities().iterator().next().getAuthority())
                .issuedAt(Date.from(now))
                .expiration(Date.from(now.plus(validity)))
                .signWith(signingKey)
                .compact();
    }

    /** Renvoie les revendications si le jeton est authentique et non expiré. */
    public Optional<Claims> parse(String token) {
        try {
            return Optional.of(Jwts.parser()
                    .verifyWith(signingKey)
                    .requireIssuer(ISSUER)
                    .build()
                    .parseSignedClaims(token)
                    .getPayload());
        } catch (JwtException | IllegalArgumentException ex) {
            // Jeton absent, falsifié ou expiré : la requête restera anonyme.
            return Optional.empty();
        }
    }

    public long validitySeconds() {
        return validity.toSeconds();
    }
}
