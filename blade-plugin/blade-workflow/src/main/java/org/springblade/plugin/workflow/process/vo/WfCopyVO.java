
package org.springblade.plugin.workflow.process.vo;

import org.springblade.plugin.workflow.process.entity.WfCopy;
import lombok.Data;
import lombok.EqualsAndHashCode;
import io.swagger.annotations.ApiModel;

/**
 * 流程抄送视图实体类
 *
 * @author ssc
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "WfCopyVO对象", description = "流程抄送")
public class WfCopyVO extends WfCopy {
	private static final long serialVersionUID = 1L;

}
