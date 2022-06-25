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
package org.springblade.modules.leave.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;
import lombok.AllArgsConstructor;
import javax.validation.Valid;

import org.springblade.core.mp.support.Condition;
import org.springblade.core.mp.support.Query;
import org.springblade.core.tool.api.R;
import org.springblade.core.tool.utils.Func;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestParam;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.springblade.modules.leave.entity.Leave;
import org.springblade.modules.leave.vo.LeaveVO;
import org.springblade.modules.leave.wrapper.LeaveWrapper;
import org.springblade.modules.leave.service.ILeaveService;
import org.springblade.core.boot.ctrl.BladeController;

/**
 * 请假流程测试表 控制器
 *
 * @author Blade
 * @since 2022-02-20
 */
@RestController
@AllArgsConstructor
@RequestMapping("/leave")
@Api(value = "请假流程测试表", tags = "请假流程测试表接口")
public class LeaveController extends BladeController {

	private ILeaveService leaveService;

	/**
	 * 详情
	 */
	@GetMapping("/detail")
	@ApiOperationSupport(order = 1)
	@ApiOperation(value = "详情", notes = "传入leave")
	public R<LeaveVO> detail(Leave leave) {
		Leave detail = leaveService.getOne(Condition.getQueryWrapper(leave));
		return R.data(LeaveWrapper.build().entityVO(detail));
	}

	/**
	 * 分页 请假流程测试表
	 */
	@GetMapping("/list")
	@ApiOperationSupport(order = 2)
	@ApiOperation(value = "分页", notes = "传入leave")
	public R<IPage<LeaveVO>> list(Leave leave, Query query) {
		IPage<Leave> pages = leaveService.page(Condition.getPage(query), Condition.getQueryWrapper(leave));
		return R.data(LeaveWrapper.build().pageVO(pages));
	}


	/**
	 * 自定义分页 请假流程测试表
	 */
	@GetMapping("/page")
	@ApiOperationSupport(order = 3)
	@ApiOperation(value = "分页", notes = "传入leave")
	public R<IPage<LeaveVO>> page(LeaveVO leave, Query query) {
		IPage<LeaveVO> pages = leaveService.selectLeavePage(Condition.getPage(query), leave);
		return R.data(pages);
	}

	/**
	 * 新增 请假流程测试表
	 */
	@PostMapping("/save")
	@ApiOperationSupport(order = 4)
	@ApiOperation(value = "新增", notes = "传入leave")
	public R save(@Valid @RequestBody Leave leave) {
		return R.status(leaveService.save(leave));
	}

	/**
	 * 修改 请假流程测试表
	 */
	@PostMapping("/update")
	@ApiOperationSupport(order = 5)
	@ApiOperation(value = "修改", notes = "传入leave")
	public R update(@Valid @RequestBody Leave leave) {
		return R.status(leaveService.updateById(leave));
	}

	/**
	 * 新增或修改 请假流程测试表
	 */
	@PostMapping("/submit")
	@ApiOperationSupport(order = 6)
	@ApiOperation(value = "新增或修改", notes = "传入leave")
	public R submit(@Valid @RequestBody Leave leave) {
		return R.status(leaveService.saveOrUpdate(leave));
	}

	
	/**
	 * 删除 请假流程测试表
	 */
	@PostMapping("/remove")
	@ApiOperationSupport(order = 7)
	@ApiOperation(value = "逻辑删除", notes = "传入ids")
	public R remove(@ApiParam(value = "主键集合", required = true) @RequestParam String ids) {
		return R.status(leaveService.deleteLogic(Func.toLongList(ids)));
	}

	
}
