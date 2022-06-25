
package org.springblade.plugin.workflow.design.dto;

import org.springblade.plugin.workflow.design.entity.WfCategory;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 流程分类数据传输对象实体类
 *
 * @author ssc
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class WfCategoryDTO extends WfCategory {
	private static final long serialVersionUID = 1L;

}
