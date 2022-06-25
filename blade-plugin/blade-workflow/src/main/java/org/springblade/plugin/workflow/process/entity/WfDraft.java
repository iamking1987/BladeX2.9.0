package org.springblade.plugin.workflow.process.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.experimental.Accessors;

/**
 * 流程草稿箱实体类
 *
 * @author ssc
 */
@Data
@Accessors(chain = true)
@TableName("blade_wf_draft")
@ApiModel(value = "WfDraft对象", description = "流程草稿箱")
public class WfDraft implements Serializable {

	private static final long serialVersionUID = 1L;

	@JsonSerialize(using = ToStringSerializer.class)
	@TableId(value = "id", type = IdType.ASSIGN_ID)
	private Long id;

	@ApiModelProperty(value = "用户id")
	private Long userId;

	@ApiModelProperty(value = "表单key")
	private String formKey;

	@ApiModelProperty(value = "流程定义id")
	private String processDefId;

	@ApiModelProperty(value = "表单变量")
	private String variables;

	@ApiModelProperty(value = "平台 pc/app")
	private String platform;


}
