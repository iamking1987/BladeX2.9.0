package org.springblade.plugin.workflow.process.service;

import org.flowable.engine.history.HistoricProcessInstance;
import org.flowable.task.api.history.HistoricTaskInstance;
import org.springblade.plugin.workflow.process.entity.WfNotice;
import org.springblade.system.user.entity.User;

import javax.annotation.Nullable;
import java.util.Map;
import java.util.concurrent.Future;

public interface IWfNoticeService {

	/**
	 * 统一消息/业务入口
	 *
	 * @param fromUser        发送人
	 * @param toUser          接收人
	 * @param comment         评论
	 * @param type            消息类型
	 * @param processInstance 流程实例
	 * @param task            任务实例
	 * @param taskVariables   任务变量
	 */
	void sendNotice(User fromUser, User toUser, @Nullable String comment, WfNotice.Type type, HistoricProcessInstance processInstance, @Nullable HistoricTaskInstance task, @Nullable Map<String, Object> taskVariables);

	Future<String> resolveNoticeInfo(WfNotice notice);

}
