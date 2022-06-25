
package org.springblade.plugin.workflow.design.dto;

import org.springblade.plugin.workflow.design.entity.WfCondition;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 流程表达式数据传输对象实体类
 *
 * @author ssc
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class WfConditionDTO extends WfCondition {
	private static final long serialVersionUID = 1L;

}
