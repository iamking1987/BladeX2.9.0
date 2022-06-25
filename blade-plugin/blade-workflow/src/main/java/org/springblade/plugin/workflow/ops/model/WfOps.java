package org.springblade.plugin.workflow.ops.model;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springblade.plugin.workflow.process.model.WfProcess;

import java.util.Date;

@Data
@EqualsAndHashCode(callSuper = true)
public class WfOps extends WfProcess {

	@ApiModelProperty("id")
	private String id;

	@ApiModelProperty("标题")
	private String title;

	@ApiModelProperty("流程定义名称")
	private String processDefinitionName;

	@ApiModelProperty("流程定义key")
	private String processDefinitionKey;

	@ApiModelProperty("流程实例id")
	private String processInstanceId;

	@ApiModelProperty("审核人")
	private String assignee;

	@ApiModelProperty("候选人")
	private String candidateUsers;

	@ApiModelProperty("候选组")
	private String candidateGroups;

	@ApiModelProperty("任务id")
	private String taskId;

	@ApiModelProperty("任务名称")
	private String taskName;

	@ApiModelProperty("节点id")
	private String nodeId;

	@ApiModelProperty("分类")
	private String category;

	@ApiModelProperty("流水号")
	private String serialNumber;

	@ApiModelProperty("创建时间")
	private Date createTime;

	@ApiModelProperty("结束时间")
	private Date endTime;

	@ApiModelProperty("是否挂起")
	private Boolean isSuspended;

	@ApiModelProperty("外置表单key")
	private String formKey;

	@ApiModelProperty("外置表单url")
	private String formUrl;

	@ApiModelProperty("是否多实例")
	private Boolean isMultiInstance;

	@ApiModelProperty("流转信息")
	private String flow;

}
