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
package org.springblade.desk.service.impl;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springblade.core.mp.base.BaseServiceImpl;
import org.springblade.core.secure.utils.SecureUtil;
import org.springblade.core.tool.utils.Func;
import org.springblade.desk.entity.ProcessLeave;
import org.springblade.desk.mapper.LeaveMapper;
import org.springblade.desk.service.ILeaveService;
import org.springblade.flowable.core.constant.ProcessConstant;
import org.springblade.flowable.core.entity.BladeFlow;
import org.springblade.flowable.core.feign.IFlowClient;
import org.springblade.flowable.core.utils.FlowUtil;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

/**
 * 服务实现类
 *
 * @author Chill
 */
@Slf4j
@Service
@AllArgsConstructor
public class LeaveServiceImpl extends BaseServiceImpl<LeaveMapper, ProcessLeave> implements ILeaveService {

	private IFlowClient flowClient;

	@Override
	public boolean start(ProcessLeave leave) {
		String businessTable = FlowUtil.getBusinessTable(ProcessConstant.LEAVE_KEY);
		Map<String, Object> variables = new HashMap<>(16);
		if (Func.isEmpty(leave.getId())) {
			// 保存leave
			leave.setApplyTime(LocalDateTime.now());
			save(leave);
			// 启动流程
			variables.put("businessId", leave.getId());
			variables.put("taskUser", SecureUtil.getUserAccount());
			variables.put("days", Duration.between(leave.getStartTime(), leave.getEndTime()).toDays());
			BladeFlow bladeFlow = flowClient.startProcessInstanceById(leave.getProcessId(), FlowUtil.getBusinessKey(businessTable, String.valueOf(leave.getId())), variables);
			log.debug("流程已启动,流程ID:" + bladeFlow.getProcessInstanceId());
			// 返回流程id写入leave
			leave.setInstanceId(bladeFlow.getProcessInstanceId());
			updateById(leave);
		} else {

			updateById(leave);
		}
		return true;
	}
}
