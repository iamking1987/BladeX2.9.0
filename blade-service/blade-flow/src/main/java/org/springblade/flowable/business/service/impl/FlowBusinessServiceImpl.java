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
package org.springblade.flowable.business.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.AllArgsConstructor;
import org.flowable.engine.HistoryService;
import org.flowable.engine.TaskService;
import org.flowable.engine.history.HistoricProcessInstance;
import org.flowable.engine.history.HistoricProcessInstanceQuery;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.task.api.TaskQuery;
import org.flowable.task.api.history.HistoricTaskInstance;
import org.flowable.task.api.history.HistoricTaskInstanceQuery;
import org.springblade.core.secure.utils.SecureUtil;
import org.springblade.core.tool.utils.Func;
import org.springblade.core.tool.utils.StringPool;
import org.springblade.flowable.business.service.FlowBusinessService;
import org.springblade.flowable.core.entity.BladeFlow;
import org.springblade.flowable.engine.constant.FlowableConstant;
import org.springblade.flowable.engine.utils.FlowCache;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;

/**
 * 流程业务实现类
 *
 * @author Chill
 */
@Service
@AllArgsConstructor
public class FlowBusinessServiceImpl implements FlowBusinessService {

	private TaskService taskService;
	private HistoryService historyService;

	@Override
	public IPage<BladeFlow> selectClaimPage(IPage<BladeFlow> page, BladeFlow bladeFlow) {
		String taskUser = String.valueOf(SecureUtil.getUserId());
		List<BladeFlow> flowList = new LinkedList<>();

		// 等待签收的任务
		TaskQuery claimQuery = taskService.createTaskQuery().taskCandidateUser(taskUser)
			.includeProcessVariables().active().orderByTaskCreateTime().desc();

		// 构建列表数据
		buildFlowTaskList(bladeFlow, flowList, claimQuery, FlowableConstant.STATUS_CLAIM);

		// 计算总数
		long count = claimQuery.count();
		// 设置页数
		page.setSize(count);
		// 设置总数
		page.setTotal(count);
		// 设置数据
		page.setRecords(flowList);
		return page;
	}

	@Override
	public IPage<BladeFlow> selectTodoPage(IPage<BladeFlow> page, BladeFlow bladeFlow) {
		String taskUser = String.valueOf(SecureUtil.getUserId());
		List<BladeFlow> flowList = new LinkedList<>();

		// 已签收的任务
		TaskQuery todoQuery = taskService.createTaskQuery().taskAssignee(taskUser).active()
			.includeProcessVariables().orderByTaskCreateTime().desc();

		// 构建列表数据
		buildFlowTaskList(bladeFlow, flowList, todoQuery, FlowableConstant.STATUS_TODO);

		// 计算总数
		long count = todoQuery.count();
		// 设置页数
		page.setSize(count);
		// 设置总数
		page.setTotal(count);
		// 设置数据
		page.setRecords(flowList);
		return page;
	}

	@Override
	public IPage<BladeFlow> selectSendPage(IPage<BladeFlow> page, BladeFlow bladeFlow) {
		String taskUser = String.valueOf(SecureUtil.getUserId());
		List<BladeFlow> flowList = new LinkedList<>();

		HistoricProcessInstanceQuery historyQuery = historyService.createHistoricProcessInstanceQuery().startedBy(taskUser).orderByProcessInstanceStartTime().desc();
		// 查询列表
		List<HistoricProcessInstance> historyList = historyQuery.listPage(Func.toInt(page.getCurrent() - 1), Func.toInt(page.getSize()));

		historyList.forEach(historicProcessInstance -> {
			BladeFlow flow = new BladeFlow();
			// historicProcessInstance
			flow.setCreateTime(historicProcessInstance.getStartTime());
			flow.setEndTime(historicProcessInstance.getEndTime());
			flow.setVariables(historicProcessInstance.getProcessVariables());
			String[] businessKey = Func.toStrArray(StringPool.COLON, historicProcessInstance.getBusinessKey());
			if (businessKey.length > 1) {
				flow.setBusinessTable(businessKey[0]);
				flow.setBusinessId(businessKey[1]);
			}
			flow.setHisActInsActName(historicProcessInstance.getName());
			flow.setProcessInstanceId(historicProcessInstance.getId());
			flow.setHistoryProcessInstanceId(historicProcessInstance.getId());
			// ProcessDefinition
			ProcessDefinition pd = FlowCache.getProcessDefinition(historicProcessInstance.getProcessDefinitionId());
			flow.setProcessDefinitionId(pd.getId());
			flow.setProcessDefinitionName(pd.getName());
			flow.setProcessDefinitionKey(pd.getKey());
			flow.setProcessDefinitionVersion(pd.getVersion());
			flow.setProcessInstanceId(historicProcessInstance.getId());
			// HistoricTaskInstance
			HistoricTaskInstance historyTask = historyService.createHistoricTaskInstanceQuery().processInstanceId(historicProcessInstance.getId()).orderByHistoricTaskInstanceEndTime().desc().list().get(0);
			flow.setTaskId(historyTask.getId());
			flow.setTaskName(historyTask.getName());
			flow.setTaskDefinitionKey(historyTask.getTaskDefinitionKey());
			// Status
			if (historicProcessInstance.getEndActivityId() != null) {
				flow.setProcessIsFinished(FlowableConstant.STATUS_FINISHED);
			} else {
				flow.setProcessIsFinished(FlowableConstant.STATUS_UNFINISHED);
			}
			flow.setStatus(FlowableConstant.STATUS_FINISH);
			flowList.add(flow);
		});

		// 计算总数
		long count = historyQuery.count();
		// 设置总数
		page.setTotal(count);
		page.setRecords(flowList);
		return page;
	}

	@Override
	public IPage<BladeFlow> selectDonePage(IPage<BladeFlow> page, BladeFlow bladeFlow) {
		String taskUser = String.valueOf(SecureUtil.getUserId());
		List<BladeFlow> flowList = new LinkedList<>();

		HistoricTaskInstanceQuery doneQuery = historyService.createHistoricTaskInstanceQuery().taskAssignee(taskUser).finished()
			.includeProcessVariables().orderByHistoricTaskInstanceEndTime().desc();

		if (bladeFlow.getBeginDate() != null) {
			doneQuery.taskCompletedAfter(bladeFlow.getBeginDate());
		}
		if (bladeFlow.getEndDate() != null) {
			doneQuery.taskCompletedBefore(bladeFlow.getEndDate());
		}

		// 查询列表
		List<HistoricTaskInstance> doneList = doneQuery.listPage(Func.toInt(page.getCurrent() - 1), Func.toInt(page.getSize()));
		doneList.forEach(historicTaskInstance -> {
			BladeFlow flow = new BladeFlow();
			flow.setTaskId(historicTaskInstance.getId());
			flow.setTaskDefinitionKey(historicTaskInstance.getTaskDefinitionKey());
			flow.setTaskName(historicTaskInstance.getName());
			flow.setAssignee(historicTaskInstance.getAssignee());
			flow.setCreateTime(historicTaskInstance.getCreateTime());
			flow.setExecutionId(historicTaskInstance.getExecutionId());
			flow.setHistoryTaskEndTime(historicTaskInstance.getEndTime());
			flow.setVariables(historicTaskInstance.getProcessVariables());

			ProcessDefinition pd = FlowCache.getProcessDefinition(historicTaskInstance.getProcessDefinitionId());
			flow.setProcessDefinitionId(pd.getId());
			flow.setProcessDefinitionName(pd.getName());
			flow.setProcessDefinitionKey(pd.getKey());
			flow.setProcessDefinitionVersion(pd.getVersion());

			flow.setProcessInstanceId(historicTaskInstance.getProcessInstanceId());
			flow.setHistoryProcessInstanceId(historicTaskInstance.getProcessInstanceId());
			HistoricProcessInstance historicProcessInstance = getHistoricProcessInstance((historicTaskInstance.getProcessInstanceId()));
			if (Func.isNotEmpty(historicProcessInstance)) {
				String[] businessKey = Func.toStrArray(StringPool.COLON, historicProcessInstance.getBusinessKey());
				flow.setBusinessTable(businessKey[0]);
				flow.setBusinessId(businessKey[1]);
				if (historicProcessInstance.getEndActivityId() != null) {
					flow.setProcessIsFinished(FlowableConstant.STATUS_FINISHED);
				} else {
					flow.setProcessIsFinished(FlowableConstant.STATUS_UNFINISHED);
				}
			}
			flow.setStatus(FlowableConstant.STATUS_FINISH);

			flowList.add(flow);
		});


		// 计算总数
		long count = doneQuery.count();
		// 设置总数
		page.setTotal(count);
		page.setRecords(flowList);
		return page;
	}

	/**
	 * 构建流程
	 *
	 * @param bladeFlow 流程通用类
	 * @param flowList  流程列表
	 * @param taskQuery 任务查询类
	 * @param status    状态
	 */
	private void buildFlowTaskList(BladeFlow bladeFlow, List<BladeFlow> flowList, TaskQuery taskQuery, String status) {
		if (bladeFlow.getBeginDate() != null) {
			taskQuery.taskCreatedAfter(bladeFlow.getBeginDate());
		}
		if (bladeFlow.getEndDate() != null) {
			taskQuery.taskCreatedBefore(bladeFlow.getEndDate());
		}
		taskQuery.list().forEach(task -> {
			BladeFlow flow = new BladeFlow();
			flow.setTaskId(task.getId());
			flow.setTaskDefinitionKey(task.getTaskDefinitionKey());
			flow.setTaskName(task.getName());
			flow.setAssignee(task.getAssignee());
			flow.setCreateTime(task.getCreateTime());
			flow.setClaimTime(task.getClaimTime());
			flow.setExecutionId(task.getExecutionId());
			flow.setVariables(task.getProcessVariables());
			flow.setCategory(task.getCategory());
			flow.setCategoryName(FlowCache.getCategoryName(task.getCategory()));

			HistoricProcessInstance historicProcessInstance = getHistoricProcessInstance(task.getProcessInstanceId());
			if (Func.isNotEmpty(historicProcessInstance)) {
				String[] businessKey = Func.toStrArray(StringPool.COLON, historicProcessInstance.getBusinessKey());
				flow.setBusinessTable(businessKey[0]);
				flow.setBusinessId(businessKey[1]);
			}

			ProcessDefinition pd = FlowCache.getProcessDefinition(task.getProcessDefinitionId());
			flow.setProcessDefinitionId(pd.getId());
			flow.setProcessDefinitionName(pd.getName());
			flow.setProcessDefinitionKey(pd.getKey());
			flow.setProcessDefinitionVersion(pd.getVersion());
			flow.setProcessInstanceId(task.getProcessInstanceId());
			flow.setStatus(status);
			flowList.add(flow);
		});
	}

	/**
	 * 获取历史流程
	 *
	 * @param processInstanceId 流程实例id
	 * @return HistoricProcessInstance
	 */
	private HistoricProcessInstance getHistoricProcessInstance(String processInstanceId) {
		return historyService.createHistoricProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
	}

}
