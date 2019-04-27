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
package org.springblade.flowable.engine.utils;

import org.flowable.engine.RepositoryService;
import org.flowable.engine.repository.ProcessDefinition;
import org.springblade.core.cache.utils.CacheUtil;
import org.springblade.core.tool.api.R;
import org.springblade.core.tool.utils.Func;
import org.springblade.core.tool.utils.SpringUtil;
import org.springblade.core.tool.utils.StringPool;
import org.springblade.system.user.entity.User;
import org.springblade.system.user.feign.IUserClient;
import org.springblade.system.utils.DictUtil;

/**
 * 流程缓存
 *
 * @author Chill
 */
public class FlowCache {

	private static final String FLOW_CACHE = "flow:process";
	private static final String FLOW_CACHE_ID_ = "definition:id";
	private static final String USER_CACHE = "blade:user";
	private static final String USER_CACHE_ID_ = "user:id";

	private static RepositoryService repositoryService;
	private static IUserClient userClient;

	static {
		repositoryService = SpringUtil.getBean(RepositoryService.class);
		userClient = SpringUtil.getBean(IUserClient.class);
	}

	/**
	 * 获得流程定义对象
	 *
	 * @param processDefinitionId 流程对象id
	 * @return
	 */
	public static ProcessDefinition getProcessDefinition(String processDefinitionId) {
		ProcessDefinition processDefinition = CacheUtil.get(FLOW_CACHE, FLOW_CACHE_ID_ + processDefinitionId, ProcessDefinition.class);
		if (Func.isEmpty(processDefinition)) {
			processDefinition = repositoryService.createProcessDefinitionQuery().processDefinitionId(processDefinitionId).singleResult();
			if (Func.isNotEmpty(processDefinition)) {
				CacheUtil.put(FLOW_CACHE, FLOW_CACHE_ID_ + processDefinitionId, processDefinition);
			}
		}
		return processDefinition;
	}

	/**
	 * 获取流程类型名
	 *
	 * @param category 流程类型
	 * @return
	 */
	public static String getCategoryName(String category) {
		if (Func.isEmpty(category)) {
			return StringPool.EMPTY;
		}
		return DictUtil.getValue(category.split(StringPool.UNDERSCORE)[0], Func.toInt(category.split(StringPool.UNDERSCORE)[1]));
	}

	/**
	 * 获取用户名
	 *
	 * @param userId 用户id
	 * @return
	 */
	public static User getUser(Integer userId) {
		User user = CacheUtil.get(USER_CACHE, USER_CACHE_ID_ + userId, User.class);
		if (Func.isEmpty(user)) {
			R<User> result = userClient.userInfoById(userId);
			if (result.isSuccess()) {
				user = result.getData();
				if (Func.isNotEmpty(user)) {
					CacheUtil.put(USER_CACHE, USER_CACHE_ID_ + userId, user);
				}
			}
		}
		return user;
	}

}
