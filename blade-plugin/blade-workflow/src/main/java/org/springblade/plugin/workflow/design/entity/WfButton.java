package org.springblade.plugin.workflow.design.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.springblade.core.tenant.mp.TenantEntity;

/**
 * 流程按钮实体类
 *
 * @author ssc
 */
@Data
@TableName("blade_wf_button")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "WfButton对象", description = "流程按钮")
public class WfButton extends TenantEntity {
//public class WfButton   {

	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "key")
	private String buttonKey;

	@ApiModelProperty(value = "名称")
	private String name;

	@ApiModelProperty(value = "默认是否显示")
	private Boolean display;

	@ApiModelProperty(value = "排序")
	private Integer sort;


}
