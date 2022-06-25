package org.springblade.plugin.workflow.process.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Map;

/**
 * 流程消息实体类
 *
 * @author ssc
 */
@Data
@Accessors(chain = true)
public class WfNotice implements Serializable {

	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "发送者")
	private String fromUserId;

	@ApiModelProperty(value = "接受者")
	private String toUserId;

	@ApiModelProperty(value = "评论")
	private String comment;

	@ApiModelProperty(value = "任务id")
	private String taskId;

	@ApiModelProperty(value = "流程实例id")
	private String processId;

	@ApiModelProperty(value = "任务变量")
	private Map<String, Object> taskVariables;

	@ApiModelProperty(value = "消息类型")
	private Type type;

	@Getter
	@AllArgsConstructor
	public enum Type {

		START("start", "发起流程"),
		PASS("pass", "审核通过"),
		REJECT("reject", "审核驳回"),
		TRANSFER("transfer", "转办任务"),
		DELEGATE("delegate", "委托任务"),
		TERMINATE("terminate", "流程终结"),
		FINISH("finish", "流程结束"),
		CANDIDATE("candidate", "候选任务"),
		COPY("copy", "抄送任务"),
		ASSIGNEE("assignee", "变更审核人"),
		SUSPEND("suspend", "流程挂起"),
		ACTIVE("active", "流程激活"),
		URGE("urge", "催办任务"),
		DISPATCH("dispatch", "调度任务"),
		ADD_MULTI_INSTANCE("addMultiInstance", "加签任务"),
		DELETE_MULTI_INSTANCE("deleteMultiInstance", "减签任务");

		private final String type;
		private final String name;
	}

}
