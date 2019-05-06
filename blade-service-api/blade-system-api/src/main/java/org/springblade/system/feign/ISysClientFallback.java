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

import org.springblade.system.entity.Dept;
import org.springblade.system.entity.Role;
import org.springframework.stereotype.Component;

/**
 * Feign失败配置
 *
 * @author Chill
 */
@Component
public class ISysClientFallback implements ISysClient {

	@Override
	public Dept getDept(Long id) {
		return null;
	}

	@Override
	public String getDeptName(Long id) {
		return null;
	}

	@Override
	public Role getRole(Long id) {
		return null;
	}

	@Override
	public String getRoleName(Long id) {
		return null;
	}

	@Override
	public String getRoleAlias(Long id) {
		return null;
	}
}
