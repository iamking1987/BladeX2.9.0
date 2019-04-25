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
package org.springblade.desk.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springblade.core.mp.base.BaseEntity;

import java.time.LocalDateTime;

/**
 * 请假流程实体类
 *
 * @author Chill
 */
@Data
@TableName("blade_process_leave")
@EqualsAndHashCode(callSuper = true)
public class ProcessLeave extends BaseEntity {

	private static final long serialVersionUID = 1L;

	/**
	 * 流程定义id
	 */
	private String processId;
	/**
	 * 流程实例id
	 */
	private String instanceId;
	/**
	 * 请假开始时间
	 */
	private LocalDateTime startTime;
	/**
	 * 请假结束时间
	 */
	private LocalDateTime endTime;
	/**
	 * 请假理由
	 */
	private String reason;
	/**
	 * 批复
	 */
	private String comment;
	/**
	 * 流程申请时间
	 */
	private LocalDateTime applyTime;

}
