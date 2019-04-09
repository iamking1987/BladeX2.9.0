package org.springblade.flowable.config;

import lombok.AllArgsConstructor;
import org.springblade.flowable.filter.CustomHandlerInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 静态资源配置
 *
 * @author Chill
 */
@Configuration
@EnableWebMvc
@AllArgsConstructor
public class StaticResourceConfig implements WebMvcConfigurer {

	private CustomHandlerInterceptor baseInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(baseInterceptor).excludePathPatterns("/static/**");
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/**").addResourceLocations("classpath:/static/");
		registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
	}
}
