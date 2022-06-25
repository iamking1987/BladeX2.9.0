package org.springblade.plugin.workflow.design.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springblade.core.mp.base.BaseEntity;

/**
 * 流程部署 - 表单
 *
 * @author ssc
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("blade_wf_deployment_form")
@ApiModel(value = "流程部署 - 表单")
public class WfDeploymentForm extends BaseEntity {

	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "流程部署id")
	private String deploymentId;

	@ApiModelProperty(value = "表单key")
	private String formKey;

	@ApiModelProperty(value = "表单内容")
	private String content;

	@ApiModelProperty(value = "app表单内容")
	private String appContent;

	@ApiModelProperty(value = "节点key")
	private String taskKey;

	@ApiModelProperty(value = "节点名称")
	private String taskName;

}
