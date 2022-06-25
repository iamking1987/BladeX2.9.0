package org.springblade.plugin.workflow.design.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
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
import org.springblade.plugin.workflow.design.entity.WfFormDefaultValues;
import org.springblade.plugin.workflow.design.vo.WfFormDefaultValuesVO;
import org.springblade.plugin.workflow.design.wrapper.WfFormDefaultValuesWrapper;
import org.springblade.plugin.workflow.design.service.IWfFormDefaultValuesService;
import org.springblade.core.boot.ctrl.BladeController;

/**
 * 流程表单字段默认值 控制器
 *
 * @author ssc
 */
@RestController
@AllArgsConstructor
@RequestMapping("/design/form/default-values")
@Api(value = "流程表单字段默认值", tags = "流程表单字段默认值接口")
public class WfFormDefaultValuesController extends BladeController {

	private final IWfFormDefaultValuesService wfFormDefaultValuesService;

	@GetMapping("/list")
	@ApiOperationSupport(order = 2)
	@ApiOperation(value = "分页", notes = "传入wfFormDefaultValues")
	public R<IPage<WfFormDefaultValuesVO>> list(WfFormDefaultValues wfFormDefaultValues, Query query) {
		IPage<WfFormDefaultValues> pages = wfFormDefaultValuesService.page(Condition.getPage(query), Condition.getQueryWrapper(wfFormDefaultValues));
		return R.data(WfFormDefaultValuesWrapper.build().pageVO(pages));
	}


	@GetMapping("/listType")
	@ApiOperationSupport(order = 3)
	@ApiOperation("字段类型")
	public R listType() {
		QueryWrapper<WfFormDefaultValues> wrapper = new QueryWrapper<>();
		wrapper.select("field_type fieldType").groupBy("field_type");
		return R.data(wfFormDefaultValuesService.list(wrapper));
	}

	@PostMapping("/submit")
	@ApiOperationSupport(order = 6)
	@ApiOperation(value = "新增或修改", notes = "传入wfFormDefaultValues")
	public R submit(@Valid @RequestBody WfFormDefaultValues wfFormDefaultValues) {
		return R.status(wfFormDefaultValuesService.saveOrUpdate(wfFormDefaultValues));
	}

	@PostMapping("/remove")
	@ApiOperationSupport(order = 7)
	@ApiOperation(value = "逻辑删除", notes = "传入ids")
	public R remove(@ApiParam(value = "主键集合", required = true) @RequestParam String ids) {
		return R.status(wfFormDefaultValuesService.deleteLogic(Func.toLongList(ids)));
	}


}
