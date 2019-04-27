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

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.AllArgsConstructor;
import org.springblade.core.mp.support.Condition;
import org.springblade.core.mp.support.Query;
import org.springblade.core.tool.api.R;
import org.springblade.flowable.business.service.FlowBusinessService;
import org.springblade.flowable.core.entity.BladeFlow;
import org.springblade.flowable.engine.entity.FlowProcess;
import org.springblade.flowable.engine.service.FlowService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 流程事务通用接口
 *
 * @author Chill
 */
@RestController
@AllArgsConstructor
@RequestMapping("work")
@Api(value = "流程事务通用接口", tags = "流程事务通用接口")
public class WorkController {

	private FlowService flowService;
	private FlowBusinessService flowBusinessService;

	/**
	 * 发起事务列表页
	 */
	@GetMapping("start-list")
	@ApiOperation(value = "发起事务列表页", notes = "传入流程类型", position = 1)
	public R<IPage<FlowProcess>> startList(@ApiParam("流程类型") String category, Query query) {
		IPage<FlowProcess> pages = flowService.selectProcessPage(Condition.getPage(query), category);
		return R.data(pages);
	}

	/**
	 * 待签事务列表页
	 */
	@GetMapping("claim-list")
	@ApiOperation(value = "待签事务列表页", notes = "传入流程信息", position = 2)
	public R<IPage<BladeFlow>> claimList(@ApiParam("流程信息") BladeFlow bladeFlow, Query query) {
		IPage<BladeFlow> pages = flowBusinessService.selectClaimPage(Condition.getPage(query), bladeFlow);
		return R.data(pages);
	}

	/**
	 * 待办事务列表页
	 */
	@GetMapping("todo-list")
	@ApiOperation(value = "待办事务列表页", notes = "传入流程信息", position = 3)
	public R<IPage<BladeFlow>> todoList(@ApiParam("流程信息") BladeFlow bladeFlow, Query query) {
		IPage<BladeFlow> pages = flowBusinessService.selectTodoPage(Condition.getPage(query), bladeFlow);
		return R.data(pages);
	}

	/**
	 * 已发事务列表页
	 */
	@GetMapping("send-list")
	@ApiOperation(value = "已发事务列表页", notes = "传入流程信息", position = 4)
	public R<IPage<BladeFlow>> sendList(@ApiParam("流程信息") BladeFlow bladeFlow, Query query) {
		IPage<BladeFlow> pages = flowBusinessService.selectSendPage(Condition.getPage(query), bladeFlow);
		return R.data(pages);
	}

	/**
	 * 办结事务列表页
	 */
	@GetMapping("done-list")
	@ApiOperation(value = "办结事务列表页", notes = "传入流程信息", position = 5)
	public R<IPage<BladeFlow>> doneList(@ApiParam("流程信息") BladeFlow bladeFlow, Query query) {
		IPage<BladeFlow> pages = flowBusinessService.selectDonePage(Condition.getPage(query), bladeFlow);
		return R.data(pages);
	}

}