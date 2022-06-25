package org.springblade.plugin.workflow.core.constant;

/**
 * 流程常量.
 */
public interface WfProcessConstant {

	String SUFFIX = ".bpmn20.xml";

	String STATUS_TODO = "todo";

	String STATUS_CLAIM = "claim";

	String STATUS_SEND = "send";

	String STATUS_DONE = "done";

	String STATUS_FINISHED = "finished";

	String STATUS_UNFINISHED = "unfinished";

	String STATUS_TERMINATE = "terminate";

	String STATUS_WITHDRAW = "withdraw";

	String STATUS_RECALL = "recall";

	String STATUS_REJECT = "reject";

	String STATUS_FINISH = "finish";

	String START_EVENT = "startEvent";

	String END_EVENT = "endEvent";

	String USER_TASK = "userTask";

	String SEQUENCE_FLOW = "sequenceFlow";

	String CANDIDATE = "candidate";

	String CONNECTOR = "—>";

	String SPECIAL_GATEWAY_BEGIN_SUFFIX = "_begin";

	String SPECIAL_GATEWAY_END_SUFFIX = "_end";

	String COMMENT_TYPE_ASSIGNEE = "assigneeComment";

	String COMMENT_TYPE_DISPATCH = "dispatchComment";

	String COMMENT_TYPE_TRANSFER = "transferComment";

	String COMMENT_TYPE_DELEGATE = "delegateComment";

	String COMMENT_TYPE_TERMINATE = "terminateComment";

	String COMMENT_TYPE_WITHDRAW = "withdrawComment";

	String COMMENT_TYPE_RECALL = "recallComment";

	String COMMENT_TYPE_ROLLBACK = "rollbackComment";

	String COMMENT_TYPE_ADD_MULTI_INSTANCE = "addMultiInstanceComment";

	String COMMENT_TYPE_DELETE_MULTI_INSTANCE = "deleteMultiInstanceComment";

	String COMMENT_TYPE_COMMENT = "comment";

	/**
	 * 同意标识
	 */
	String PASS_KEY = "pass";

	/**
	 * 同意代号
	 */
	String PASS_ALIAS = "ok";

	/**
	 * 同意默认批复
	 */
	String PASS_COMMENT = "同意";

	/**
	 * 驳回默认批复
	 */
	String NOT_PASS_COMMENT = "驳回";

	/**
	 * 创建人变量名
	 */
	String TASK_VARIABLE_APPLY_USER = "applyUser";

	/**
	 * 创建人名称
	 */
	String TASK_VARIABLE_APPLY_USER_NAME = "applyUserName";

	/**
	 * 流水号
	 */
	String TASK_VARIABLE_SN = "serialNumber";

	/**
	 * 外置表单前缀
	 */
	String EX_FORM_PREFIX = "wf_ex_";

	/**
	 * 节点独立表单
	 */
	String INDEP_FORM_PREFIX = "wf_indep_";

	String TASK_VARIABLE_ASSIGNEE = "assignee";

	String TASK_VARIABLE_COPY_USER = "copyUser";

	String TASK_VARIABLE_APPOINT = "wf_appoint";

	String TASK_VARIABLE_PROCESS_TERMINATE = "wf_process_terminate";

	String WITHDRAW_TYPE_START = "wf_withdraw_start";

	String WITHDRAW_TYPE_END = "wf_withdraw_end";

}
