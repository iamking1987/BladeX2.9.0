package org.springblade.plugin.workflow.design.controller;

import io.swagger.annotations.*;
import lombok.AllArgsConstructor;

import org.springblade.core.mp.support.Condition;
import org.springblade.core.mp.support.Query;
import org.springblade.core.tool.api.R;
import org.springblade.core.tool.utils.Func;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestParam;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.springblade.plugin.workflow.design.entity.WfFormHistory;
import org.springblade.plugin.workflow.design.vo.WfFormHistoryVO;
import org.springblade.plugin.workflow.design.wrapper.WfFormHistoryWrapper;
import org.springblade.plugin.workflow.design.service.IWfFormHistoryService;
import org.springblade.core.boot.ctrl.BladeController;
import springfox.documentation.annotations.ApiIgnore;

/**
 * 流程表单 控制器
 *
 * @author ssc
 */
@RestController
@AllArgsConstructor
@RequestMapping("/design/form/history")
@Api(tags = "流程表单 - 历史")
public class WfFormHistoryController extends BladeController {

	private final IWfFormHistoryService wfFormHistoryService;

	/**
	 * 分页 流程表单
	 */
	@GetMapping("/list")
	@ApiOperation(value = "分页", notes = "传入wfFormHistory")
	public R<IPage<WfFormHistoryVO>> list(WfFormHistory wfFormHistory, Query query) {
		IPage<WfFormHistory> pages = wfFormHistoryService.page(Condition.getPage(query), Condition.getQueryWrapper(wfFormHistory).orderByDesc("version"));
		return R.data(WfFormHistoryWrapper.build().pageVO(pages));
	}

	/**
	 * 删除 流程表单
	 */
	@PostMapping("/remove")
	@ApiOperation(value = "逻辑删除", notes = "传入ids")
	public R remove(@ApiParam(value = "主键集合", required = true) @RequestParam String ids) {
		return R.status(wfFormHistoryService.deleteLogic(Func.toLongList(ids)));
	}

	@PostMapping("/setMainVersion")
	@ApiOperation("设为主版本")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "id", value = "历史表单id"),
	})
	public R setMainVersion(@ApiIgnore @RequestBody WfFormHistory formHistory) {
		return (R) wfFormHistoryService.setMainVersion(formHistory);
	}

}
