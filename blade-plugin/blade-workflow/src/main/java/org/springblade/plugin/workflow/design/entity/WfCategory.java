package org.springblade.plugin.workflow.design.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.springblade.core.tenant.mp.TenantEntity;

/**
 * 流程分类实体类
 *
 * @author ssc
 */
@Data
@TableName("blade_wf_category")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "WfCategory对象", description = "流程分类")
public class WfCategory extends TenantEntity {
//public class WfCategory{

	private static final long serialVersionUID = 1L;

	/**
	 * 分类名称
	 */
	@ApiModelProperty(value = "分类名称")
	private String name;
	/**
	 * 上级id
	 */
	@ApiModelProperty(value = "上级id")
	private Long pid;
	/**
	 * 排序
	 */
	@ApiModelProperty(value = "排序")
	private Integer sort;


}
