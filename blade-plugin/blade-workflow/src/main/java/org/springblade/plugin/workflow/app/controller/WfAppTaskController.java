package org.springblade.plugin.workflow.app.controller;

import com.alibaba.fastjson.JSONObject;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springblade.core.tool.api.R;
import org.springblade.plugin.workflow.app.entity.WfAppProcess;
import org.springblade.plugin.workflow.core.utils.ObjectUtil;
import org.springblade.plugin.workflow.core.utils.WfTaskUtil;
import org.springblade.plugin.workflow.design.entity.WfButton;
import org.springblade.plugin.workflow.design.service.IWfButtonService;
import org.springblade.plugin.workflow.design.service.IWfFormService;
import org.springblade.plugin.workflow.process.model.WfProcess;
import org.springblade.plugin.workflow.process.service.IWfProcessService;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

@RestController
@RequestMapping("/app/task")
@AllArgsConstructor
@Api("workflow - app - 流程任务")
public class WfAppTaskController {

	private final IWfFormService formService;
	private final IWfButtonService buttonService;
	private final IWfProcessService processService;

	@GetMapping("getFormByProcessDefId")
	@ApiOperation("获取流程发起表单")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "processDefId", value = "流程定义id", required = true),
	})
	public R getFormByProcessId(String processDefId) {
		if (ObjectUtil.isAnyEmpty(processDefId)) {
			return R.fail("参数错误");
		}
		return R.data(formService.getFormByProcessDefId(processDefId));
	}

	@PostMapping("startProcess")
	@ApiOperation("发起流程")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "processId", value = "流程定义id", required = true),
	})
	public R startProcess(@ApiIgnore @RequestBody JSONObject body) {
		String processDefId = body.getString("processId");
		body.remove("processId");
		try {
			return R.data(processService.startProcessInstanceById(processDefId, body));
		} catch (Exception e) {
			return R.fail(e.getLocalizedMessage());
		}
	}

	@GetMapping("detail")
	@ApiOperation("任务详情")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id", required = true),
		@ApiImplicitParam(name = "processInsId", value = "流程实例id", required = true),
	})
	public R detail(String taskId, String processInsId) throws ExecutionException, InterruptedException {
		if (ObjectUtil.isAnyEmpty(taskId, processInsId)) {
			return R.fail("参数错误");
		}
		Future<WfProcess> processFuture = processService.detail(taskId, WfTaskUtil.getTaskUser(), WfTaskUtil.getCandidateGroup());
		Future<Map<String, Object>> formFuture = formService.getFormByTaskId(taskId);
		Future<List<WfProcess>> flowFuture = processService.historyFlowList(processInsId, null, null);
		Future<List<WfButton>> buttonFuture = buttonService.getButtonByTaskId(taskId);

		Map<String, Object> result = new HashMap<>();
		result.put("process", processFuture.get());
		result.put("form", formFuture.get());
		result.put("flow", flowFuture.get());
		result.put("button", buttonFuture.get());
		return R.data(result);
	}

	@PostMapping("completeTask")
	@ApiOperation("完成任务")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id", required = true),
		@ApiImplicitParam(name = "processInstanceId", value = "流程实例id", required = true),
		@ApiImplicitParam(name = "pass", value = "同意/驳回", required = true),
		@ApiImplicitParam(name = "comment", value = "评论"),
		@ApiImplicitParam(name = "copyUser", value = "抄送人"),
		@ApiImplicitParam(name = "assignee", value = "指定审批人"),
		@ApiImplicitParam(name = "variables", value = "表单参数"),
	})
	public R completeTask(@ApiIgnore @RequestBody WfAppProcess process) {
		if (ObjectUtil.isAnyEmpty(process.getTaskId(), process.getProcessInstanceId())) {
			return R.fail("参数错误");
		}
		return (R) processService.completeTask(process);
	}

	@PostMapping("transferTask")
	@ApiOperation("转办任务")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id", required = true),
		@ApiImplicitParam(name = "assignee", value = "接受人", required = true),
	})
	public R transferTask(@ApiIgnore @RequestBody WfAppProcess process) {
		if (ObjectUtil.isAnyEmpty(process.getTaskId(), process.getAssignee())) {
			return R.fail("参数错误");
		}
		return (R) processService.transferTask(process);
	}

	@PostMapping("delegateTask")
	@ApiOperation("代理任务")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id", required = true),
		@ApiImplicitParam(name = "assignee", value = "接受人", required = true),
	})
	public R delegateTask(@ApiIgnore @RequestBody WfAppProcess process) {
		if (ObjectUtil.isAnyEmpty(process.getTaskId(), process.getAssignee())) {
			return R.fail("参数错误");
		}
		return (R) processService.delegateTask(process);
	}

	@PostMapping("claimTask")
	@ApiOperation("签收任务（签收成功后回到待办任务中）")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id", required = true),
	})
	public R claimTask(@ApiIgnore @RequestBody WfAppProcess process) {
		if (ObjectUtil.isAnyEmpty(process.getTaskId())) {
			return R.fail("参数错误");
		}
		return (R) processService.claimTask(process.getTaskId());
	}

	@GetMapping("getBackNodes")
	@ApiOperation("获取可退回节点")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id", required = true),
	})
	public R getBackNodes(@ApiIgnore WfAppProcess process) {
		return R.data(processService.getBackNodes(process));
	}

	@PostMapping("rollbackTask")
	@ApiOperation("退回到指定节点")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id", required = true),
		@ApiImplicitParam(name = "nodeId", value = "节点id", required = true),
		@ApiImplicitParam(name = "comment", value = "评论", required = true),
	})
	public R rollbackTask(@ApiIgnore @RequestBody WfAppProcess process) {
		if (ObjectUtil.isAnyEmpty(process.getTaskId(), process.getNodeId(), process.getComment())) {
			return R.fail("参数错误");
		}
		return (R) processService.rollbackTask(process);
	}

	@PostMapping("terminateProcess")
	@ApiOperation("终止流程")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id", required = true),
	})
	public R terminateProcess(@ApiIgnore @RequestBody WfAppProcess process) {
		if (ObjectUtil.isAnyEmpty(process.getTaskId())) {
			return R.fail("参数错误");
		}
		return (R) processService.terminateProcess(process);
	}

	@PostMapping("addMultiInstance")
	@ApiOperation("加签")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id", required = true),
		@ApiImplicitParam(name = "assignee", value = "加签人员", required = true),
	})
	public R addMultiInstance(@ApiIgnore @RequestBody WfAppProcess process) {
		if (ObjectUtil.isAnyEmpty(process.getTaskId(), process.getAssignee())) {
			return R.fail("参数错误");
		}
		return (R) processService.addMultiInstance(process);
	}

	@PostMapping("withdrawTask")
	@ApiOperation("撤销/撤回")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id", required = true),
		@ApiImplicitParam(name = "withdrawType", value = "类型", required = true),
	})
	public R withdrawTask(@ApiIgnore @RequestBody WfAppProcess process) {
		if (ObjectUtil.isAnyEmpty(process.getTaskId())) {
			return R.fail("参数错误");
		}
		return (R) processService.withdrawTask(process);
	}

}
