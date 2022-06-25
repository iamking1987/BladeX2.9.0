package org.springblade.plugin.workflow.process.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;

import org.springblade.core.tool.api.R;
import org.springblade.plugin.workflow.core.utils.ObjectUtil;
import org.springblade.plugin.workflow.core.utils.WfTaskUtil;
import org.springblade.plugin.workflow.process.entity.WfDraft;
import org.springframework.web.bind.annotation.*;
import org.springblade.plugin.workflow.process.service.IWfDraftService;
import org.springblade.core.boot.ctrl.BladeController;

/**
 * 流程草稿箱 控制器
 *
 * @author ssc
 */
@RestController
@AllArgsConstructor
@RequestMapping("/process/draft")
@Api(value = "流程草稿箱", tags = "流程草稿箱接口")
public class WfDraftController extends BladeController {

	private final IWfDraftService wfDraftService;

	@GetMapping("detail")
	@ApiOperation("详情")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "processDefId", value = "流程定义id"),
		@ApiImplicitParam(name = "platform", value = "平台 pc/app"),
	})
	public R detail(WfDraft wfDraft) {
		if (ObjectUtil.isAnyEmpty(wfDraft.getProcessDefId(), wfDraft.getPlatform())) {
			return R.fail("参数错误");
		}
		wfDraft.setUserId(Long.valueOf(WfTaskUtil.getTaskUser()));
		return R.data(wfDraftService.getOne(new QueryWrapper<>(wfDraft)));
	}

	@PostMapping("submit")
	@ApiOperation("保存")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "processDefId", value = "流程定义id"),
		@ApiImplicitParam(name = "platform", value = "平台 pc/app"),
	})
	public R submit(@RequestBody WfDraft wfDraft) {
		if (ObjectUtil.isAnyEmpty(wfDraft.getProcessDefId(), wfDraft.getPlatform())) {
			return R.fail("参数错误");
		}
		wfDraftService.submit(wfDraft);
		return R.success("保存成功");
	}
}
