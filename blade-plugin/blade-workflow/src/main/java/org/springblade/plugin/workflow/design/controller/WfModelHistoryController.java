package org.springblade.plugin.workflow.design.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springblade.core.mp.support.Condition;
import org.springblade.core.mp.support.Query;
import org.springblade.core.tool.api.R;
import org.springblade.plugin.workflow.design.entity.WfModelHistory;
import org.springblade.plugin.workflow.design.service.IWfModelHistoryService;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/design/model/history")
@Api(tags = "流程模型 - 历史")
public class WfModelHistoryController {

	private final IWfModelHistoryService wfModelHistoryService;

	@GetMapping("list")
	@ApiOperation("分页")
	public R list(WfModelHistory modelHistory, Query query) {
		IPage<WfModelHistory> pages = wfModelHistoryService.page(Condition.getPage(query), Condition.getQueryWrapper(modelHistory).orderByDesc("version"));
		return R.data(pages);
	}

	@PostMapping("remove")
	@ApiOperation("删除")
	public R remove(@RequestBody WfModelHistory modelHistory) {
		return R.status(wfModelHistoryService.removeById(modelHistory.getId()));
	}

	@PostMapping("setMainVersion")
	@ApiOperation("设置主版本")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "id", value = "历史模型id"),
	})
	public R setMainVersion(@RequestBody WfModelHistory modelHistory) {
		return (R) wfModelHistoryService.setMainVersion(modelHistory);
	}

}
