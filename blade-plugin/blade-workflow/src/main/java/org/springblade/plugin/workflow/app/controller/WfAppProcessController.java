package org.springblade.plugin.workflow.app.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springblade.core.mp.support.Condition;
import org.springblade.core.mp.support.Query;
import org.springblade.core.tool.api.R;
import org.springblade.plugin.workflow.app.entity.WfAppProcess;
import org.springblade.plugin.workflow.app.service.IWfAppProcessService;
import org.springblade.plugin.workflow.app.vo.WfAppProcessVo;
import org.springblade.plugin.workflow.core.constant.WfProcessConstant;
import org.springblade.plugin.workflow.core.utils.ObjectUtil;
import org.springblade.plugin.workflow.core.utils.WfTaskUtil;
import org.springblade.plugin.workflow.process.entity.WfCopy;
import org.springblade.plugin.workflow.process.service.IWfCopyService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.annotations.ApiIgnore;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/app/process")
@AllArgsConstructor
@Api("workflow - app - 流程")
public class WfAppProcessController {

	private final IWfCopyService copyService;
	private final IWfAppProcessService processService;

	@GetMapping("list")
	@ApiOperation("可发起流程列表")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "processDefinitionName", value = "流程名称"),
	})
	public R<List<WfAppProcessVo>> list(@ApiIgnore WfAppProcess wfAppProcess) {
		return R.data(processService.list(wfAppProcess));
	}

	@GetMapping("todoList")
	@ApiOperation("待办列表")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "processDefinitionName", value = "流程名称"),
		@ApiImplicitParam(name = "current", value = "当前第几页", required = true),
		@ApiImplicitParam(name = "size", value = "每页条数", required = true),
	})
	public R<IPage<WfAppProcess>> todoList(@ApiIgnore WfAppProcess wfAppProcess, Query query) {
		wfAppProcess.setStatus(WfProcessConstant.STATUS_TODO);
		return R.data(processService.taskList(wfAppProcess, query));
	}

	@GetMapping("doneList")
	@ApiOperation("办结列表")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "processDefinitionName", value = "流程名称"),
		@ApiImplicitParam(name = "current", value = "当前第几页", required = true),
		@ApiImplicitParam(name = "size", value = "每页条数", required = true),
	})
	public R<IPage<WfAppProcess>> doneList(@ApiIgnore WfAppProcess wfAppProcess, Query query) {
		wfAppProcess.setStatus(WfProcessConstant.STATUS_DONE);
		return R.data(processService.processList(wfAppProcess, query));
	}

	@GetMapping("myDoneList")
	@ApiOperation("我的已办列表")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "processDefinitionName", value = "流程名称"),
		@ApiImplicitParam(name = "current", value = "当前第几页", required = true),
		@ApiImplicitParam(name = "size", value = "每页条数", required = true),
	})
	public R<IPage<WfAppProcess>> myDoneList(@ApiIgnore WfAppProcess wfAppProcess, Query query) {
		wfAppProcess.setStatus(WfProcessConstant.STATUS_DONE);
		return R.data(processService.taskList(wfAppProcess, query));
	}

	@GetMapping("sendList")
	@ApiOperation("我的请求")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "processDefinitionName", value = "流程名称"),
		@ApiImplicitParam(name = "current", value = "当前第几页", required = true),
		@ApiImplicitParam(name = "size", value = "每页条数", required = true),
	})
	public R<IPage<WfAppProcess>> sendList(@ApiIgnore WfAppProcess wfAppProcess, Query query) {
		wfAppProcess.setStatus(WfProcessConstant.STATUS_SEND);
		return R.data(processService.processList(wfAppProcess, query));
	}

	@GetMapping("claimList")
	@ApiOperation("待签列表")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "processDefinitionName", value = "流程名称"),
		@ApiImplicitParam(name = "current", value = "当前第几页", required = true),
		@ApiImplicitParam(name = "size", value = "每页条数", required = true),
	})
	public R<IPage<WfAppProcess>> claimList(@ApiIgnore WfAppProcess wfAppProcess, Query query) {
		wfAppProcess.setStatus(WfProcessConstant.STATUS_CLAIM);
		return R.data(processService.taskList(wfAppProcess, query));
	}

	@GetMapping("copyList")
	@ApiOperation("抄送列表")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "processDefinitionName", value = "流程名称"),
		@ApiImplicitParam(name = "current", value = "当前第几页", required = true),
		@ApiImplicitParam(name = "size", value = "每页条数", required = true),
	})
	public R page(@ApiIgnore @RequestParam Map<String, Object> copy, Query query) {
		if (ObjectUtil.isAnyEmpty(query.getCurrent(), query.getSize())) {
			return R.fail("参数错误");
		}
		Object processDefinitionName = copy.get("processDefinitionName");
		if (processDefinitionName != null) {
			copy.remove("processDefinitionName");
			copy.put("title", processDefinitionName);
		}
		return R.data(copyService.page(Condition.getPage(query), Condition.getQueryWrapper(copy, WfCopy.class).eq("user_id", Long.valueOf(WfTaskUtil.getTaskUser())).orderByDesc("id")));
	}

}
