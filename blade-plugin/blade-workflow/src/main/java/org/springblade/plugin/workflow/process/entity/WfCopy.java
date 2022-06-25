
package org.springblade.plugin.workflow.process.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import org.springblade.core.mp.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 流程抄送实体类
 *
 * @author ssc
 */
@Data
@TableName("blade_wf_copy")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "WfCopy对象", description = "流程抄送")
public class WfCopy extends BaseEntity {

	private static final long serialVersionUID = 1L;

	/**
	 * 用户id
	 */
	@ApiModelProperty(value = "用户id")
	private Long userId;
	/**
	 * 标题
	 */
	@ApiModelProperty(value = "标题")
	private String title;
	/**
	 * 发起者
	 */
	@ApiModelProperty(value = "发起者")
	private String initiator;
	/**
	 * 任务id
	 */
	@ApiModelProperty(value = "任务id")
	private String taskId;
	/**
	 * 流程实例id
	 */
	@ApiModelProperty(value = "流程实例id")
	private String processId;

	@ApiModelProperty(value = "外置表单key")
	private String formKey;

	@ApiModelProperty(value = "外置表单url")
	private String formUrl;

}
