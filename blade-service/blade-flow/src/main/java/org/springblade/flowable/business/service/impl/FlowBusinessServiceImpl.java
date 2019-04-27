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
			BladeFlow bf = new BladeFlow();
			// historicProcessInstance
			bf.setCreateTime(historicProcessInstance.getStartTime());
			bf.setEndTime(historicProcessInstance.getEndTime());
			bf.setVariables(historicProcessInstance.getProcessVariables());
			bf.setBusinessId(historicProcessInstance.getBusinessKey());
			bf.setHisActInsActName(historicProcessInstance.getName());
			bf.setProcessInstanceId(historicProcessInstance.getId());
			bf.setHistoryProcessInstanceId(historicProcessInstance.getId());
			// ProcessDefinition
			ProcessDefinition pd = FlowCache.getProcessDefinition(historicProcessInstance.getProcessDefinitionId());
			bf.setProcessDefinitionId(pd.getId());
			bf.setProcessDefinitionName(pd.getName());
			bf.setProcessDefinitionKey(pd.getKey());
			bf.setProcessDefinitionVersion(pd.getVersion());
			bf.setProcessInstanceId(historicProcessInstance.getId());
			// HistoricTaskInstance
			HistoricTaskInstance historyTask = historyService.createHistoricTaskInstanceQuery().processInstanceId(historicProcessInstance.getId()).orderByHistoricTaskInstanceEndTime().desc().list().get(0);
			bf.setTaskId(historyTask.getId());
			bf.setTaskName(historyTask.getName());
			bf.setTaskDefinitionKey(historyTask.getTaskDefinitionKey());
			// Status
			if (historicProcessInstance.getEndActivityId() != null) {
				bf.setProcessIsFinished(FlowableConstant.STATUS_FINISHED);
			} else {
				bf.setProcessIsFinished(FlowableConstant.STATUS_UNFINISHED);
			}
			bf.setStatus(FlowableConstant.STATUS_FINISH);
			flowList.add(bf);
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
			BladeFlow bf = new BladeFlow();
			bf.setTaskId(historicTaskInstance.getId());
			bf.setTaskDefinitionKey(historicTaskInstance.getTaskDefinitionKey());
			bf.setTaskName(historicTaskInstance.getName());
			bf.setAssignee(historicTaskInstance.getAssignee());
			bf.setCreateTime(historicTaskInstance.getCreateTime());
			bf.setExecutionId(historicTaskInstance.getExecutionId());
			bf.setHistoryTaskEndTime(historicTaskInstance.getEndTime());
			bf.setVariables(historicTaskInstance.getProcessVariables());

			ProcessDefinition pd = FlowCache.getProcessDefinition(historicTaskInstance.getProcessDefinitionId());
			bf.setProcessDefinitionId(pd.getId());
			bf.setProcessDefinitionName(pd.getName());
			bf.setProcessDefinitionKey(pd.getKey());
			bf.setProcessDefinitionVersion(pd.getVersion());

			bf.setProcessInstanceId(historicTaskInstance.getProcessInstanceId());
			bf.setHistoryProcessInstanceId(historicTaskInstance.getProcessInstanceId());
			HistoricProcessInstance historicProcessInstance = historyService.createHistoricProcessInstanceQuery().processInstanceId(historicTaskInstance.getProcessInstanceId()).singleResult();
			if (historicProcessInstance.getEndActivityId() != null) {
				bf.setProcessIsFinished(FlowableConstant.STATUS_FINISHED);
			} else {
				bf.setProcessIsFinished(FlowableConstant.STATUS_UNFINISHED);
			}
			bf.setStatus(FlowableConstant.STATUS_FINISH);

			flowList.add(bf);
		});


		// 计算总数
		long count = doneQuery.count();
		// 设置总数
		page.setTotal(count);
		page.setRecords(flowList);
		return page;
	}

	private void buildFlowTaskList(BladeFlow bladeFlow, List<BladeFlow> flowList, TaskQuery taskQuery, String status) {
		if (bladeFlow.getBeginDate() != null) {
			taskQuery.taskCreatedAfter(bladeFlow.getBeginDate());
		}
		if (bladeFlow.getEndDate() != null) {
			taskQuery.taskCreatedBefore(bladeFlow.getEndDate());
		}
		taskQuery.list().forEach(task -> {
			BladeFlow bf = new BladeFlow();
			bf.setTaskId(task.getId());
			bf.setTaskDefinitionKey(task.getTaskDefinitionKey());
			bf.setTaskName(task.getName());
			bf.setAssignee(task.getAssignee());
			bf.setCreateTime(task.getCreateTime());
			bf.setClaimTime(task.getClaimTime());
			bf.setExecutionId(task.getExecutionId());
			bf.setVariables(task.getProcessVariables());
			bf.setCategory(task.getCategory());
			bf.setCategoryName(FlowCache.getCategoryName(task.getCategory()));
			ProcessDefinition pd = FlowCache.getProcessDefinition(task.getProcessDefinitionId());
			bf.setProcessDefinitionId(pd.getId());
			bf.setProcessDefinitionName(pd.getName());
			bf.setProcessDefinitionKey(pd.getKey());
			bf.setProcessDefinitionVersion(pd.getVersion());
			bf.setProcessInstanceId(task.getProcessInstanceId());
			bf.setStatus(status);
			flowList.add(bf);
		});
	}

}
