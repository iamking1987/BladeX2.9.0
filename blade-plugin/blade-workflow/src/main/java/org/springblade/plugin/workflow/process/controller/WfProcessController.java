package org.springblade.plugin.workflow.process.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springblade.core.http.HttpRequest;
import org.springblade.core.mp.support.Condition;
import org.springblade.core.mp.support.Query;
import org.springblade.core.redis.cache.BladeRedis;
import org.springblade.core.tool.api.R;
import org.springblade.plugin.workflow.core.constant.WfProcessConstant;
import org.springblade.plugin.workflow.core.utils.ObjectUtil;
import org.springblade.plugin.workflow.core.utils.WfTaskUtil;
import org.springblade.plugin.workflow.design.entity.WfButton;
import org.springblade.plugin.workflow.design.entity.WfProcessDef;
import org.springblade.plugin.workflow.design.service.IWfButtonService;
import org.springblade.plugin.workflow.design.service.IWfDesignService;
import org.springblade.plugin.workflow.design.service.IWfFormService;
import org.springblade.plugin.workflow.process.entity.WfCopy;
import org.springblade.plugin.workflow.process.model.WfNode;
import org.springblade.plugin.workflow.process.model.WfProcess;
import org.springblade.plugin.workflow.process.service.IWfCopyService;
import org.springblade.plugin.workflow.process.service.IWfProcessService;
import org.springframework.data.redis.cache.RedisCache;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

@RestController
@RequestMapping("/process")
@AllArgsConstructor
public class WfProcessController {

	private final IWfDesignService designService;
	private final IWfProcessService processService;
	private final IWfFormService formService;
	private final IWfButtonService buttonService;
	private final IWfCopyService copyService;
	private BladeRedis bladeRedis;

	@GetMapping("processList")
	@ApiOperation("可发起流程列表")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "name", value = "流程名称"),
		@ApiImplicitParam(name = "key", value = "流程标识"),
		@ApiImplicitParam(name = "category", value = "流程分类"),
		@ApiImplicitParam(name = "current", value = "当前第几页", required = true),
		@ApiImplicitParam(name = "size", value = "每页条数", required = true),
	})
	public R<IPage<WfProcessDef>> processList(@ApiIgnore WfProcessDef processDef, Query query) {
		if (ObjectUtil.isAnyEmpty(query.getCurrent(), query.getSize())) {
			return R.fail("参数错误");
		}
		processDef.setStatus(1);
		processDef.setScope(true);
		return R.data(designService.deploymentPage(processDef, query));
	}

	@GetMapping("getFormByProcessId")
	@ApiOperation("获取流程表单")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "processId", value = "流程定义id", required = true),
	})
	public R<Map<String, Object>> getFormByProcessId(String processId) {
		if (ObjectUtil.isAnyEmpty(processId)) {
			return R.fail("参数错误");
		}
		return R.data(formService.getFormByProcessDefId(processId));
	}

	@PostMapping("startProcess")
	@ApiOperation("发起流程")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "processId", value = "流程定义id", required = true),
	})
	public R<String> startProcess(@ApiIgnore @RequestBody JSONObject body) {
		String processDefId = body.getString("processId");
		body.remove("processId");
		try {
			return R.data(processService.startProcessInstanceById(processDefId, body));
		} catch (Exception e) {
			return R.fail(e.getLocalizedMessage());
		}
	}

	@GetMapping("todoList")
	@ApiOperation("待办列表（包含待签）")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "name", value = "流程名称"),
		@ApiImplicitParam(name = "key", value = "流程标识"),
		@ApiImplicitParam(name = "category", value = "流程分类"),
		@ApiImplicitParam(name = "current", value = "当前第几页", required = true),
		@ApiImplicitParam(name = "size", value = "每页条数", required = true),
	})
	public R<IPage<WfProcess>> todoList(@ApiIgnore WfProcess process, Query query) {
		if (ObjectUtil.isAnyEmpty(query.getCurrent(), query.getSize())) {
			return R.fail("参数错误");
		}
		process.setStatus(WfProcessConstant.STATUS_TODO);
		return R.data(processService.selectTaskPage(process, query));
	}

	@GetMapping("doneList")
	@ApiOperation("办结列表")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "name", value = "流程名称"),
		@ApiImplicitParam(name = "key", value = "流程标识"),
		@ApiImplicitParam(name = "category", value = "流程分类"),
		@ApiImplicitParam(name = "current", value = "当前第几页", required = true),
		@ApiImplicitParam(name = "size", value = "每页条数", required = true),
	})
	public R<IPage<WfProcess>> doneList(@ApiIgnore WfProcess process, Query query) {
		if (ObjectUtil.isAnyEmpty(query.getCurrent(), query.getSize())) {
			return R.fail("参数错误");
		}
		process.setStatus(WfProcessConstant.STATUS_DONE);
		return R.data(processService.selectProcessPage(process, query));
	}

	@GetMapping("myDoneList")
	@ApiOperation("我的已办（流程不一定办结）")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "name", value = "流程名称"),
		@ApiImplicitParam(name = "key", value = "流程标识"),
		@ApiImplicitParam(name = "category", value = "流程分类"),
		@ApiImplicitParam(name = "current", value = "当前第几页", required = true),
		@ApiImplicitParam(name = "size", value = "每页条数", required = true),
	})
	public R<IPage<WfProcess>> myDoneList(@ApiIgnore WfProcess process, Query query) {
		if (ObjectUtil.isAnyEmpty(query.getCurrent(), query.getSize())) {
			return R.fail("参数错误");
		}
		process.setStatus(WfProcessConstant.STATUS_DONE);
		return R.data(processService.selectTaskPage(process, query));
	}

	@GetMapping("sendList")
	@ApiOperation("我的请求列表")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "name", value = "流程名称"),
		@ApiImplicitParam(name = "key", value = "流程标识"),
		@ApiImplicitParam(name = "category", value = "流程分类"),
		@ApiImplicitParam(name = "current", value = "当前第几页", required = true),
		@ApiImplicitParam(name = "size", value = "每页条数", required = true),
	})
	public R<IPage<WfProcess>> sendList(@ApiIgnore WfProcess process, Query query) {
		if (ObjectUtil.isAnyEmpty(query.getCurrent(), query.getSize())) {
			return R.fail("参数错误");
		}
		process.setStatus(WfProcessConstant.STATUS_SEND);
		return R.data(processService.selectProcessPage(process, query));
	}

	@GetMapping("claimList")
	@ApiOperation("待签列表")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "name", value = "流程名称"),
		@ApiImplicitParam(name = "key", value = "流程标识"),
		@ApiImplicitParam(name = "category", value = "流程分类"),
		@ApiImplicitParam(name = "current", value = "当前第几页", required = true),
		@ApiImplicitParam(name = "size", value = "每页条数", required = true),
	})
	public R<IPage<WfProcess>> claimList(@ApiIgnore WfProcess process, Query query) {
		if (ObjectUtil.isAnyEmpty(query.getCurrent(), query.getSize())) {
			return R.fail("参数错误");
		}
		process.setStatus(WfProcessConstant.STATUS_CLAIM);
		return R.data(processService.selectTaskPage(process, query));
	}

	@GetMapping("copyList")
	@ApiOperation("抄送列表")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "title", value = "标题"),
		@ApiImplicitParam(name = "initiator", value = "发起人"),
		@ApiImplicitParam(name = "current", value = "当前第几页", required = true),
		@ApiImplicitParam(name = "size", value = "每页条数", required = true),
	})
	public R<IPage<WfCopy>> page(@ApiIgnore @RequestParam Map<String, Object> copy, Query query) {
		if (ObjectUtil.isAnyEmpty(query.getCurrent(), query.getSize())) {
			return R.fail("参数错误");
		}
		return R.data(copyService.page(Condition.getPage(query), Condition.getQueryWrapper(copy, WfCopy.class).eq("user_id", Long.valueOf(WfTaskUtil.getTaskUser())).orderByDesc("id")));
	}

	@GetMapping("detail")
	@ApiOperation("流程详情")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id", required = true),
		@ApiImplicitParam(name = "processInsId", value = "流程实例id", required = true),
	})
	public R<Map<String, Object>> detail(String taskId, String processInsId) throws ExecutionException, InterruptedException {
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
	public R completeTask(@ApiIgnore @RequestBody WfProcess process, HttpServletRequest request) {

		String processInstanceId = process.getProcessInstanceId();

		String bladeAuth = request.getHeader("blade-auth");
		String authorization = request.getHeader("authorization");
		Cookie[] cookies = request.getCookies();
		bladeRedis.set("cookies" + processInstanceId,cookies);
		for (Cookie cookie : cookies) {
			if(cookie.getName().equals("saber-access-token")){
				bladeRedis.set("saber-access-token"+processInstanceId,cookie.getValue());
			}
			if(cookie.getName().equals("saber-refresh-token")){
				bladeRedis.set("saber-refresh-token"+processInstanceId,cookie.getValue());
			}
		}

		if (ObjectUtil.isAnyEmpty(process.getTaskId(), process.getProcessInstanceId())) {
			return R.fail("参数错误");
		}
		bladeRedis.set("blade-auth"+processInstanceId,bladeAuth);
		bladeRedis.set("authorization"+processInstanceId,authorization);
		return (R) processService.completeTask(process);
	}

	@PostMapping("transferTask")
	@ApiOperation("转办任务")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id", required = true),
		@ApiImplicitParam(name = "assignee", value = "接受人", required = true),
	})
	public R transferTask(@ApiIgnore @RequestBody WfProcess process) {
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
	public R delegateTask(@ApiIgnore @RequestBody WfProcess process) {
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
	public R claimTask(@ApiIgnore @RequestBody WfProcess process) {
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
	public R<List<WfNode>> getBackNodes(@ApiIgnore WfProcess process) {
		return R.data(processService.getBackNodes(process));
	}

	@PostMapping("rollbackTask")
	@ApiOperation("退回到指定节点")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "taskId", value = "任务id", required = true),
		@ApiImplicitParam(name = "nodeId", value = "节点id", required = true),
		@ApiImplicitParam(name = "comment", value = "评论", required = true),
	})
	public R rollbackTask(@ApiIgnore @RequestBody WfProcess process) {
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
	public R terminateProcess(@ApiIgnore @RequestBody WfProcess process) {
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
	public R addMultiInstance(@ApiIgnore @RequestBody WfProcess process) {
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
	public R withdrawTask(@ApiIgnore @RequestBody WfProcess process) {
		if (ObjectUtil.isAnyEmpty(process.getTaskId())) {
			return R.fail("参数错误");
		}
		return (R) processService.withdrawTask(process);
	}
}
