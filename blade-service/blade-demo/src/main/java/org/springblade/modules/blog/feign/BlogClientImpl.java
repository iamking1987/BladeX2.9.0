package org.springblade.modules.blog.feign;

import lombok.AllArgsConstructor;
import org.springblade.core.tool.api.R;
import org.springblade.modules.blog.entity.Blog;
import org.springblade.modules.blog.service.IBlogService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@AllArgsConstructor   //总体注入作用
public class BlogClientImpl implements BlogClient {

	private IBlogService blogService;

	@Override
	@GetMapping(API_PREFIX+"/detail")
	public R<Blog> detail(Long id) {

//		int i=100/0;
		return R.data(blogService.getById(id));
	}


}
