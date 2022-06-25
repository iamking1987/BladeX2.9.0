package org.springblade.modules.blog.config;

import org.springblade.modules.blog.feign.BlogClientFallback;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration     //用相应类上加@compent代替
public class BlogFeignConfig {
	@Bean
	public BlogClientFallback blogClientFallback(){
		return new BlogClientFallback();
	}
}
