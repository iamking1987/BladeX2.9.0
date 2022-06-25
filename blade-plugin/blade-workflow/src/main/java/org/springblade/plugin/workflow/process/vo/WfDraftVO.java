package org.springblade.plugin.workflow.process.vo;

import org.springblade.plugin.workflow.process.entity.WfDraft;
import lombok.Data;
import lombok.EqualsAndHashCode;
import io.swagger.annotations.ApiModel;

/**
 * 流程草稿箱视图实体类
 *
 * @author ssc
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "WfDraftVO对象", description = "流程草稿箱")
public class WfDraftVO extends WfDraft {
	private static final long serialVersionUID = 1L;

}
