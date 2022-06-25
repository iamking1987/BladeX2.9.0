package org.springblade.modules.blog.feign;

import org.springblade.core.tool.api.R;
import org.springblade.core.tool.utils.DateUtil;
import org.springblade.modules.blog.entity.Blog;
import org.springframework.stereotype.Component;

@Component
public class BlogClientFallback implements BlogClient {
	@Override
	public R<Blog> detail(Long id) {

		Blog blog = new Blog();
		blog.setBlogTitle("Hystrix");
		blog.setBlogContent("Fallback Success");
		blog.setBlogDate(DateUtil.toDateTime(DateUtil.now().toInstant()));
		blog.setIsDeleted(0);
		return R.data(blog);
	}
}
