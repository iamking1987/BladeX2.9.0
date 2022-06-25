package org.springblade.plugin.workflow.design.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.flowable.bpmn.exceptions.XMLException;
import org.springblade.core.mp.support.Condition;
import org.springblade.core.mp.support.Query;
import org.springblade.core.tool.api.R;
import org.springblade.core.tool.utils.StringUtil;
import org.springblade.plugin.workflow.core.utils.ObjectUtil;
import org.springblade.plugin.workflow.core.utils.WfTaskUtil;
import org.springblade.plugin.workflow.design.entity.WfModel;
import org.springblade.plugin.workflow.design.service.IWfModelService;
import org.springblade.plugin.workflow.design.vo.WfModelVO;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import java.util.Map;

@RestController
@AllArgsConstructor
@RequestMapping("/design/model")
@Api(tags = "流程模型")
public class WfModelController {

	private final IWfModelService modelService;

	@GetMapping("detail")
	@ApiOperation("详情")
	public R detail(WfModel model) {
		model.setTenantId(WfTaskUtil.getTenantId());
		return R.data(modelService.detail(model));
	}

	@GetMapping("list")
	@ApiOperation("分页")
	public R list(@ApiIgnore @RequestParam Map<String, Object> model, Query query) {
		Object category = model.get("categoryId_equal");
		if (category != null) {
			model.put("categoryId_equal", Long.valueOf(category.toString()));
		}
		model.put("tenantId_equal", WfTaskUtil.getTenantId());
		QueryWrapper<WfModel> wrapper = Condition.getQueryWrapper(model, WfModel.class);
		wrapper.select("id,model_key modelKey,name,description,version,category_id categoryId").orderByDesc("last_updated");
		IPage<WfModel> pages = modelService.page(Condition.getPage(query), wrapper);
		return R.data(pages);
	}

	@PostMapping("submit")
	@ApiOperation("新增或修改")
	public R submit(@RequestBody WfModelVO model) {
		if (StringUtil.isBlank(model.getId())) {
			try {
				return R.data(modelService.saveModel(model));
			} catch (XMLException xmlException) {
				return R.fail("请查看文档配置xss拦截");
			} catch (DuplicateKeyException duplicateKeyException) {
				return R.fail(String.format("当前流程key：%s 已存在", model.getModelKey()));
			} catch (Exception e) {
				return R.fail("未知错误：" + e.getLocalizedMessage());
			}
		} else {
			return R.data(modelService.updateModel(model));
		}
	}

	@PostMapping("remove")
	@ApiOperation("删除")
	public R remove(@RequestBody WfModelVO wfModel) {
		modelService.remove(wfModel);
		return R.success("操作成功");
	}

	@PostMapping("deploy")
	@ApiOperation("部署")
	public R deploy(@RequestBody WfModelVO modelVo) {
		WfModel model = modelService.getById(modelVo.getId());
		if (model == null) {
			return R.fail("查询不到此模型");
		}

		return R.data(modelService.deploy(modelVo));
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
		if (ObjectUtil.isAnyEmpty(ids, categoryId)) {
			return R.fail("参数错误");
		}
		modelService.changeCategory(ids, categoryId);
		return R.success("修改成功");
	}

}
