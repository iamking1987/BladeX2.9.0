package org.springblade.plugin.workflow.design.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.springblade.core.tenant.mp.TenantEntity;

/**
 * 流程表单字段默认值实体类
 *
 * @author ssc
 */
@Data
@TableName("blade_wf_form_default_values")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "WfFormDefaultValues对象", description = "流程表单字段默认值")
public class WfFormDefaultValues extends TenantEntity {
//public class WfFormDefaultValues {

	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "名称")
	private String name;

	@ApiModelProperty(value = "内容")
	private String content;

	@ApiModelProperty(value = "字段类型")
	private String fieldType;

}
