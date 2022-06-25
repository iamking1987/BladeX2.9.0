package org.springblade.plugin.workflow.core.handler;

import org.flowable.bpmn.model.UserTask;
import org.flowable.common.engine.impl.el.ExpressionManager;
import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.engine.impl.bpmn.behavior.UserTaskActivityBehavior;
import org.flowable.engine.impl.cfg.ProcessEngineConfigurationImpl;
import org.flowable.task.service.TaskService;
import org.flowable.task.service.impl.persistence.entity.TaskEntity;
import org.springblade.core.tool.utils.SpringUtil;
import org.springblade.core.tool.utils.StringUtil;
import org.springblade.plugin.workflow.core.utils.ObjectUtil;
import org.springblade.plugin.workflow.process.model.WfTaskUser;
import org.springblade.plugin.workflow.process.service.IWfProcessService;
import org.springblade.system.user.entity.User;

import java.util.*;

/**
 * 自定义UserTask节点的Behavior
 *
 * @author ssc
 */
public class WfUserTaskActivityBehavior extends UserTaskActivityBehavior {

	public WfUserTaskActivityBehavior(UserTask userTask) {
		super(userTask);
	}

	@Override
	protected void handleAssignments(TaskService taskService, String assignee, String owner, List<String> candidateUsers, List<String> candidateGroups, TaskEntity task, ExpressionManager expressionManager, DelegateExecution execution, ProcessEngineConfigurationImpl processEngineConfiguration) {
		// 兼容之前的配置
		if (StringUtil.isNotBlank(assignee) || candidateUsers.size() > 0 || candidateGroups.size() > 0) {
			super.handleAssignments(taskService, assignee, owner, candidateUsers, candidateGroups, task, expressionManager, execution, processEngineConfiguration);
			return;
		}
		IWfProcessService wfProcessService = SpringUtil.getBean(IWfProcessService.class);
		WfTaskUser taskUser = wfProcessService.getTaskUser(task.getProcessDefinitionId(), task.getProcessInstanceId(), task.getTaskDefinitionKey());

		List<User> userList = taskUser.getUserList();
		candidateUsers = new ArrayList<>(taskUser.getCandidateUserIds());
		candidateGroups = new ArrayList<>(taskUser.getCandidateGroupIds());
		assignee = taskUser.getAssignee();

		if (ObjectUtil.isNotEmpty(userList)) {
			if (userList.size() == 1) { // 唯一审核人
				assignee = userList.get(0).getId() + "";
			}
		}
		super.handleAssignments(taskService, assignee, owner, candidateUsers, candidateGroups, task, expressionManager, execution, processEngineConfiguration);
	}
}
