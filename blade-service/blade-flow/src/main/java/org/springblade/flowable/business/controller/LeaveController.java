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
package org.springblade.flowable.business.controller;

import lombok.AllArgsConstructor;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.task.api.Task;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

/**
 * 报销控制器
 *
 * @author Chill
 */
@Controller
@AllArgsConstructor
@RequestMapping(value = "leave")
public class LeaveController {

	private RuntimeService runtimeService;

	private TaskService taskService;

	/**
	 * 添加报销
	 *
	 * @param userId    用户Id
	 * @param money     报销金额
	 * @param descption 描述
	 */
	@RequestMapping(value = "add")
	@ResponseBody
	public String addExpense(String userId, Integer money, String descption) {
		//启动流程
		HashMap<String, Object> map = new HashMap<>();
		map.put("taskUser", userId);
		map.put("money", money);
		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey("Expense", map);
		return "提交成功.流程Id为：" + processInstance.getId();
	}

	/**
	 * 获取审批管理列表
	 */
	@RequestMapping(value = "/list")
	@ResponseBody
	public Object list(String userId) {
		List<Task> tasks = taskService.createTaskQuery().taskAssignee(userId).orderByTaskCreateTime().desc().list();
		for (Task task : tasks) {
			System.out.println(task.toString());
		}
		return tasks.toArray().toString();
	}

	/**
	 * 批准
	 *
	 * @param taskId 任务ID
	 */
	@RequestMapping(value = "apply")
	@ResponseBody
	public String apply(String taskId) {
		Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
		if (task == null) {
			throw new RuntimeException("流程不存在");
		}
		//通过审核
		HashMap<String, Object> map = new HashMap<>();
		map.put("outcome", "通过");
		taskService.complete(taskId, map);
		return "processed ok!";
	}

	/**
	 * 拒绝
	 */
	@ResponseBody
	@RequestMapping(value = "reject")
	public String reject(String taskId) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("outcome", "驳回");
		taskService.complete(taskId, map);
		return "reject";
	}
}
