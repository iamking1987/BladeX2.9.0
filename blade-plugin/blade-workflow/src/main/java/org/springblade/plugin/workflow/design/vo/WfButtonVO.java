
package org.springblade.plugin.workflow.design.vo;

import org.springblade.plugin.workflow.design.entity.WfButton;
import lombok.Data;
import lombok.EqualsAndHashCode;
import io.swagger.annotations.ApiModel;

/**
 * 流程按钮视图实体类
 *
 * @author ssc
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "WfButtonVO对象", description = "流程按钮")
public class WfButtonVO extends WfButton {
	private static final long serialVersionUID = 1L;

	private Boolean display;
}
