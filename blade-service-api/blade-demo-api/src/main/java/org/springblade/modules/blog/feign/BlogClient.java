package org.springblade.modules.blog.feign;

import org.springblade.common.constant.LauncherConstant;
import org.springblade.core.tool.api.R;
import org.springblade.modules.blog.entity.Blog;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
//import org.springblade.modules.blog.entity.Blog;

@FeignClient(
	//定义指向service-id:  blade-demo
	value = LauncherConstant.APPLICATION_DEMO_NAME
//	fallback = BlogClientFallback.class
)
public interface BlogClient {

	String API_PREFIX="/api/blog";

	@GetMapping(API_PREFIX+"/detail")
	R<Blog> detail(@RequestParam("id")Long id);
}
