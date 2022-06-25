
package org.springblade.plugin.workflow.design.mapper;

import org.springblade.plugin.workflow.design.entity.WfCategory;
import org.springblade.plugin.workflow.design.vo.WfCategoryVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;

import java.util.List;

/**
 * 流程分类 Mapper 接口
 *
 * @author ssc
 */
public interface WfCategoryMapper extends BaseMapper<WfCategory> {

	/**
	 * 自定义分页
	 *
	 * @param page
	 * @param wfCategory
	 * @return
	 */
	List<WfCategoryVO> selectWfCategoryPage(IPage page, WfCategoryVO wfCategory);

}
