package com.frenchvoyage.akademie.config;

import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/** Documentation de l'API, exposée sur /swagger-ui.html et /v3/api-docs. */
@Configuration
public class OpenApiConfig {

    public static final String BEARER_SCHEME = "bearerAuth";

    @Bean
    public OpenAPI frenchVoyageOpenApi() {
        return new OpenAPI()
                .info(new Info()
                        .title("French Voyage Akademie — API")
                        .version("1.0.0")
                        .description("""
                                API REST de la plateforme gratuite d'apprentissage du français.

                                Toutes les ressources de contenu acceptent le paramètre `locale`
                                (`en` ou `fr`) ; en son absence, la langue de l'en-tête
                                `Accept-Language` est utilisée, avec `en` comme valeur de repli.
                                """)
                        .contact(new Contact()
                                .name("Raul Antonio Gamero Navarrete")
                                .email("raul.a.gamero@gmail.com"))
                        .license(new License().name("MIT").url("https://opensource.org/licenses/MIT")))
                .components(new Components().addSecuritySchemes(BEARER_SCHEME,
                        new SecurityScheme()
                                .type(SecurityScheme.Type.HTTP)
                                .scheme("bearer")
                                .bearerFormat("JWT")
                                .description("Jeton obtenu via POST /api/v1/auth/login")))
                .addSecurityItem(new SecurityRequirement().addList(BEARER_SCHEME));
    }
}
