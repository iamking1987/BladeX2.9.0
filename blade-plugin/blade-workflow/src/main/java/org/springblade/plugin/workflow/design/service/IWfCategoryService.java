
package org.springblade.plugin.workflow.design.service;

import org.springblade.plugin.workflow.design.entity.WfCategory;
import org.springblade.plugin.workflow.design.vo.WfCategoryVO;
import org.springblade.core.mp.base.BaseService;
import com.baomidou.mybatisplus.core.metadata.IPage;

import java.util.List;

/**
 * 流程分类 服务类
 *
 * @author ssc
 */
public interface IWfCategoryService extends BaseService<WfCategory> {

	/**
	 * 自定义分页
	 *
	 * @param page
	 * @param wfCategory
	 * @return
	 */
	IPage<WfCategoryVO> selectWfCategoryPage(IPage<WfCategoryVO> page, WfCategoryVO wfCategory);

	List<WfCategoryVO> tree();

	List<WfCategoryVO> allTree();

}
