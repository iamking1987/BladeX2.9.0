
package org.springblade.plugin.workflow.design.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import org.springblade.core.mp.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 流程表单实体类
 *
 * @author ssc
 */
@Data
@TableName("blade_wf_form_history")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "WfFormHistory对象", description = "流程表单")
public class WfFormHistory extends BaseEntity {

	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "表单id")
	private Long formId;

	@ApiModelProperty(value = "表单key")
	private String formKey;

	@ApiModelProperty(value = "表单名称")
	private String name;

	@ApiModelProperty(value = "表单内容")
	private String content;

	@ApiModelProperty(value = "app表单内容")
	private String appContent;

	@ApiModelProperty(value = "版本")
	private Integer version;

	@ApiModelProperty(value = "分类id")
	@JsonSerialize(using = ToStringSerializer.class)
	private Long categoryId;

	@ApiModelProperty(value = "备注")
	private String remark;


}
