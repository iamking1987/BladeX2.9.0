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
package org.springblade.flowable.core.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 工作流通用实体类
 *
 * @author Chill
 */
@Data
public class BladeFlow implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 任务编号
	 */
	private String taskId;
	/**
	 * 任务名称
	 */
	private String taskName;
	/**
	 * 任务定义Key
	 */
	private String taskDefinitionKey;
	/**
	 * 任务执行人编号
	 */
	private String assignee;
	/**
	 * 任务执行人名称
	 */
	private String assigneeName;

	/**
	 * 历史任务结束时间
	 */
	private Date historyTaskEndTime;
	private String executionId;
	/**
	 * 流程实例ID
	 */
	private String processInstanceId;
	/**
	 * 流程信息
	 */
	private String processDefinitionId;
	private String processDefinitionKey;
	private String processDefinitionName;
	private int processDefinitionVersion;
	private String processDefinitionDesc;
	private String processDefinitionDiagramResName;
	private String processDefinitionResName;

	/**
	 * 已办任务流程实例ID 查看流程图会用到
	 */
	private String historyProcessInstanceId;
	/**
	 * 流程实例是否结束(true:结束，false:未结束)
	 */
	private String processIsFinished;

	/**
	 * 历史活动流程
	 */
	private String hisActInsActName;
	/**
	 * 历史活动耗时
	 */
	private String hisActInsDuTime;

	/**
	 * 业务绑定Table
	 */
	private String businessTable;
	/**
	 * 业务绑定ID
	 */
	private String businessId;
	/**
	 * 任务状态
	 */
	private String status;
	/**
	 * 任务意见
	 */
	private String comment;
	/**
	 * 是否继续
	 */
	private String isPass;
	/**
	 * 开始查询日期
	 */
	private Date beginDate;
	/**
	 * 结束查询日期
	 */
	private Date endDate;
}
