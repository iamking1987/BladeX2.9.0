package org.springblade.plugin.workflow.design.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;

/**
 * 流程模型权限实体类
 *
 * @author ssc
 */
@Data
@TableName("blade_wf_model_scope")
@ApiModel(value = "WfModelScope对象", description = "流程模型权限")
public class WfModelScope implements Serializable {

	private static final long serialVersionUID = 1L;

	@TableId(value = "id", type = IdType.ASSIGN_ID)
	@JsonSerialize(using = ToStringSerializer.class)
	private Long id;

	@ApiModelProperty(value = "模型id")
	private String modelId;

	@ApiModelProperty(value = "模型key")
	private String modelKey;

	@ApiModelProperty(value = "类型 user用户 role角色 dept部门 post职位")
	private String type;

	@ApiModelProperty(value = "用户/角色/部门/职位 id集合")
	private String val;

	@ApiModelProperty(value = "用户/角色/部门/职位 name集合")
	private String text;


}
