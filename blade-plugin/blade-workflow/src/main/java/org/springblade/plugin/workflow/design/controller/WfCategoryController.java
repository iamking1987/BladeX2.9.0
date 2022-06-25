
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
import org.springblade.plugin.workflow.core.cache.WfCategoryCache;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestParam;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.springblade.plugin.workflow.design.entity.WfCategory;
import org.springblade.plugin.workflow.design.vo.WfCategoryVO;
import org.springblade.plugin.workflow.design.wrapper.WfCategoryWrapper;
import org.springblade.plugin.workflow.design.service.IWfCategoryService;
import org.springblade.core.boot.ctrl.BladeController;
import springfox.documentation.annotations.ApiIgnore;

import java.util.Map;

/**
 * 流程分类 控制器
 *
 * @author ssc
 */
@RestController
@AllArgsConstructor
@RequestMapping("/design/category")
@Api(value = "流程分类", tags = "流程分类接口")
public class WfCategoryController extends BladeController {

	private final IWfCategoryService wfCategoryService;

	@GetMapping("tree")
	@ApiOperation("树形结构")
	public R tree() {
		return R.data(WfCategoryCache.tree());
	}

	@GetMapping("allTree")
	@ApiOperation("树形结构")
	public R allTree() {
		return R.data(wfCategoryService.allTree());
	}

	@GetMapping("/detail")
	@ApiOperationSupport(order = 1)
	@ApiOperation(value = "详情", notes = "传入wfCategory")
	public R<WfCategoryVO> detail(WfCategory category) {
		WfCategory detail = wfCategoryService.getOne(Condition.getQueryWrapper(category));
		return R.data(WfCategoryWrapper.build().entityVO(detail));
	}

	/**
	 * 分页 流程分类
	 */
	@GetMapping("/list")
	@ApiOperationSupport(order = 2)
	@ApiOperation(value = "分页", notes = "传入wfCategory")
	public R<IPage<WfCategoryVO>> list(@ApiIgnore @RequestParam Map<String, Object> category, Query query) {
		IPage<WfCategory> pages = wfCategoryService.page(Condition.getPage(query), Condition.getQueryWrapper(category, WfCategory.class).orderByAsc("sort").orderByDesc("id"));
		return R.data(WfCategoryWrapper.build().pageVO(pages));
	}


	/**
	 * 自定义分页 流程分类
	 */
	@GetMapping("/page")
	@ApiOperationSupport(order = 3)
	@ApiOperation(value = "分页", notes = "传入wfCategory")
	public R<IPage<WfCategoryVO>> page(WfCategoryVO category, Query query) {
		IPage<WfCategoryVO> pages = wfCategoryService.selectWfCategoryPage(Condition.getPage(query), category);
		return R.data(pages);
	}

	/**
	 * 新增 流程分类
	 */
	@PostMapping("/save")
	@ApiOperationSupport(order = 4)
	@ApiOperation(value = "新增", notes = "传入wfCategory")
	public R save(@Valid @RequestBody WfCategory category) {
		WfCategoryCache.removeTreeCache();
		return R.status(wfCategoryService.save(category));
	}

	/**
	 * 修改 流程分类
	 */
	@PostMapping("/update")
	@ApiOperationSupport(order = 5)
	@ApiOperation(value = "修改", notes = "传入wfCategory")
	public R update(@Valid @RequestBody WfCategory category) {
		WfCategoryCache.removeTreeCache();
		WfCategoryCache.removeById(category.getId());
		return R.status(wfCategoryService.updateById(category));
	}

	/**
	 * 新增或修改 流程分类
	 */
	@PostMapping("/submit")
	@ApiOperationSupport(order = 6)
	@ApiOperation(value = "新增或修改", notes = "传入wfCategory")
	public R submit(@Valid @RequestBody WfCategory category) {
		WfCategoryCache.removeTreeCache();
		WfCategoryCache.removeById(category.getId());
		return R.status(wfCategoryService.saveOrUpdate(category));
	}


	/**
	 * 删除 流程分类
	 */
	@PostMapping("/remove")
	@ApiOperationSupport(order = 7)
	@ApiOperation(value = "逻辑删除", notes = "传入ids")
	public R remove(@ApiParam(value = "主键集合", required = true) @RequestParam String ids) {
		WfCategoryCache.removeTreeCache();
		return R.status(wfCategoryService.deleteLogic(Func.toLongList(ids)));
	}


}
