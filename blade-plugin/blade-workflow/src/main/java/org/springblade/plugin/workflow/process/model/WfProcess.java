package org.springblade.plugin.workflow.process.model;

import lombok.Data;
import org.flowable.engine.impl.persistence.entity.AttachmentEntityImpl;
import org.flowable.engine.task.Attachment;
import org.flowable.engine.task.Comment;
import org.springblade.plugin.workflow.core.constant.WfProcessConstant;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Data
public class WfProcess implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 任务编号
	 */
	private String taskId;
	/**
	 * 任务名称
	 */
	private String taskName;
	/**
	 * 任务定义Key
	 */
	private String taskDefinitionKey;
	/**
	 * 任务执行人编号
	 */
	private String assignee;
	/**
	 * 节点id
	 */
	private String nodeId;
	/**
	 * 抄送人
	 */
	private String copyUser;
	/**
	 * 抄送人名称
	 */
	private String copyUserName;
	/**
	 * 流水号
	 */
	private String serialNumber;
	/**
	 * 任务执行人名称
	 */
	private String assigneeName;
	/**
	 * 发起人人名称
	 */
	private String startUsername;
	/**
	 * 流程分类
	 */
	private String category;
	/**
	 * 流程分类名
	 */
	private String categoryName;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 结束时间
	 */
	private Date endTime;
	/**
	 * 签收时间
	 */
	private Date claimTime;
	/**
	 * 历史任务结束时间
	 */
	private Date historyTaskEndTime;
	/**
	 * 执行ID
	 */
	private String executionId;
	/**
	 * 流程实例ID
	 */
	private String processInstanceId;
	/**
	 * 流程ID
	 */
	private String processDefinitionId;
	/**
	 * 流程标识
	 */
	private String processDefinitionKey;
	/**
	 * 流程名
	 */
	private String processDefinitionName;
	/**
	 * 流程版本
	 */
	private int processDefinitionVersion;
	/**
	 * 流程说明
	 */
	private String processDefinitionDesc;
	/**
	 * 流程简图名
	 */
	private String processDefinitionDiagramResName;
	/**
	 * 流程重命名
	 */
	private String processDefinitionResName;
	/**
	 * 历史任务流程实例ID 查看流程图会用到
	 */
	private String historyProcessInstanceId;
	/**
	 * 流程实例是否结束
	 */
	private String processIsFinished;
	/**
	 * 历史活动ID
	 */
	private String historyActivityId;
	/**
	 * 历史活动流程
	 */
	private String historyActivityName;
	/**
	 * 历史活动类型
	 */
	private String historyActivityType;
	/**
	 * 历史活动耗时
	 */
	private String historyActivityDurationTime;
	/**
	 * 业务绑定Table
	 */
	private String businessTable;
	/**
	 * 业务绑定ID
	 */
	private String businessId;
	/**
	 * 任务状态
	 */
	private String status;
	/**
	 * 任务意见
	 */
	private List<Comment> comments;
	/**
	 * 任务意见
	 */
	private String comment;
	/**
	 * 附件
	 */
	private List<Attachment> attachments;
	/**
	 * 附件
	 */
	private List<AttachmentEntityImpl> attachment;
	/**
	 * 表单key
	 */
	private String formKey;
	/**
	 * 表单url
	 */
	private String formUrl;
	/**
	 * app表单url
	 */
	private String appFormUrl;
	/**
	 * 隐藏评论附件选项
	 */
	private Boolean hideAttachment;
	/**
	 * 隐藏抄送人选项
	 */
	private Boolean hideCopy;
	/**
	 * 隐藏选择下一步审核人选项
	 */
	private Boolean hideExamine;
	/**
	 * 是否通过
	 */
	private boolean pass;
	/**
	 * 流程参数
	 */
	private Map<String, Object> variables;

	/**
	 * 当前节点是否多实例
	 */
	private Boolean isMultiInstance;

	private String xml;

	public boolean isPass() {
		return pass || WfProcessConstant.PASS_COMMENT.equals(comment);
	}

	/**
	 * 是否是当前流程发起人
	 */
	private Boolean isOwner;

	/**
	 * 是否可撤回
	 */
	private Boolean isReturnable;

	/**
	 * 撤回类型
	 */
	private String withdrawType;

	/**
	 * 申请时间范围，逗号分割
	 */
	private String startTimeRange;

	/**
	 * 结束时间范围，逗号分割
	 */
	private String endTimeRange;

	/**
	 * 表单搜索条件
	 */
	private String formSearch;

}
