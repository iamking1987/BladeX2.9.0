package org.springblade.plugin.workflow.design.vo;

import org.springblade.plugin.workflow.design.entity.WfSerial;
import lombok.Data;
import lombok.EqualsAndHashCode;
import io.swagger.annotations.ApiModel;

/**
 * 流程流水号视图实体类
 *
 * @author ssc
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "WfSerialVO对象", description = "流程流水号")
public class WfSerialVO extends WfSerial {
	private static final long serialVersionUID = 1L;

}
