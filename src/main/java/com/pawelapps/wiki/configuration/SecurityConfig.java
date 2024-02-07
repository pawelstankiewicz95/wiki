package com.pawelapps.wiki.configuration;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.accept.ContentNegotiationStrategy;
import org.springframework.web.accept.HeaderContentNegotiationStrategy;

import static org.springframework.security.config.http.SessionCreationPolicy.STATELESS;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
@RequiredArgsConstructor
public class SecurityConfig {
    private final JwtAuthenticationFilter jwtAuthFilter;

    private final AuthenticationProvider authenticationProvider;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {

        httpSecurity.csrf(csrf -> csrf.disable())
                .authorizeHttpRequests(req ->
                        req.requestMatchers("/api/auth/**").anonymous()
                                .requestMatchers(HttpMethod.GET).anonymous()
                                .anyRequest()
                                .authenticated()
                )
                .sessionManagement(session -> session.sessionCreationPolicy(STATELESS))
                .authenticationProvider(authenticationProvider)
                .addFilterBefore(jwtAuthFilter, UsernamePasswordAuthenticationFilter.class)
        // .logout(logout ->
        //  logout.logoutUrl("/api/v1/auth/logout")
        //     .addLogoutHandler(logoutHandler)
        //       .logoutSuccessHandler((request, response, authentication) -> SecurityContextHolder.clearContext())
        //)
        ;


        // httpSecurity.authorizeHttpRequests((request) -> request
        //          .anyRequest().permitAll()
        //    );
        httpSecurity.setSharedObject(ContentNegotiationStrategy.class, new HeaderContentNegotiationStrategy());
        return httpSecurity.build();
    }

}