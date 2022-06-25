package org.springblade.plugin.workflow.ops.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.AllArgsConstructor;
import org.flowable.bpmn.model.*;
import org.flowable.bpmn.model.Process;
import org.flowable.engine.HistoryService;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.task.Comment;
import org.flowable.task.api.Task;
import org.flowable.task.api.TaskQuery;
import org.flowable.variable.api.history.HistoricVariableInstance;
import org.flowable.variable.api.history.HistoricVariableInstanceQuery;
import org.springblade.core.mp.support.Query;
import org.springblade.core.tool.utils.BeanUtil;
import org.springblade.core.tool.utils.DateUtil;
import org.springblade.core.tool.utils.Func;
import org.springblade.core.tool.utils.StringUtil;
import org.springblade.plugin.workflow.core.cache.WfProcessCache;
import org.springblade.plugin.workflow.core.constant.WfExtendConstant;
import org.springblade.plugin.workflow.core.constant.WfProcessConstant;
import org.springblade.plugin.workflow.core.utils.ObjectUtil;
import org.springblade.plugin.workflow.core.utils.WfModelUtil;
import org.springblade.plugin.workflow.core.utils.WfTaskUtil;
import org.springblade.plugin.workflow.ops.model.WfOps;
import org.springblade.plugin.workflow.ops.service.IWfOpsService;
import org.springblade.plugin.workflow.process.entity.WfNotice;
import org.springblade.plugin.workflow.process.model.WfNode;
import org.springblade.plugin.workflow.process.model.WfProcess;
import org.springblade.plugin.workflow.process.model.WfTaskUser;
import org.springblade.plugin.workflow.process.service.IWfCopyService;
import org.springblade.plugin.workflow.process.service.IWfNoticeService;
import org.springblade.plugin.workflow.process.service.IWfProcessService;
import org.springblade.system.user.cache.UserCache;
import org.springblade.system.user.entity.User;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.stream.Collectors;

/**
 * 流程运维 服务实现类
 *
 * @author ssc
 */
@Service
@AllArgsConstructor
public class WfOpsServiceImpl implements IWfOpsService {

	private final IWfProcessService wfProcessService;
	private final IWfCopyService wfCopyService;
	private final IWfNoticeService wfNoticeService;

	private final RuntimeService runtimeService;
	private final TaskService taskService;
	private final RepositoryService repositoryService;
	private final HistoryService historyService;

	@Override
	public IPage<WfOps> list(WfOps ops, Query query) {
		IPage<WfOps> page = new Page<>();

		TaskQuery taskInstanceQuery = taskService.createTaskQuery()
			.orderByTaskCreateTime().desc()
			.taskTenantId(WfTaskUtil.getTenantId());

		if (StringUtil.isNotBlank(ops.getProcessDefinitionName())) { // 流程名称
			taskInstanceQuery.processDefinitionNameLike("%" + ops.getProcessDefinitionName() + "%");
		}
		if (StringUtil.isNotBlank(ops.getProcessDefinitionKey())) { // 流程key
			taskInstanceQuery.processDefinitionKeyLike("%" + ops.getProcessDefinitionKey() + "%");
		}
		if (StringUtil.isNotBlank(ops.getTaskName())) { // 当前节点
			taskInstanceQuery.taskNameLike("%" + ops.getTaskName() + "%");
		}
		if (StringUtil.isNotBlank(ops.getCategory())) { // 分类
			taskInstanceQuery.processCategoryIn(Collections.singletonList(ops.getCategory()));
		}
		if (StringUtil.isNotBlank(ops.getStartUsername())) { // 申请人
			taskInstanceQuery.processVariableValueLike(WfProcessConstant.TASK_VARIABLE_APPLY_USER_NAME, "%" + ops.getStartUsername() + "%");
		}
		if (StringUtil.isNotBlank(ops.getSerialNumber())) { // 流水号
			taskInstanceQuery.processVariableValueLike(WfProcessConstant.TASK_VARIABLE_SN, "%" + ops.getSerialNumber() + "%");
		}
		if (StringUtil.isNotBlank(ops.getAssignee())) { // 审核人
			taskInstanceQuery.taskAssigneeIds(Arrays.asList(ops.getAssignee().split(",")));
		}
		if (StringUtil.isNotBlank(ops.getStartTimeRange())) { // 开始时间
			String[] dates = Func.toStrArray(ops.getStartTimeRange());
			if (dates.length == 2) {
				taskInstanceQuery.taskCreatedAfter(Func.parseDate(dates[0], DateUtil.PATTERN_DATETIME));
				taskInstanceQuery.taskCreatedBefore(Func.parseDate(dates[1], DateUtil.PATTERN_DATETIME));
			}
		}

		long count = taskInstanceQuery.count();
		page.setTotal(count);
		if (count > 0) {
			List<WfOps> list = new ArrayList<>();
			List<Task> taskList = taskInstanceQuery.listPage(Func.toInt((query.getCurrent() - 1) * query.getSize()), Func.toInt(query.getSize()));
			taskList.forEach(task -> {
				WfOps wfOps = new WfOps();
				// ProcessDefinition
				ProcessDefinition processDefinition = WfProcessCache.getProcessDefinition(task.getProcessDefinitionId());
				wfOps.setProcessDefinitionName(processDefinition.getName());
				wfOps.setProcessDefinitionKey(processDefinition.getKey());
				wfOps.setCategory(processDefinition.getCategory());
				// Task
				wfOps.setId(task.getId());
				wfOps.setTaskId(task.getId());
				wfOps.setTaskName(task.getName());
				wfOps.setProcessInstanceId(task.getProcessInstanceId());
				wfOps.setCreateTime(task.getCreateTime());
				wfOps.setIsSuspended(task.isSuspended());
				wfOps.setIsMultiInstance(wfProcessService.isMultiInstance(task.getTaskDefinitionKey(), task.getProcessDefinitionId()));
				if (StringUtil.isNotBlank(task.getAssignee())) {
					User user = UserCache.getUser(Long.valueOf(task.getAssignee()));
					if (user != null) {
						wfOps.setAssignee(user.getName());
					}
				} else {
					WfTaskUser taskUser = wfProcessService.getTaskUser(task.getProcessDefinitionId(), task.getProcessInstanceId(), task.getTaskDefinitionKey());
					List<User> userList = taskUser.getUserList();
					if (ObjectUtil.isNotEmpty(userList)) {
						wfOps.setAssignee(userList.stream().map(User::getName).collect(Collectors.joining("/")));
					}
				}
				// Variables
				HistoricVariableInstanceQuery variableInstanceQuery = historyService.createHistoricVariableInstanceQuery()
					.processInstanceId(task.getProcessInstanceId());
				HistoricVariableInstance applyUsername = variableInstanceQuery.variableName(WfProcessConstant.TASK_VARIABLE_APPLY_USER_NAME).singleResult();
				if (ObjectUtil.isNotEmpty(applyUsername)) {
					wfOps.setStartUsername(applyUsername.getValue().toString());
				}
				HistoricVariableInstance sn = variableInstanceQuery.variableName(WfProcessConstant.TASK_VARIABLE_SN).singleResult();
				if (ObjectUtil.isNotEmpty(sn)) {
					wfOps.setSerialNumber(sn.getValue().toString());
				}
				BpmnModel bpmnModel = repositoryService.getBpmnModel(task.getProcessDefinitionId());
				String exFormKey = WfModelUtil.getUserTaskExtensionAttribute(bpmnModel, WfExtendConstant.EX_FORM_KEY);
				if (StringUtil.isNotBlank(exFormKey)) {
					wfOps.setFormKey(WfProcessConstant.EX_FORM_PREFIX + exFormKey);
				}
				String exFormUrl = WfModelUtil.getUserTaskExtensionAttribute(bpmnModel, WfExtendConstant.EX_FORM_URL);
				if (StringUtil.isNotBlank(exFormUrl)) {
					wfOps.setFormKey(exFormUrl);
				}

				list.add(wfOps);
			});
			page.setRecords(list);
		}

		return page;
	}

	@Override
	public IPage<WfOps> processList(WfOps ops, Query query) {
		IPage<WfOps> page = new Page<>();

		IPage<WfProcess> processIPage = wfProcessService.selectProcessPage(ops, query);
		long count = processIPage.getTotal();
		List<WfOps> list = new ArrayList<>();
		if (count > 0) {
			processIPage.getRecords().forEach(p -> {
				WfOps wfOps = Objects.requireNonNull(BeanUtil.copy(p, WfOps.class));
				Future<List<WfProcess>> historyFlowList = wfProcessService.historyFlowList(p.getProcessInstanceId(), null, null);

				// 可在此处处理自己的业务字段
//				HistoricVariableInstanceQuery varQuery = historyService.createHistoricVariableInstanceQuery().processInstanceId(p.getProcessInstanceId());
// 				...
				try {
					boolean hasApplyNode = false;
					StringBuilder flows = new StringBuilder();
					List<WfProcess> flowList = historyFlowList.get();
					for (WfProcess flow : flowList) {
						if (Arrays.asList(WfProcessConstant.SEQUENCE_FLOW, WfProcessConstant.CANDIDATE).contains(flow.getHistoryActivityType())) {
							continue;
						}
						if (WfProcessConstant.START_EVENT.equals(flow.getHistoryActivityType())) { // 发起人
							flows = new StringBuilder();
							hasApplyNode = false;
							flows.append(flow.getAssigneeName()).append(WfProcessConstant.CONNECTOR);
						} else if (WfProcessConstant.USER_TASK.equals(flow.getHistoryActivityType())) { // 用户任务节点
							if (Arrays.asList("发起人", "申请人").contains(flow.getHistoryActivityName())) {
								hasApplyNode = true;
							}
							flows.append(flow.getAssigneeName());
							List<Comment> comments = flow.getComments();
							Collections.reverse(comments);
							if (!comments.isEmpty()) { // 节点内流转
								flows.append("(");
								for (Comment comment : comments) {
									switch (comment.getType()) {
										case WfProcessConstant.COMMENT_TYPE_WITHDRAW:
											flows.append("【撤销】");
											break;
										case WfProcessConstant.COMMENT_TYPE_RECALL:
											flows.append("【撤回】");
											break;
										case WfProcessConstant.COMMENT_TYPE_ROLLBACK:
											flows.append("【驳回】");
											break;
										case WfProcessConstant.COMMENT_TYPE_ADD_MULTI_INSTANCE:
											flows.append("【加签】");
											break;
										case WfProcessConstant.COMMENT_TYPE_DELETE_MULTI_INSTANCE:
											flows.append("【减签】");
											break;
										case WfProcessConstant.COMMENT_TYPE_DISPATCH:
											flows.append("【调度】");
											break;
										case WfProcessConstant.COMMENT_TYPE_TRANSFER:
											flows.append("【转办】");
											break;
										case WfProcessConstant.COMMENT_TYPE_DELEGATE:
											flows.append("【委托】");
											break;
										case WfProcessConstant.COMMENT_TYPE_TERMINATE:
											flows.append("【终止】");
											break;
										case WfProcessConstant.COMMENT_TYPE_COMMENT:
											flows.append("【审批】");
											break;
										case WfProcessConstant.COMMENT_TYPE_ASSIGNEE:
											flows.append("【变更】");
											break;
									}
									flows.append(comment.getFullMessage()).append(";");
								}
								flows.append(")");
							}
							flows.append(WfProcessConstant.CONNECTOR);
						} else if (WfProcessConstant.END_EVENT.equals(flow.getHistoryActivityType())) {
							flows.append("结束");
						}
					}
					String flow = flows.toString();
					if (hasApplyNode) { // 若包含发起人节点，去除开始节点和发起人节点重复的问题
						flow = flow.substring(flow.indexOf(WfProcessConstant.CONNECTOR) + 2);
					}
					if (!flow.endsWith("结束") && flow.contains(WfProcessConstant.CONNECTOR)) {
						String substring = flow.substring(0, flow.lastIndexOf(WfProcessConstant.CONNECTOR));
						substring += "(审核中)";
						wfOps.setFlow(substring);
					} else {
						wfOps.setFlow(flow);
					}
				} catch (InterruptedException | ExecutionException ignore) {
				}

				list.add(wfOps);
			});
		}
		page.setTotal(processIPage.getTotal());
		page.setRecords(list);
		return page;
	}

	@Override
	public void completeTask(WfOps ops) {
		String taskId = ops.getTaskId();
		if (StringUtil.isBlank(ops.getComment())) {
			User user = UserCache.getUser(Long.valueOf(WfTaskUtil.getTaskUser()));
			ops.setComment(user.getName() + "操作");
		}
		String[] taskIds = taskId.split(",");
		for (String id : taskIds) {
			Task task = taskService.createTaskQuery().taskId(id).singleResult();
			if (task != null) {
				taskService.setAssignee(task.getId(), WfTaskUtil.getTaskUser());
				ProcessDefinition definition = WfProcessCache.getProcessDefinition(task.getProcessDefinitionId());

				ops.setTaskId(id);
				ops.setProcessInstanceId(task.getProcessInstanceId());
				ops.setProcessDefinitionId(definition.getId());
				ops.setProcessDefinitionName(definition.getName());
				wfProcessService.completeTask(ops);
			}
		}
	}

	@Override
	public void changeTaskAssignee(WfOps ops) {
		String taskId = ops.getTaskId();
		String assignee = ops.getAssignee();
		String[] taskIds = taskId.split(",");
		for (String id : taskIds) {
			Task task = taskService.createTaskQuery().taskId(id).singleResult();
			if (task == null) continue;
			try {
				User fromUser = UserCache.getUser(task.getAssignee() == null ? Long.valueOf(WfTaskUtil.getTaskUser()) : Long.valueOf(task.getAssignee()));
				User toUser = UserCache.getUser(Long.valueOf(assignee));
				String message = fromUser.getName() + "→" + toUser.getName();
				if (StringUtil.isNotBlank(ops.getComment())) {
					message += "：" + ops.getComment();
				}
				taskService.addComment(task.getId(), task.getProcessInstanceId(), WfProcessConstant.COMMENT_TYPE_ASSIGNEE, message);
				taskService.setAssignee(task.getId(), assignee);

				// 处理消息
				wfNoticeService.resolveNoticeInfo(new WfNotice()
					.setFromUserId(WfTaskUtil.getTaskUser())
					.setToUserId(assignee)
					.setProcessId(task.getProcessInstanceId())
					.setTaskId(taskId)
					.setType(WfNotice.Type.ASSIGNEE));
			} catch (Exception ignore) {
			}
		}
	}

	@Override
	public void changeTaskStatus(WfOps ops) {
		String taskId = ops.getTaskId();
		Boolean isSuspended = ops.getIsSuspended();
		String[] taskIds = taskId.split(",");
		for (String id : taskIds) {
			Task task = taskService.createTaskQuery().taskId(id).singleResult();
			if (task == null) continue;
			try {
				if (isSuspended && !task.isSuspended()) {
					runtimeService.suspendProcessInstanceById(task.getProcessInstanceId());

					// 处理消息
					wfNoticeService.resolveNoticeInfo(new WfNotice()
						.setFromUserId(WfTaskUtil.getTaskUser())
						.setToUserId(task.getAssignee())
						.setProcessId(task.getProcessInstanceId())
						.setTaskId(taskId)
						.setType(WfNotice.Type.SUSPEND)).get();
				} else if (!isSuspended && task.isSuspended()) {
					runtimeService.activateProcessInstanceById(task.getProcessInstanceId());

					// 处理消息
					wfNoticeService.resolveNoticeInfo(new WfNotice()
						.setFromUserId(WfTaskUtil.getTaskUser())
						.setToUserId(task.getAssignee())
						.setProcessId(task.getProcessInstanceId())
						.setTaskId(taskId)
						.setType(WfNotice.Type.ACTIVE)).get();
				}
			} catch (Exception ignore) {
			}
		}
	}

	@Override
	public void transferTask(WfOps ops) {
		String taskId = ops.getTaskId();
		String[] taskIds = taskId.split(",");
		if (StringUtil.isBlank(ops.getComment())) {
			User user = UserCache.getUser(Long.valueOf(WfTaskUtil.getTaskUser()));
			ops.setComment(user.getName() + "操作");
		}
		for (String id : taskIds) {
			ops.setTaskId(id);
			wfProcessService.transferTask(ops);
		}
	}

	@Override
	public void delegateTask(WfOps ops) {
		String taskId = ops.getTaskId();
		String[] taskIds = taskId.split(",");
		if (StringUtil.isBlank(ops.getComment())) {
			User user = UserCache.getUser(Long.valueOf(WfTaskUtil.getTaskUser()));
			ops.setComment(user.getName() + "操作");
		}
		for (String id : taskIds) {
			ops.setTaskId(id);
			wfProcessService.delegateTask(ops);
		}
	}

	@Override
	public void copyTask(WfOps ops) {
		String taskId = ops.getTaskId();
		String assignee = ops.getAssignee();
		String[] taskIds = taskId.split(",");
		for (String id : taskIds) {
			Task task = taskService.createTaskQuery().taskId(id).singleResult();
			if (task != null) {
				ProcessDefinition definition = WfProcessCache.getProcessDefinition(task.getProcessDefinitionId());

				ops.setTaskId(id);
				ops.setProcessInstanceId(task.getProcessInstanceId());
				ops.setTaskName(definition.getName() + "-" + task.getName());
				ops.setCopyUser(assignee);
				ops.setAssignee(WfTaskUtil.getTaskUser());
				ops.setAssigneeName(WfTaskUtil.getNickName());
				try {
					wfCopyService.resolveCopyUser(ops).get();
				} catch (InterruptedException | ExecutionException ignore) {

				}
			}
		}
	}

	@Override
	public void urgeTask(WfOps ops) {
		String taskId = ops.getTaskId();
		String[] taskIds = taskId.split(",");
		for (String id : taskIds) {
			Task task = taskService.createTaskQuery().taskId(id).singleResult();
			if (task == null || task.getAssignee() == null) continue;
			try {
				// 处理消息
				wfNoticeService.resolveNoticeInfo(new WfNotice()
					.setFromUserId(WfTaskUtil.getTaskUser())
					.setToUserId(task.getAssignee())
					.setProcessId(task.getProcessInstanceId())
					.setTaskId(taskId)
					.setType(WfNotice.Type.URGE)).get();
			} catch (InterruptedException | ExecutionException ignore) {
			}
		}
	}

	@Override
	public void terminateProcess(WfOps ops) {
		String taskId = ops.getTaskId();
		String[] taskIds = taskId.split(",");
		if (StringUtil.isBlank(ops.getComment())) {
			User user = UserCache.getUser(Long.valueOf(WfTaskUtil.getTaskUser()));
			ops.setComment(user.getName() + "操作");
		}
		for (String id : taskIds) {
			ops.setTaskId(id);
			wfProcessService.terminateProcess(ops);
		}
	}

	@Override
	public List<WfNode> processNodes(WfOps ops) {
		String taskId = ops.getTaskId();
		String processInstanceId = ops.getProcessInstanceId();
		if (StringUtil.isNotBlank(taskId)) {
			return wfProcessService.getBackNodes(ops);
		} else {
			ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
			Process process = repositoryService.getBpmnModel(processInstance.getProcessDefinitionId()).getMainProcess();
			Collection<FlowElement> flowElements = process.getFlowElements();
			List<WfNode> result = new ArrayList<>();

			flowElements.forEach(flowElement -> {
				if (flowElement instanceof UserTask) {
					WfNode vo = new WfNode();
					vo.setNodeName(flowElement.getName());
					vo.setNodeId(flowElement.getId());
					result.add(vo);
				}
			});
			return result;
		}
	}

	@Override
	public void rollbackTask(WfOps ops) {
		if (StringUtil.isBlank(ops.getComment())) {
			User user = UserCache.getUser(Long.valueOf(WfTaskUtil.getTaskUser()));
			ops.setComment(user.getName() + "操作");
		}
		wfProcessService.rollbackTask(ops);
	}

	@Override
	public void dispatchTask(WfOps ops) {
		if (StringUtil.isBlank(ops.getComment())) {
			User user = UserCache.getUser(Long.valueOf(WfTaskUtil.getTaskUser()));
			ops.setComment(user.getName() + "操作");
		}
		String taskId = ops.getTaskId();
		String comment = ops.getComment();
		String nodeId = ops.getNodeId();

		Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
		if (task == null) {
			return;
		}
		Process process = repositoryService.getBpmnModel(task.getProcessDefinitionId()).getMainProcess();
		FlowElement toNode = process.getFlowElement(nodeId, true);
		comment = task.getName() + "→" + toNode.getName() + "：" + comment;

		taskService.addComment(taskId, task.getProcessInstanceId(), WfProcessConstant.COMMENT_TYPE_DISPATCH, comment);

		// 调度任务
		wfProcessService.dispatchTaskTo(task.getProcessInstanceId(), nodeId);

		// 处理消息
		wfNoticeService.resolveNoticeInfo(new WfNotice()
			.setFromUserId(WfTaskUtil.getTaskUser())
			.setProcessId(task.getProcessInstanceId())
			.setTaskId(taskId)
			.setComment(comment)
			.setType(WfNotice.Type.DISPATCH));
	}

	@Override
	public void addMultiInstance(WfOps ops) {
		if (StringUtil.isBlank(ops.getComment())) {
			User user = UserCache.getUser(Long.valueOf(WfTaskUtil.getTaskUser()));
			ops.setComment(user.getName() + "操作：");
		}
		wfProcessService.addMultiInstance(ops);
	}

	@Override
	public void deleteMultiInstance(WfOps ops) {
		String taskId = ops.getTaskId();
		String comment = ops.getComment();
		Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
		if (task == null) {
			return;
		}
		if (StringUtil.isBlank(comment)) {
			User user = UserCache.getUser(Long.valueOf(WfTaskUtil.getTaskUser()));
			comment = user.getName() + "操作";
		}
		// 添加评论
		taskService.addComment(taskId, task.getProcessInstanceId(), WfProcessConstant.COMMENT_TYPE_DELETE_MULTI_INSTANCE, comment);
		// 处理减签
		runtimeService.deleteMultiInstanceExecution(task.getExecutionId(), false);
		// 处理消息
		if (StringUtil.isNotBlank(task.getAssignee())) {
			wfNoticeService.resolveNoticeInfo(new WfNotice()
				.setFromUserId(WfTaskUtil.getTaskUser())
				.setToUserId(task.getAssignee())
				.setProcessId(task.getProcessInstanceId())
				.setTaskId(taskId)
				.setComment(comment)
				.setType(WfNotice.Type.DELETE_MULTI_INSTANCE));
		}
	}
}
