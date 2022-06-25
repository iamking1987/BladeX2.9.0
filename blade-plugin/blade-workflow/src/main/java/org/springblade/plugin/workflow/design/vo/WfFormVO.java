package org.springblade.plugin.workflow.design.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springblade.plugin.workflow.design.entity.WfForm;

/**
 * 流程表单视图实体类
 *
 * @author ssc
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "WfFormVO对象", description = "流程表单")
public class WfFormVO extends WfForm {
	private static final long serialVersionUID = 1L;

	private Boolean newVersion;

	@ApiModelProperty("是否回退")
	private Boolean rollback;

}
