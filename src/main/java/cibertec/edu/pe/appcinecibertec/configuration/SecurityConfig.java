package cibertec.edu.pe.appcinecibertec.configuration;

import cibertec.edu.pe.appcinecibertec.Service.DetalleUsuarioService;
import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@AllArgsConstructor
public class SecurityConfig {
    private DetalleUsuarioService detalleUsuarioService;

    @Bean
    public BCryptPasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationProvider authenticationProvider(){
        DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
        authenticationProvider.setUserDetailsService(detalleUsuarioService);
        authenticationProvider.setPasswordEncoder(passwordEncoder());
        return authenticationProvider;
    }
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity)
        throws Exception{
        httpSecurity.
                csrf(csrf -> csrf.disable()).authorizeHttpRequests(
                auth ->
                       auth.requestMatchers("/auth/login",
                       "/auth/registrar",
                       "/auth/guardarusuario",
                       "/resource/**",
                       "/static/**",
                       "/css/**",
                       "/js/**").permitAll()
                       .anyRequest().authenticated()

        ).formLogin(
                login ->
                        login.loginPage("/auth/login")
                                .defaultSuccessUrl("/auth/login-success")
                                .usernameParameter("nomusuario")
                                .passwordParameter("password")
        ).authenticationProvider(authenticationProvider());
        return httpSecurity.build();
    }
}
