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
package org.springblade.flowable.business.feign;

import lombok.AllArgsConstructor;
import org.flowable.engine.IdentityService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.runtime.ProcessInstance;
import org.springblade.core.secure.utils.SecureUtil;
import org.springblade.flowable.core.entity.BladeFlow;
import org.springblade.flowable.core.feign.IFlowClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * 流程远程调用实现类
 *
 * @author Chill
 */
@RestController
@AllArgsConstructor
public class FlowClient implements IFlowClient {

	private RuntimeService runtimeService;
	private IdentityService identityService;

	@Override
	@PostMapping(START_PROCESS_INSTANCE_BY_ID)
	public BladeFlow startProcessInstanceById(String processDefinitionId, String businessKey, @RequestBody Map<String, Object> variables) {
		// 设置流程启动用户
		identityService.setAuthenticatedUserId(String.valueOf(SecureUtil.getUserId()));
		// 开启流程
		ProcessInstance processInstance = runtimeService.startProcessInstanceById(processDefinitionId, businessKey, variables);
		// 组装流程通用类
		BladeFlow flow = new BladeFlow();
		flow.setProcessInstanceId(processInstance.getId());
		return flow;
	}

	@Override
	@PostMapping(START_PROCESS_INSTANCE_BY_KEY)
	public BladeFlow startProcessInstanceByKey(String processDefinitionKey, String businessKey, Map<String, Object> variables) {
		// 设置流程启动用户
		identityService.setAuthenticatedUserId(String.valueOf(SecureUtil.getUserId()));
		// 开启流程
		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(processDefinitionKey, businessKey, variables);
		// 组装流程通用类
		BladeFlow flow = new BladeFlow();
		flow.setProcessInstanceId(processInstance.getId());
		return flow;
	}

}
