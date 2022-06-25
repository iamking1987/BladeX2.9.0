
package org.springblade.plugin.workflow.design.vo;

import org.springblade.plugin.workflow.design.entity.WfFormHistory;
import lombok.Data;
import lombok.EqualsAndHashCode;
import io.swagger.annotations.ApiModel;

/**
 * 流程表单视图实体类
 *
 * @author ssc
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "WfFormHistoryVO对象", description = "流程表单")
public class WfFormHistoryVO extends WfFormHistory {
	private static final long serialVersionUID = 1L;

}
