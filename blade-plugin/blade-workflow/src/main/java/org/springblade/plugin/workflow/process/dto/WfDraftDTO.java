package org.springblade.plugin.workflow.process.dto;

import org.springblade.plugin.workflow.process.entity.WfDraft;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 流程草稿箱数据传输对象实体类
 *
 * @author ssc
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class WfDraftDTO extends WfDraft {
	private static final long serialVersionUID = 1L;

}
