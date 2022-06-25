
package org.springblade.plugin.workflow.design.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import org.springblade.core.mp.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 流程表达式实体类
 *
 * @author ssc
 */
@Data
@TableName("blade_wf_condition")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "WfCondition对象", description = "流程表达式")
public class WfCondition extends BaseEntity {

	private static final long serialVersionUID = 1L;

	/**
	 * 名称
	 */
	@ApiModelProperty(value = "名称")
	private String name;
	/**
	 * 表达式
	 */
	@ApiModelProperty(value = "表达式")
	private String expression;
	/**
	 * 类型
	 */
	@ApiModelProperty(value = "类型")
	private String type;


}
