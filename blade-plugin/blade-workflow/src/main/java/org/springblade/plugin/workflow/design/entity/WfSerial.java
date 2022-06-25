package org.springblade.plugin.workflow.design.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import org.springblade.core.mp.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 流程流水号实体类
 *
 * @author ssc
 */
@Data
@TableName("blade_wf_serial")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "WfSerial对象", description = "流程流水号")
public class WfSerial extends BaseEntity {

	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "部署id")
	private String deploymentId;

	@ApiModelProperty(value = "名称")
	private String name;

	@ApiModelProperty(value = "前缀")
	private String prefix;

	@ApiModelProperty(value = "日期格式化")
	private String dateFormat;

	@ApiModelProperty(value = "后缀位数")
	private Integer suffixLength;

	@ApiModelProperty(value = "初始数值")
	private Integer startSequence;

	@ApiModelProperty(value = "连接符")
	private String connector;

	@ApiModelProperty(value = "当前序列")
	private Integer currentSequence;

	@ApiModelProperty(value = "重置周期 none不重置 day天 week周 month月 year年")
	private String cycle;


}
