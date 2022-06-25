
package org.springblade.plugin.workflow.design.vo;

import org.springblade.plugin.workflow.design.entity.WfCategory;
import lombok.Data;
import lombok.EqualsAndHashCode;
import io.swagger.annotations.ApiModel;

import java.util.List;

/**
 * 流程分类视图实体类
 *
 * @author ssc
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "WfCategoryVO对象", description = "流程分类")
public class WfCategoryVO extends WfCategory {
	private static final long serialVersionUID = 1L;

	List<WfCategoryVO> children;

}
