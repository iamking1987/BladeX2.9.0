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
package org.springblade.auth.service;

import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import org.springblade.auth.constant.AuthConstant;
import org.springblade.auth.enums.BladeUserEnum;
import org.springblade.auth.utils.TokenUtil;
import org.springblade.core.tool.api.R;
import org.springblade.core.tool.utils.Func;
import org.springblade.core.tool.utils.WebUtil;
import org.springblade.system.user.entity.User;
import org.springblade.system.user.entity.UserInfo;
import org.springblade.system.user.feign.IUserClient;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.oauth2.common.exceptions.UserDeniedAuthorizationException;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

/**
 * 用户信息
 *
 * @author Chill
 */
@Service
@AllArgsConstructor
public class BladeUserDetailsServiceImpl implements UserDetailsService {

	private IUserClient userClient;

	@Override
	@SneakyThrows
	public BladeUserDetails loadUserByUsername(String username) {
		HttpServletRequest request = WebUtil.getRequest();
		// 获取租户
		String tenantId = Func.toStr(request.getHeader(TokenUtil.TENANT_HEADER_KEY), TokenUtil.DEFAULT_TENANT_ID);
		// 获取用户类型
		String userType = Func.toStr(request.getHeader(TokenUtil.USER_TYPE_HEADER_KEY), TokenUtil.DEFAULT_USER_TYPE);

		// 远程调用返回数据
		R<UserInfo> result;
		// 根据不同用户类型调用对应的接口返回数据，用户可自行拓展
		if (userType.equals(BladeUserEnum.WEB.getName())) {
			result = userClient.userInfo(tenantId, username);
		} else if (userType.equals(BladeUserEnum.APP.getName())) {
			result = userClient.userInfo(tenantId, username);
		} else {
			result = userClient.userInfo(tenantId, username);
		}

		// 判断返回信息
		if (result.isSuccess()) {
			UserInfo userInfo = result.getData();
			if (Func.isEmpty(userInfo.getRoles())) {
				throw new UserDeniedAuthorizationException(TokenUtil.USER_HAS_NO_ROLE);
			}
			User user = userInfo.getUser();
			if (user == null) {
				throw new UsernameNotFoundException(TokenUtil.USER_NOT_FOUND);
			}
			return new BladeUserDetails(user.getId(),
				user.getTenantId(), user.getName(), user.getRealName(), user.getDeptId(), user.getRoleId(), Func.join(result.getData().getRoles()), Func.toStr(user.getAvatar(), TokenUtil.DEFAULT_AVATAR),
				username, AuthConstant.ENCRYPT + user.getPassword(), true, true, true, true,
				AuthorityUtils.commaSeparatedStringToAuthorityList(Func.join(result.getData().getRoles())));
		} else {
			throw new UsernameNotFoundException(result.getMsg());
		}
	}

}
