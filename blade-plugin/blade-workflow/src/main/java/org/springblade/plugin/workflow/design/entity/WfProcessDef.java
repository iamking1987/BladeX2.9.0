package org.springblade.plugin.workflow.design.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.flowable.engine.impl.persistence.entity.ProcessDefinitionEntityImpl;

import java.io.Serializable;
import java.util.Date;

/**
 * 流程定义
 */
@Data
@ApiModel(value = "流程定义")
public class WfProcessDef implements Serializable {

	private String id;

	@ApiModelProperty(value = "租户id")
	private String tenantId;

	@ApiModelProperty(value = "流程名称")
	private String name;

	@ApiModelProperty(value = "流程key")
	private String key;

	@ApiModelProperty(value = "流程分类")
	private String category;

	@ApiModelProperty(value = "流程状态")
	private Integer status;

	@ApiModelProperty(value = "版本")
	private Integer version;

	@ApiModelProperty(value = "部署时间")
	private Date deployTime;

	@ApiModelProperty(value = "部署id")
	private String deploymentId;

	@ApiModelProperty(value = "表单key")
	private String formKey;

	@ApiModelProperty(value = "表单url")
	private String formUrl;

	@ApiModelProperty(value = "app表单url")
	private String appFormUrl;

	@ApiModelProperty(value = "开启流程权限")
	private Boolean scope;

	@ApiModelProperty(value = "默认抄送人")
	private String copyUser;

	@ApiModelProperty(value = "默认抄送人名称")
	private String copyUserName;

	@ApiModelProperty(value = "隐藏抄送人选项")
	private Boolean hideCopy;

	@ApiModelProperty(value = "隐藏选择下一步审核人选项")
	private Boolean hideExamine;

	@ApiModelProperty(value = "平台")
	private String platform;

	public WfProcessDef() {
	}

	public WfProcessDef(ProcessDefinitionEntityImpl entity) {
		this.id = entity.getId();
		this.tenantId = entity.getTenantId();
		this.name = entity.getName();
		this.key = entity.getKey();
		this.category = entity.getCategory();
		this.status = entity.getSuspensionState();
	}

}
