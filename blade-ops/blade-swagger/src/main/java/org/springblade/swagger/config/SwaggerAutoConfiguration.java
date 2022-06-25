package org.springblade.swagger.config;

import com.github.xiaoymin.knife4j.spring.annotations.EnableKnife4j;
import org.springblade.core.swagger.SwaggerProperties;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.Profile;
import springfox.bean.validators.configuration.BeanValidatorPluginsConfiguration;


@Configuration
@EnableKnife4j
//@Profile({"dev","test"})
@Import(BeanValidatorPluginsConfiguration.class)
public class SwaggerAutoConfiguration {

	private static final  String DEFAULT_EXCLUDE_PATH ="/error";
	private static final  String BASE_PATH ="/**";

	@Bean
	@ConditionalOnMissingBean
	public SwaggerProperties swaggerProperties(){
		return new SwaggerProperties() ;
	}
}
