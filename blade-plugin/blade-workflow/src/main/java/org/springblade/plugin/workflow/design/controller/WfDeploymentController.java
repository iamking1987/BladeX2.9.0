package org.springblade.plugin.workflow.design.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springblade.core.mp.support.Query;
import org.springblade.core.tool.api.R;
import org.springblade.plugin.workflow.design.entity.WfProcessDef;
import org.springblade.plugin.workflow.design.service.IWfDesignService;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/design/deployment")
@Api(tags = "流程部署")
public class WfDeploymentController {

	private final IWfDesignService flowDesignService;

	@GetMapping("list")
	@ApiOperation("分页")
	public R list(WfProcessDef wfProcessDef, Query query) {
		return R.data(flowDesignService.deploymentPage(wfProcessDef, query));
	}

	@PostMapping("remove")
	@ApiOperation("删除")
	public R remove(@RequestBody String body) {
		JSONObject data = JSON.parseObject(body);
		String id = data.getString("deploymentId");

		flowDesignService.deleteDeployment(id);
		return R.success("操作成功");
	}

	@PostMapping("changeStatus")
	@ApiOperation("改变部署流程状态")
	public R changeStatus(@RequestBody String body) {
		JSONObject data = JSON.parseObject(body);

		String id = data.getString("id");
		String status = data.getString("status");

		flowDesignService.changeDeploymentStatus(id, status);

		return R.success("操作成功");
	}

	@PostMapping("changeCategory")
	@ApiOperation("改变部署流程分类")
	public R changeCategory(@RequestBody String body) {
		JSONObject data = JSON.parseObject(body);

		String id = data.getString("deploymentId");
		String category = data.getString("category");

		flowDesignService.changeDeploymentCategory(id, category);

		return R.success("操作成功");
	}

}
