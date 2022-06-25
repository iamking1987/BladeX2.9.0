
package org.springblade.plugin.workflow.design.dto;

import org.springblade.plugin.workflow.design.entity.WfFormHistory;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 流程表单数据传输对象实体类
 *
 * @author ssc
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class WfFormHistoryDTO extends WfFormHistory {
	private static final long serialVersionUID = 1L;

}
