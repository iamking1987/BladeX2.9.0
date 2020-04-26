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
package org.springblade.flow.filter;

import org.flowable.idm.api.User;
import org.flowable.idm.engine.impl.persistence.entity.UserEntityImpl;
import org.flowable.ui.common.security.SecurityUtils;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static org.springblade.flow.constant.FlowableConstant.*;

/**
 * 用户模拟登录
 *
 * @author Chill
 */
@Component
public class UserHandlerInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, @NonNull HttpServletResponse response, @NonNull Object handler) {
		String servletPath = request.getServletPath();
		if (servletPath.endsWith(CSS) || servletPath.endsWith(JS) || servletPath.endsWith(JPG) || servletPath.endsWith(PNG)) {
			return true;
		}
		if (servletPath.startsWith(APP)) {
			User user = new UserEntityImpl();
			user.setId("admin");
			SecurityUtils.assumeUser(user);
		}
		return true;
	}

	@Override
	public void postHandle(@NonNull HttpServletRequest request, @NonNull HttpServletResponse response, @NonNull Object handler, ModelAndView modelAndView) throws Exception {
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(@NonNull HttpServletRequest request, @NonNull HttpServletResponse response, @NonNull Object handler, Exception ex) throws Exception {
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

}
