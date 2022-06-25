
package org.springblade.plugin.workflow.design.dto;

import org.springblade.plugin.workflow.design.entity.WfButton;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 流程按钮数据传输对象实体类
 *
 * @author ssc
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class WfButtonDTO extends WfButton {
	private static final long serialVersionUID = 1L;

}
