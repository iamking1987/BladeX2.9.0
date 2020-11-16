/*
 *      Copyright (c) 2018-2028, DreamLu All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions are met:
 *
 *  Redistributions of source code must retain the above copyright notice,
 *  this list of conditions and the following disclaimer.
 *  Redistributions in binary form must reproduce the above copyright
 *  notice, this list of conditions and the following disclaimer in the
 *  documentation and/or other materials provided with the distribution.
 *  Neither the name of the dreamlu.net developer nor the names of its
 *  contributors may be used to endorse or promote products derived from
 *  this software without specific prior written permission.
 *  Author: DreamLu 卢春梦 (596392912@qq.com)
 */
package org.springblade.admin.config;

import de.codecentric.boot.admin.server.config.AdminServerProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
import org.springframework.security.config.web.server.ServerHttpSecurity;
import org.springframework.security.web.server.SecurityWebFilterChain;
import org.springframework.security.web.server.authentication.RedirectServerAuthenticationSuccessHandler;

import java.net.URI;

/**
 * 监控安全配置
 *
 * @author L.cm
 */
@EnableWebFluxSecurity
@Configuration(proxyBeanMethods = false)
public class SecurityConfiguration {
	private final String contextPath;

	public SecurityConfiguration(AdminServerProperties adminServerProperties) {
		this.contextPath = adminServerProperties.getContextPath();
	}

	@Bean
	public SecurityWebFilterChain securityWebFilterChain(ServerHttpSecurity http) {
		// @formatter:off
		RedirectServerAuthenticationSuccessHandler successHandler = new RedirectServerAuthenticationSuccessHandler();
		successHandler.setLocation(URI.create(contextPath + "/"));
		return http.headers().frameOptions().disable().and()
			.authorizeExchange()
			.pathMatchers(
				contextPath + "/assets/**"
				, contextPath + "/login"
				, contextPath + "/actuator/**"
			).permitAll()
			.anyExchange().authenticated().and()
			.formLogin().loginPage(contextPath + "/login")
			.authenticationSuccessHandler(successHandler).and()
			.logout().logoutUrl(contextPath + "/logout").and()
			.httpBasic().disable()
			.csrf().disable()
			.build();
		// @formatter:on
	}

}
