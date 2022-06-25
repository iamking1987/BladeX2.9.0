package org.springblade.plugin.workflow.ops.controller;

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springblade.core.http.HttpRequest;
import org.springblade.core.mp.support.Query;
import org.springblade.core.secure.annotation.PreAuth;
import org.springblade.core.tool.api.R;
import org.springblade.core.tool.constant.RoleConstant;
import org.springblade.plugin.workflow.core.constant.WfProcessConstant;
import org.springblade.plugin.workflow.core.utils.ObjectUtil;
import org.springblade.plugin.workflow.ops.model.WfOps;
import org.springblade.plugin.workflow.ops.service.IWfOpsService;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

@RestController
@RequestMapping("/ops")
@AllArgsConstructor
@PreAuth(RoleConstant.HAS_ROLE_ADMIN)
public class WfOpsController {

	private final IWfOpsService wfOpsService;

	@GetMapping("list")
	@ApiOperation("全部待办任务")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "processDefinitionName", value = "流程名称"),
		@ApiImplicitParam(name = "processDefinitionKey", value = "流程标识"),
		@ApiImplicitParam(name = "serialNumber", value = "流水号"),
		@ApiImplicitParam(name = "category", value = "分类"),
		@ApiImplicitParam(name = "taskName", value = "当前节点"),
		@ApiImplicitParam(name = "assignee", value = "审核人"),
		@ApiImplicitParam(name = "applyUserName", value = "申请人"),
		@ApiImplicitParam(name = "isSuspended", value = "是否挂起"),
		@ApiImplicitParam(name = "date", value = "时间范围，逗号分隔"),
		@ApiImplicitParam(name = "current", value = "当前第几页", required = true),
		@ApiImplicitParam(name = "size", value = "每页条数", required = true),
	})
	public R list(@ApiIgnore WfOps ops, Query query) {
		return R.data(wfOpsService.list(ops, query));
	}

	@GetMapping("processList")
	@ApiOperation("全部流程列表")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "processDefinitionName", value = "流程名称"),
		@ApiImplicitParam(name = "processDefinitionKey", value = "流程标识"),
		@ApiImplicitParam(name = "serialNumber", value = "流水号"),
		@ApiImplicitParam(name = "category", value = "分类"),
		@ApiImplicitParam(name = "applyUserName", value = "申请人"),
		@ApiImplicitParam(name = "date", value = "时间范围，逗号分隔"),
		@ApiImplicitParam(name = "current", value = "当前第几页", required = true),
		@ApiImplicitParam(name = "size", value = "每页条数", required = true),
	})
	public R processList(@ApiIgnore WfOps ops, Query query) {
		return R.data(wfOpsService.processList(ops, query));
	}

	@GetMapping("doneList")
	@ApiOperation("办结流程")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "processDefinitionName", value = "流程名称"),
		@ApiImplicitParam(name = "processDefinitionKey", value = "流程标识"),
		@ApiImplicitParam(name = "serialNumber", value = "流水号"),
		@ApiImplicitParam(name = "category", value = "分类"),
		@ApiImplicitParam(name = "applyUserName", value = "申请人"),
		@ApiImplicitParam(name = "date", value = "时间范围，逗号分隔"),
		@ApiImplicitParam(name = "current", value = "当前第几页", required = true),
		@ApiImplicitParam(name = "size", value = "每页条数", required = true),
	})
	public R doneList(@ApiIgnore WfOps ops, Query query) {
		ops.setStatus(WfProcessConstant.STATUS_FINISH);
		return R.data(wfOpsService.processList(ops, query));
	}

	@PostMapping("completeTask")
	@ApiOperation("完成任务")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id，多条逗号分割", required = true),
		@ApiImplicitParam(name = "isPass", value = "审核是否通过", required = true),
	})
	public R completeTask(@ApiIgnore @RequestBody WfOps ops, HttpRequest request) {
		if (ObjectUtil.isAnyEmpty(ops.getTaskId(), ops.isPass())) {
			return R.fail("参数错误");
		}
		wfOpsService.completeTask(ops);
		return R.success("操作成功");
	}

	@PostMapping("changeTaskAssignee")
	@ApiOperation("变更审核人")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id，多条逗号分割", required = true),
		@ApiImplicitParam(name = "assignee", value = "审核人", required = true),
	})
	public R changeTaskAssignee(@ApiIgnore @RequestBody WfOps ops) {
		if (ObjectUtil.isAnyEmpty(ops.getTaskId(), ops.getAssignee())) {
			return R.fail("参数错误");
		}
		wfOpsService.changeTaskAssignee(ops);
		return R.success("变更成功");
	}

	@PostMapping("changeTaskStatus")
	@ApiOperation("变更任务状态")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id，多条逗号分割", required = true),
		@ApiImplicitParam(name = "isSuspended", value = "是否挂起", required = true),
	})
	public R changeTaskStatus(@ApiIgnore @RequestBody WfOps ops) {
		if (ObjectUtil.isAnyEmpty(ops.getTaskId(), ops.getIsSuspended())) {
			return R.fail("参数错误");
		}
		wfOpsService.changeTaskStatus(ops);
		return R.success("变更成功");
	}

	@PostMapping("transferTask")
	@ApiOperation("转办任务")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id，多条逗号分割", required = true),
		@ApiImplicitParam(name = "assignee", value = "审核人", required = true),
	})
	public R transferTask(@ApiIgnore @RequestBody WfOps ops, HttpRequest request) {
		if (ObjectUtil.isAnyEmpty(ops.getTaskId(), ops.getAssignee())) {
			return R.fail("参数错误");
		}
		wfOpsService.transferTask(ops);
		return R.success("转办成功");
	}

	@PostMapping("delegateTask")
	@ApiOperation("委托任务")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id，多条逗号分割", required = true),
		@ApiImplicitParam(name = "assignee", value = "审核人", required = true),
	})
	public R delegateTask(@ApiIgnore @RequestBody WfOps ops) {
		if (ObjectUtil.isAnyEmpty(ops.getTaskId(), ops.getAssignee())) {
			return R.fail("参数错误");
		}
		wfOpsService.delegateTask(ops);
		return R.success("委托成功");
	}

	@PostMapping("copyTask")
	@ApiOperation("抄送任务")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id，多条逗号分割", required = true),
		@ApiImplicitParam(name = "assignee", value = "审核人", required = true),
	})
	public R copyTask(@ApiIgnore @RequestBody WfOps ops) {
		if (ObjectUtil.isAnyEmpty(ops.getTaskId(), ops.getAssignee())) {
			return R.fail("参数错误");
		}
		wfOpsService.copyTask(ops);
		return R.success("抄送成功");
	}

	@PostMapping("urgeTask")
	@ApiOperation("催办任务")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id，多条逗号分割", required = true),
	})
	public R urgeTask(@ApiIgnore @RequestBody WfOps ops) {
		if (ObjectUtil.isAnyEmpty(ops.getTaskId())) {
			return R.fail("参数错误");
		}
		wfOpsService.urgeTask(ops);
		return R.success("催办成功");
	}

	@PostMapping("terminateProcess")
	@ApiOperation("终止流程")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id，多条逗号分割", required = true),
	})
	public R terminateProcess(@ApiIgnore @RequestBody WfOps ops) {
		if (ObjectUtil.isAnyEmpty(ops.getTaskId())) {
			return R.fail("参数错误");
		}
		wfOpsService.terminateProcess(ops);
		return R.success("变更成功");
	}

	@GetMapping("processNodes")
	@ApiOperation("流程节点")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "processInstanceId", value = "流程", required = true),
		@ApiImplicitParam(name = "taskId", value = "任务id"),
	})
	public R processNodes(@ApiIgnore WfOps ops) {
		if (ObjectUtil.isAnyEmpty(ops.getProcessInstanceId())) {
			return R.fail("参数错误");
		}
		return R.data(wfOpsService.processNodes(ops));
	}

	@PostMapping("rollbackTask")
	@ApiOperation("指定回退")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id", required = true),
		@ApiImplicitParam(name = "nodeId", value = "节点id", required = true),
	})
	public R rollbackTask(@ApiIgnore @RequestBody WfOps ops) {
		if (ObjectUtil.isAnyEmpty(ops.getTaskId(), ops.getNodeId())) {
			return R.fail("参数错误");
		}
		wfOpsService.rollbackTask(ops);
		return R.success("操作成功");
	}

	@PostMapping("dispatchTask")
	@ApiOperation("调度任务")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id", required = true),
		@ApiImplicitParam(name = "nodeId", value = "节点id", required = true),
	})
	public R dispatchTask(@ApiIgnore @RequestBody WfOps ops) {
		if (ObjectUtil.isAnyEmpty(ops.getTaskId(), ops.getNodeId())) {
			return R.fail("参数错误");
		}
		wfOpsService.dispatchTask(ops);
		return R.success("操作成功");
	}

	@PostMapping("addMultiInstance")
	@ApiOperation("加签")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id", required = true),
		@ApiImplicitParam(name = "assignee", value = "加签人员", required = true),
	})
	public R addMultiInstance(@ApiIgnore @RequestBody WfOps ops) {
		if (ObjectUtil.isAnyEmpty(ops.getTaskId(), ops.getAssignee())) {
			return R.fail("参数错误");
		}
		wfOpsService.addMultiInstance(ops);
		return R.success("操作成功");
	}

	@PostMapping("deleteMultiInstance")
	@ApiOperation("减签")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id", required = true),
	})
	public R deleteMultiInstance(@ApiIgnore @RequestBody WfOps ops) {
		if (ObjectUtil.isAnyEmpty(ops.getTaskId())) {
			return R.fail("参数错误");
		}
		wfOpsService.deleteMultiInstance(ops);
		return R.success("操作成功");
	}

}
