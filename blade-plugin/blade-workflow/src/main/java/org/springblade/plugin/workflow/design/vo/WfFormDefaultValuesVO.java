
package org.springblade.plugin.workflow.design.vo;

import org.springblade.plugin.workflow.design.entity.WfFormDefaultValues;
import lombok.Data;
import lombok.EqualsAndHashCode;
import io.swagger.annotations.ApiModel;

/**
 * 流程表单字段默认值视图实体类
 *
 * @author ssc
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "WfFormDefaultValuesVO对象", description = "流程表单字段默认值")
public class WfFormDefaultValuesVO extends WfFormDefaultValues {
	private static final long serialVersionUID = 1L;

}
