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
package org.springblade.system.user.service.impl;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.springblade.common.constant.CommonConstant;
import org.springblade.core.mp.base.BaseServiceImpl;
import org.springblade.core.tool.utils.DigestUtil;
import org.springblade.core.tool.utils.Func;
import org.springblade.system.user.entity.User;
import org.springblade.system.user.entity.UserInfo;
import org.springblade.system.user.mapper.UserMapper;
import org.springblade.system.user.service.IUserService;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 服务实现类
 *
 * @author Chill
 */
@Service
public class UserServiceImpl extends BaseServiceImpl<UserMapper, User> implements IUserService {

	@Override
	public IPage<User> selectUserPage(IPage<User> page, User user) {
		return page.setRecords(baseMapper.selectUserPage(page, user));
	}

	@Override
	public UserInfo userInfo(String code, String account, String password) {
		UserInfo userInfo = new UserInfo();
		User user = baseMapper.getUser(code, account, password);
		userInfo.setUser(user);
		if (Func.isNotEmpty(user)) {
			List<String> roleAlias = baseMapper.getRoleAlias(Func.toStrArray(user.getRoleId()));
			userInfo.setRoles(roleAlias);
		}
		return userInfo;
	}

	@Override
	public boolean grant(String userIds, String roleIds) {
		User user = new User();
		user.setRoleId(roleIds);
		return this.update(user, Wrappers.<User>update().lambda().in(User::getId, Func.toIntList(userIds)));
	}

	@Override
	public boolean resetPassword(String userIds) {
		User user = new User();
		user.setPassword(DigestUtil.encrypt(CommonConstant.DEFAULT_PASSWORD));
		user.setUpdateTime(LocalDateTime.now());
		return this.update(user, Wrappers.<User>update().lambda().in(User::getId, Func.toIntList(userIds)));
	}

	@Override
	public List<String> getRoleName(String roleIds) {
		return baseMapper.getRoleName(Func.toStrArray(roleIds));
	}

	@Override
	public List<String> getDeptName(String deptIds) {
		return baseMapper.getDeptName(Func.toStrArray(deptIds));
	}

}
