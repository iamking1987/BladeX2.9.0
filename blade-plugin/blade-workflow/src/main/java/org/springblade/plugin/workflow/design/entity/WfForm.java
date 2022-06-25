package org.springblade.plugin.workflow.design.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springblade.core.tenant.mp.TenantEntity;

/**
 * 流程表单
 *
 * @author ssc
 */
@Data
@TableName("blade_wf_form")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "流程表单")
public class WfForm extends TenantEntity {
//public class WfForm {

	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "表单key")
	private String formKey;

	@ApiModelProperty(value = "表单名称")
	private String name;

	@ApiModelProperty(value = "内容")
	private String content;

	@ApiModelProperty(value = "app内容")
	private String appContent;

	@ApiModelProperty(value = "版本")
	private Integer version;

	@ApiModelProperty(value = "分类id")
	@JsonSerialize(using = ToStringSerializer.class)
	private Long categoryId;

	@ApiModelProperty(value = "备注")
	private String remark;

}
