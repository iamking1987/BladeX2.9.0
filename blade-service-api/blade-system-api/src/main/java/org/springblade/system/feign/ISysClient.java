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
package org.springblade.system.feign;

import org.springblade.core.launch.constant.AppConstant;
import org.springblade.system.entity.Dept;
import org.springblade.system.entity.Role;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Feign接口类
 *
 * @author Chill
 */
@FeignClient(
	value = AppConstant.APPLICATION_SYSTEM_NAME,
	fallback = ISysClientFallback.class
)
public interface ISysClient {

	String API_PREFIX = "/client";
	String DEPT = API_PREFIX + "/dept";
	String DEPT_NAME = API_PREFIX + "/dept-name";
	String ROLE = API_PREFIX + "/role";
	String ROLE_NAME = API_PREFIX + "/role-name";
	String ROLE_ALIAS = API_PREFIX + "/role-alias";

	/**
	 * 获取部门
	 *
	 * @param id 主键
	 * @return Dept
	 */
	@GetMapping(DEPT)
	Dept getDept(@RequestParam("id") Integer id);

	/**
	 * 获取部门名
	 *
	 * @param id 主键
	 * @return 部门名
	 */
	@GetMapping(DEPT_NAME)
	String getDeptName(@RequestParam("id") Integer id);

	/**
	 * 获取角色
	 *
	 * @param id 主键
	 * @return Role
	 */
	@GetMapping(ROLE)
	Role getRole(@RequestParam("id") Integer id);

	/**
	 * 获取角色名
	 *
	 * @param id 主键
	 * @return 角色名
	 */
	@GetMapping(ROLE_NAME)
	String getRoleName(@RequestParam("id") Integer id);

	/**
	 * 获取角色别名
	 *
	 * @param id 主键
	 * @return 角色别名
	 */
	@GetMapping(ROLE_ALIAS)
	String getRoleAlias(@RequestParam("id") Integer id);

}
