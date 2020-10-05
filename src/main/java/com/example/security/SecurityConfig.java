package com.example.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration	//환경설정파일
@EnableWebSecurity //Security사용
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	CustomUserDetailsService userDetailsService ;
	
	@Bean //BCryptPasswordEncoder BCE = new BCryptPasswordEncoder();
	public BCryptPasswordEncoder BCE() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(BCE()) ;
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/css/**", "/script/**", "/image/**", "/fonts/**", "/lib/**");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http
		.authorizeRequests()
			.antMatchers("/admin", "/admin/*").hasAuthority("ADMIN")
			.antMatchers("/member/edit", "/party/insert", "/party/content", "/review/insert", "/review/content").hasAnyAuthority("ADMIN", "USER")
			.anyRequest().permitAll()
			.and()
		.formLogin()
			.loginPage("/member/login")
			.loginProcessingUrl("/member/loginProcess")
			.permitAll()
			.defaultSuccessUrl("/member/loginSuccess")
			.and()
		.logout()
			.logoutUrl("/member/logout")
			.logoutSuccessUrl("/")
			.invalidateHttpSession(true)
			.clearAuthentication(true)
			.permitAll()
			.and()
		.exceptionHandling().accessDeniedPage("/member/page403");
		
		//보안에 취약함
		http.csrf().disable(); //csrf()를 사용하지 않을 경우
	}

	
}
