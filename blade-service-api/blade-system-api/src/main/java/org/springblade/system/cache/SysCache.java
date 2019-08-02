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
package org.springblade.system.cache;

import org.springblade.core.cache.utils.CacheUtil;
import org.springblade.core.tool.api.R;
import org.springblade.core.tool.utils.SpringUtil;
import org.springblade.system.entity.Dept;
import org.springblade.system.entity.Menu;
import org.springblade.system.entity.Role;
import org.springblade.system.entity.Tenant;
import org.springblade.system.feign.ISysClient;

import java.util.List;

import static org.springblade.core.cache.constant.CacheConstant.SYS_CACHE;

/**
 * 系统缓存
 *
 * @author Chill
 */
public class SysCache {
	private static final String MENU_ID = "menu:id:";
	private static final String DEPT_ID = "dept:id:";
	private static final String DEPT_NAME_ID = "deptName:id:";
	private static final String DEPT_NAMES_ID = "deptNames:id:";
	private static final String ROLE_ID = "role:id:";
	private static final String ROLE_NAME_ID = "roleName:id:";
	private static final String ROLE_NAMES_ID = "roleNames:id:";
	private static final String ROLE_ALIAS_ID = "roleAlias:id:";
	private static final String ROLE_ALIASES_ID = "roleAliases:id:";
	private static final String TENANT_ID = "tenant:id:";

	private static ISysClient sysClient;

	static {
		sysClient = SpringUtil.getBean(ISysClient.class);
	}

	/**
	 * 获取菜单
	 *
	 * @param id 主键
	 * @return
	 */
	public static Menu getMenu(Long id) {
		return CacheUtil.get(SYS_CACHE, MENU_ID, id, () -> {
			R<Menu> result = sysClient.getMenu(id);
			return result.getData();
		});
	}

	/**
	 * 获取部门
	 *
	 * @param id 主键
	 * @return
	 */
	public static Dept getDept(Long id) {
		return CacheUtil.get(SYS_CACHE, DEPT_ID, id, () -> {
			R<Dept> result = sysClient.getDept(id);
			return result.getData();
		});
	}

	/**
	 * 获取部门名
	 *
	 * @param id 主键
	 * @return 部门名
	 */
	public static String getDeptName(Long id) {
		return CacheUtil.get(SYS_CACHE, DEPT_NAME_ID, id, () -> {
			R<String> result = sysClient.getDeptName(id);
			return result.getData();
		});
	}

	/**
	 * 获取角色
	 *
	 * @param id 主键
	 * @return Role
	 */
	public static Role getRole(Long id) {
		return CacheUtil.get(SYS_CACHE, ROLE_ID, id, () -> {
			R<Role> result = sysClient.getRole(id);
			return result.getData();
		});
	}

	/**
	 * 获取角色名
	 *
	 * @param id 主键
	 * @return 角色名
	 */
	public static String getRoleName(Long id) {
		return CacheUtil.get(SYS_CACHE, ROLE_NAME_ID, id, () -> {
			R<String> result = sysClient.getRoleName(id);
			return result.getData();
		});
	}

	/**
	 * 获取角色别名
	 *
	 * @param id 主键
	 * @return 角色别名
	 */
	public static String getRoleAlias(Long id) {
		return CacheUtil.get(SYS_CACHE, ROLE_ALIAS_ID, id, () -> {
			R<String> result = sysClient.getRoleAlias(id);
			return result.getData();
		});
	}


	/**
	 * 获取部门名集合
	 *
	 * @param deptIds 主键集合
	 * @return 部门名
	 */
	public static List<String> getDeptNames(String deptIds) {
		return CacheUtil.get(SYS_CACHE, DEPT_NAMES_ID, deptIds, () -> {
			R<List<String>> result = sysClient.getDeptNames(deptIds);
			return result.getData();
		});
	}

	/**
	 * 获取角色名集合
	 *
	 * @param roleIds 主键集合
	 * @return 角色名
	 */
	public static List<String> getRoleNames(String roleIds) {
		return CacheUtil.get(SYS_CACHE, ROLE_NAMES_ID, roleIds, () -> {
			R<List<String>> result = sysClient.getRoleNames(roleIds);
			return result.getData();
		});
	}

	/**
	 * 获取角色别名集合
	 *
	 * @param roleIds 主键集合
	 * @return 角色别名
	 */
	public static List<String> getRoleAliases(String roleIds) {
		return CacheUtil.get(SYS_CACHE, ROLE_ALIASES_ID, roleIds, () -> {
			R<List<String>> result = sysClient.getRoleAliases(roleIds);
			return result.getData();
		});
	}

	/**
	 * 获取租户
	 *
	 * @param id 主键
	 * @return Tenant
	 */
	public static Tenant getTenant(Long id) {
		return CacheUtil.get(SYS_CACHE, TENANT_ID, id, () -> {
			R<Tenant> result = sysClient.getTenant(id);
			return result.getData();
		});
	}

}
