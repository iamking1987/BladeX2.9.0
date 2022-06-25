package org.springblade.plugin.workflow.design.controller;

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
import org.springblade.plugin.workflow.design.entity.WfButton;
import org.springblade.plugin.workflow.design.vo.WfButtonVO;
import org.springblade.plugin.workflow.design.wrapper.WfButtonWrapper;
import org.springblade.plugin.workflow.design.service.IWfButtonService;
import org.springblade.core.boot.ctrl.BladeController;

/**
 * 流程按钮 控制器
 *
 * @author ssc
 */
@RestController
@AllArgsConstructor
@RequestMapping("/design/button")
@Api(value = "流程按钮", tags = "流程按钮接口")
public class WfButtonController extends BladeController {

	private final IWfButtonService wfButtonService;

	/**
	 * 详情
	 */
	@GetMapping("/detail")
	@ApiOperationSupport(order = 1)
	@ApiOperation(value = "详情", notes = "传入wfButton")
	public R<WfButtonVO> detail(WfButton wfButton) {
		WfButton detail = wfButtonService.getOne(Condition.getQueryWrapper(wfButton));
		return R.data(WfButtonWrapper.build().entityVO(detail));
	}

	/**
	 * 分页 流程按钮
	 */
	@GetMapping("/list")
	@ApiOperationSupport(order = 2)
	@ApiOperation(value = "分页", notes = "传入wfButton")
	public R<IPage<WfButtonVO>> list(WfButton wfButton, Query query) {
		IPage<WfButton> pages = wfButtonService.page(Condition.getPage(query), Condition.getQueryWrapper(wfButton));
		return R.data(WfButtonWrapper.build().pageVO(pages));
	}


	/**
	 * 自定义分页 流程按钮
	 */
	@GetMapping("/page")
	@ApiOperationSupport(order = 3)
	@ApiOperation(value = "分页", notes = "传入wfButton")
	public R<IPage<WfButtonVO>> page(WfButtonVO wfButton, Query query) {
		IPage<WfButtonVO> pages = wfButtonService.selectWfButtonPage(Condition.getPage(query), wfButton);
		return R.data(pages);
	}

	/**
	 * 新增 流程按钮
	 */
	@PostMapping("/save")
	@ApiOperationSupport(order = 4)
	@ApiOperation(value = "新增", notes = "传入wfButton")
	public R save(@Valid @RequestBody WfButton wfButton) {
		return R.status(wfButtonService.save(wfButton));
	}

	/**
	 * 修改 流程按钮
	 */
	@PostMapping("/update")
	@ApiOperationSupport(order = 5)
	@ApiOperation(value = "修改", notes = "传入wfButton")
	public R update(@Valid @RequestBody WfButton wfButton) {
		return R.status(wfButtonService.updateById(wfButton));
	}

	/**
	 * 新增或修改 流程按钮
	 */
	@PostMapping("/submit")
	@ApiOperationSupport(order = 6)
	@ApiOperation(value = "新增或修改", notes = "传入wfButton")
	public R submit(@Valid @RequestBody WfButton wfButton) {
		return R.status(wfButtonService.saveOrUpdate(wfButton));
	}


	/**
	 * 删除 流程按钮
	 */
	@PostMapping("/remove")
	@ApiOperationSupport(order = 7)
	@ApiOperation(value = "逻辑删除", notes = "传入ids")
	public R remove(@ApiParam(value = "主键集合", required = true) @RequestParam String ids) {
		return R.status(wfButtonService.deleteLogic(Func.toLongList(ids)));
	}


}
