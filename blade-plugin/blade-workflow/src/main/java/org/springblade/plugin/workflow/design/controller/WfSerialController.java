
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
import org.springblade.plugin.workflow.design.entity.WfSerial;
import org.springblade.plugin.workflow.design.vo.WfSerialVO;
import org.springblade.plugin.workflow.design.wrapper.WfSerialWrapper;
import org.springblade.plugin.workflow.design.service.IWfSerialService;
import org.springblade.core.boot.ctrl.BladeController;

/**
 * 流程流水号 控制器
 *
 * @author ssc
 */
@RestController
@AllArgsConstructor
@RequestMapping("/design/serial")
@Api(value = "流程流水号", tags = "流程流水号接口")
public class WfSerialController extends BladeController {

	private final IWfSerialService wfSerialService;

	/**
	 * 详情
	 */
	@GetMapping("/detail")
	@ApiOperationSupport(order = 1)
	@ApiOperation(value = "详情", notes = "传入wfSerial")
	public R<WfSerialVO> detail(WfSerial wfSerial) {
		WfSerial detail = wfSerialService.getOne(Condition.getQueryWrapper(wfSerial));
		return R.data(WfSerialWrapper.build().entityVO(detail));
	}

	/**
	 * 分页 流程流水号
	 */
	@GetMapping("/list")
	@ApiOperationSupport(order = 2)
	@ApiOperation(value = "分页", notes = "传入wfSerial")
	public R<IPage<WfSerialVO>> list(WfSerial wfSerial, Query query) {
		IPage<WfSerial> pages = wfSerialService.page(Condition.getPage(query), Condition.getQueryWrapper(wfSerial));
		return R.data(WfSerialWrapper.build().pageVO(pages));
	}


	/**
	 * 新增 流程流水号
	 */
	@PostMapping("/save")
	@ApiOperationSupport(order = 4)
	@ApiOperation(value = "新增", notes = "传入wfSerial")
	public R save(@Valid @RequestBody WfSerial wfSerial) {
		return R.status(wfSerialService.save(wfSerial));
	}

	/**
	 * 修改 流程流水号
	 */
	@PostMapping("/update")
	@ApiOperationSupport(order = 5)
	@ApiOperation(value = "修改", notes = "传入wfSerial")
	public R update(@Valid @RequestBody WfSerial wfSerial) {
		return R.status(wfSerialService.updateById(wfSerial));
	}

	/**
	 * 新增或修改 流程流水号
	 */
	@PostMapping("/submit")
	@ApiOperationSupport(order = 6)
	@ApiOperation(value = "新增或修改", notes = "传入wfSerial")
	public R submit(@Valid @RequestBody WfSerial wfSerial) {
		return R.status(wfSerialService.saveOrUpdate(wfSerial));
	}


	/**
	 * 删除 流程流水号
	 */
	@PostMapping("/remove")
	@ApiOperationSupport(order = 7)
	@ApiOperation(value = "逻辑删除", notes = "传入ids")
	public R remove(@ApiParam(value = "主键集合", required = true) @RequestParam String ids) {
		return R.status(wfSerialService.deleteLogic(Func.toLongList(ids)));
	}


}
