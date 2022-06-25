
package org.springblade.plugin.workflow.process.dto;

import org.springblade.plugin.workflow.process.entity.WfCopy;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 流程抄送数据传输对象实体类
 *
 * @author ssc
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class WfCopyDTO extends WfCopy {
	private static final long serialVersionUID = 1L;

}
