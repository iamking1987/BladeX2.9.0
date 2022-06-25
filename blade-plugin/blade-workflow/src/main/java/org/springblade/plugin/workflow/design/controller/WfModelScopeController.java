package org.springblade.plugin.workflow.design.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;

import org.springblade.core.tool.api.R;
import org.springblade.plugin.workflow.core.utils.ObjectUtil;
import org.springblade.plugin.workflow.design.vo.WfModelScopeVO;
import org.springframework.web.bind.annotation.*;
import org.springblade.plugin.workflow.design.entity.WfModelScope;
import org.springblade.plugin.workflow.design.service.IWfModelScopeService;
import org.springblade.core.boot.ctrl.BladeController;
import springfox.documentation.annotations.ApiIgnore;

/**
 * 流程模型权限 控制器
 *
 * @author ssc
 */
@RestController
@AllArgsConstructor
@RequestMapping("/design/model/scope")
@Api(value = "流程模型权限", tags = "流程模型权限接口")
public class WfModelScopeController extends BladeController {

	private final IWfModelScopeService wfModelScopeService;

	@GetMapping("list")
	@ApiOperation("列表")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "modelId", value = "模型id"),
	})
	public R list(@ApiIgnore WfModelScope modelScope) {
		if (ObjectUtil.isAnyEmpty(modelScope.getModelId())) {
			return R.fail("参数错误");
		}
		return R.data(wfModelScopeService.list(new LambdaQueryWrapper<WfModelScope>().eq(WfModelScope::getModelId, modelScope.getModelId())));
	}


	@PostMapping("submit")
	@ApiOperation("保存")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "modelId", value = "模型id"),
	})
	public R submit(@RequestBody WfModelScopeVO wfModelScope) {
		wfModelScopeService.submit(wfModelScope);
		return R.success("操作成功");
	}
}
