/*
 *      Copyright (c) 2018-2028, Chill Zhuang All rights reserved.
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
 *  Author: Chill 庄骞 (smallchill@163.com)
 */
package org.springblade.modules.blog.service.impl;

import org.springblade.modules.blog.entity.Blog;
import org.springblade.modules.blog.vo.BlogVO;
import org.springblade.modules.blog.mapper.BlogMapper;
import org.springblade.modules.blog.service.IBlogService;
import org.springblade.core.mp.base.BaseServiceImpl;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;

/**
 *  服务实现类
 *
 * @author Blade
 * @since 2022-01-29
 */
@Service
public class BlogServiceImpl extends BaseServiceImpl<BlogMapper, Blog> implements IBlogService {

	@Override
	public IPage<BlogVO> selectBlogPage(IPage<BlogVO> page, BlogVO blog) {
		return page.setRecords(baseMapper.selectBlogPage(page, blog));
	}

}
