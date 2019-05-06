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

import lombok.AllArgsConstructor;
import org.springblade.system.entity.Dept;
import org.springblade.system.entity.Role;
import org.springblade.system.service.IAuthClientService;
import org.springblade.system.service.IDeptService;
import org.springblade.system.service.IRoleService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.annotations.ApiIgnore;

/**
 * 系统服务Feign实现类
 *
 * @author Chill
 */
@ApiIgnore
@RestController
@AllArgsConstructor
public class SysClient implements ISysClient {

	IDeptService deptService;

	IRoleService roleService;

	IAuthClientService clientService;

	@Override
	@GetMapping(DEPT)
	public Dept getDept(Long id) {
		return deptService.getById(id);
	}

	@Override
	@GetMapping(DEPT_NAME)
	public String getDeptName(Long id) {
		return deptService.getById(id).getDeptName();
	}

	@Override
	@GetMapping(ROLE)
	public Role getRole(Long id) {
		return roleService.getById(id);
	}

	@Override
	@GetMapping(ROLE_NAME)
	public String getRoleName(Long id) {
		return roleService.getById(id).getRoleName();
	}

	@Override
	@GetMapping(ROLE_ALIAS)
	public String getRoleAlias(Long id) {
		return roleService.getById(id).getRoleAlias();
	}

}
