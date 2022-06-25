package org.springblade.plugin.workflow.design.controller;

import com.alibaba.fastjson.JSONObject;
import io.swagger.annotations.*;
import lombok.AllArgsConstructor;
import org.springblade.core.mp.support.Condition;
import org.springblade.core.mp.support.Query;
import org.springblade.core.tool.api.R;
import org.springblade.core.tool.utils.ObjectUtil;
import org.springblade.plugin.workflow.design.entity.WfForm;
import org.springblade.plugin.workflow.design.service.IWfFormDefaultValuesService;
import org.springblade.plugin.workflow.design.service.IWfFormService;
import org.springblade.plugin.workflow.design.vo.WfFormVO;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import java.util.Map;

@RestController
@AllArgsConstructor
@RequestMapping("/design/form")
@Api(tags = "流程表单")
public class WfFormController {

	private final IWfFormService formService;
	private final IWfFormDefaultValuesService formDefaultValuesService;

	@GetMapping("detail")
	@ApiOperation("详情")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "id", value = "id", required = true),
	})
	public R detail(@ApiIgnore WfForm form) {
		return R.data(formService.getOne(Condition.getQueryWrapper(form)));
	}

	@GetMapping("list")
	@ApiOperation("分页")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "key", value = "表单key"),
		@ApiImplicitParam(name = "name", value = "表单名称"),
		@ApiImplicitParam(name = "current", value = "当前第几页", required = true),
		@ApiImplicitParam(name = "size", value = "每页条数", required = true),
	})
	public R list(@ApiIgnore @RequestParam Map<String, Object> form, Query query) {
		return R.data(formService.page(Condition.getPage(query), Condition.getQueryWrapper(form, WfForm.class).orderByDesc("update_time")));
	}

	@PostMapping("submit")
	@ApiOperation("新增或修改")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "id", value = "id，有值=修改，无值=新增"),
		@ApiImplicitParam(name = "key", value = "表单key", required = true),
		@ApiImplicitParam(name = "name", value = "表单名称", required = true),
		@ApiImplicitParam(name = "content", value = "表单JSON", required = true),
		@ApiImplicitParam(name = "newVersion", value = "是否新版本"),
	})
	public R submit(@ApiIgnore @RequestBody WfFormVO form) {
		if (ObjectUtil.isEmpty(form.getId())) {
			return (R) formService.create(form);
		} else {
			return R.data(formService.edit(form));
		}
	}

	@PostMapping("remove")
	@ApiOperation("删除")
	public R remove(@ApiIgnore @RequestBody WfFormVO form) {
		formService.remove(form);
		return R.success("操作成功");
	}

	@GetMapping("listType")
	@ApiOperation("字段类型默认值列表")
	public R listType() {
		return R.data(formDefaultValuesService.listType());
	}

	@PostMapping("changeCategory")
	@ApiOperation("修改分类")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "ids", value = "ids", required = true),
		@ApiImplicitParam(name = "category", value = "分类id", required = true),
	})
	public R changeCategory(@ApiIgnore @RequestBody JSONObject body) {
		String ids = body.getString("ids");
		Long categoryId = body.getLong("category");
		if (org.springblade.plugin.workflow.core.utils.ObjectUtil.isAnyEmpty(ids, categoryId)) {
			return R.fail("参数错误");
		}
		formService.changeCategory(ids, categoryId);
		return R.success("修改成功");
	}

}
