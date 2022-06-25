package org.springblade.plugin.workflow.design.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.flowable.bpmn.model.FormProperty;
import org.springblade.plugin.workflow.design.entity.WfModel;

import java.util.List;

/**
 * 流程模型Vo
 *
 * @author ssc
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class WfModelVO extends WfModel {

	@ApiModelProperty("是否保存为新版本")
	Boolean newVersion;

	@ApiModelProperty("模型id")
	String modelId;

	@ApiModelProperty("模型分类")
	String category;

	@ApiModelProperty("是否回退")
	Boolean rollback;

	@ApiModelProperty("外置表单")
	List<FormProperty> exForm;
}
