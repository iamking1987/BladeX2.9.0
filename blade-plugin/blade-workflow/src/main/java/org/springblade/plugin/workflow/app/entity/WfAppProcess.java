package org.springblade.plugin.workflow.app.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springblade.plugin.workflow.process.model.WfProcess;
import org.springblade.system.user.entity.User;

import java.util.Date;

/**
 * @author ssc
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class WfAppProcess extends WfProcess {

	@ApiModelProperty("id")
	private String id;

	@ApiModelProperty("流程定义名称")
	private String processDefinitionName;

	@ApiModelProperty("流程定义key")
	private String processDefinitionKey;

	@ApiModelProperty("流程实例id")
	private String processInstanceId;

	@ApiModelProperty("申请人")
	private User applyUser;

	@ApiModelProperty("审核人")
	private String assignee;

	@ApiModelProperty("任务id")
	private String taskId;

	@ApiModelProperty("任务名称")
	private String taskName;

	@ApiModelProperty("节点id")
	private String nodeId;

	@ApiModelProperty("申请人名称")
	private String applyUserName;

	@ApiModelProperty("流水号")
	private String serialNumber;

	@ApiModelProperty("创建时间")
	private Date createTime;

	@ApiModelProperty("结束时间")
	private Date endTime;

	@ApiModelProperty("外置表单key")
	private String formKey;

	@ApiModelProperty("外置表单url")
	private String formUrl;

	@ApiModelProperty("是否多实例")
	private Boolean isMultiInstance;

	@ApiModelProperty("平台")
	private String platform;
}
