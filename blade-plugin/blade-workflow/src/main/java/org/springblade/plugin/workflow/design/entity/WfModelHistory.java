package org.springblade.plugin.workflow.design.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 流程模型定义历史
 *
 * @author ssc
 */
@Data
@TableName("ACT_DE_MODEL_HISTORY")
@ApiModel(value = "流程模型定义历史")
public class WfModelHistory implements Serializable {

	private static final long serialVersionUID = 1L;

	@TableId(value = "id", type = IdType.ASSIGN_UUID)
	private String id;

	@ApiModelProperty(value = "模型名称")
	private String name;

	@ApiModelProperty(value = "模型key")
	private String modelKey;

	@ApiModelProperty(value = "表单key")
	private String formKey;

	@ApiModelProperty(value = "分类id")
	@JsonSerialize(using = ToStringSerializer.class)
	private Long categoryId;

	@ApiModelProperty(value = "模型描述")
	private String description;

	@ApiModelProperty(value = "模型评论")
	private String modelComment;

	@ApiModelProperty(value = "创建时间")
	private Date created;

	@ApiModelProperty(value = "更新时间")
	private Date lastUpdated;

	@ApiModelProperty(value = "创建人")
	private String createdBy;

	@ApiModelProperty(value = "更新人")
	private String lastUpdatedBy;

	@ApiModelProperty(value = "版本")
	private Integer version;

	@ApiModelProperty(value = "模型类型")
	private Integer modelType;

	@ApiModelProperty(value = "移除时间")
	private Date removalDate;

	@ApiModelProperty(value = "流程设计器xml")
	private String xml;

	@ApiModelProperty(value = "模型编辑器json，可用于flowable-ui")
	private String modelEditorJson;

	@ApiModelProperty(value = "模型id")
	private String modelId;

	@ApiModelProperty(value = "租户id")
	private String tenantId;

}
