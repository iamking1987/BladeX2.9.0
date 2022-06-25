package org.springblade.plugin.workflow.core.handler;

import lombok.AllArgsConstructor;
import org.flowable.engine.delegate.DelegateExecution;
import org.springblade.core.tool.utils.StringUtil;
import org.springblade.plugin.workflow.core.utils.ObjectUtil;
import org.springblade.plugin.workflow.process.model.WfTaskUser;
import org.springblade.plugin.workflow.process.service.IWfProcessService;
import org.springblade.system.user.entity.User;
import org.springframework.stereotype.Component;

import java.util.*;

/**
 * 多实例人员配置处理
 *
 * @author ssc
 */
@Component
@AllArgsConstructor
public class WfMultiInstanceHandler {

	private final IWfProcessService processService;

	public LinkedHashSet<String> getList(DelegateExecution execution) {
		LinkedHashSet<String> candidateUserIds = new LinkedHashSet<>();

		WfTaskUser taskUser = processService.getTaskUser(execution.getProcessDefinitionId(), execution.getProcessInstanceId(), execution.getCurrentActivityId());
		List<User> userList = taskUser.getUserList();
		String assignee = taskUser.getAssignee();
		LinkedHashSet<String> userIds = taskUser.getCandidateUserIds();
		if (ObjectUtil.isNotEmpty(userIds)) {
			candidateUserIds = userIds;
		} else if (ObjectUtil.isNotEmpty(userList)) {
			LinkedHashSet<String> finalCandidateUserIds = candidateUserIds;
			userList.forEach(user -> finalCandidateUserIds.add(user.getId() + ""));
		} else if (StringUtil.isNotBlank(assignee)) {
			candidateUserIds.add(assignee);
		}
		return candidateUserIds;
	}
}
