package org.springblade.flowable.engine.config;

import lombok.extern.slf4j.Slf4j;
import org.flowable.ui.common.properties.FlowableRestAppProperties;
import org.flowable.ui.common.security.ActuatorRequestMatcher;
import org.flowable.ui.common.security.DefaultPrivileges;
import org.flowable.ui.modeler.properties.FlowableModelerAppProperties;
import org.springframework.boot.actuate.autoconfigure.security.servlet.EndpointRequest;
import org.springframework.boot.actuate.health.HealthEndpoint;
import org.springframework.boot.actuate.info.InfoEndpoint;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;

/**
 * SecurityConfiguration
 *
 * @author Chill
 */
@Slf4j
@Configuration
@EnableWebSecurity
public class SecurityConfiguration {

	@Configuration
	@Order(1)
	public static class ApiWebSecurityConfigurationAdapter extends WebSecurityConfigurerAdapter {

		protected final FlowableRestAppProperties restAppProperties;
		protected final FlowableModelerAppProperties modelerAppProperties;

		public ApiWebSecurityConfigurationAdapter(FlowableRestAppProperties restAppProperties,
												  FlowableModelerAppProperties modelerAppProperties) {
			this.restAppProperties = restAppProperties;
			this.modelerAppProperties = modelerAppProperties;
		}

		@Override
		protected void configure(HttpSecurity http) throws Exception {

			http
				.sessionManagement()
				.sessionCreationPolicy(SessionCreationPolicy.STATELESS)
				.and()
				.csrf()
				.disable();

			http.antMatcher("/**").authorizeRequests().antMatchers("/**").permitAll();


		}
	}

	@ConditionalOnClass(EndpointRequest.class)
	@Configuration
	@Order(5)
	public static class ActuatorWebSecurityConfigurationAdapter extends WebSecurityConfigurerAdapter {

		@Override
		protected void configure(HttpSecurity http) throws Exception {

			http
				.sessionManagement()
				.sessionCreationPolicy(SessionCreationPolicy.STATELESS)
				.and()
				.csrf()
				.disable();

			http
				.requestMatcher(new ActuatorRequestMatcher())
				.authorizeRequests()
				.requestMatchers(EndpointRequest.to(InfoEndpoint.class, HealthEndpoint.class)).authenticated()
				.requestMatchers(EndpointRequest.toAnyEndpoint()).hasAnyAuthority(DefaultPrivileges.ACCESS_ADMIN)
				.and().httpBasic();
		}
	}
}
