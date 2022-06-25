
package org.springblade.plugin.workflow.design.dto;

import org.springblade.plugin.workflow.design.entity.WfSerial;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 流程流水号数据传输对象实体类
 *
 * @author ssc
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class WfSerialDTO extends WfSerial {
	private static final long serialVersionUID = 1L;

}
