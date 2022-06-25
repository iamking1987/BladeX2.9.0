
package org.springblade.plugin.workflow.design.service;

import org.springblade.plugin.workflow.design.entity.WfCondition;
import org.springblade.plugin.workflow.design.vo.WfConditionVO;
import org.springblade.core.mp.base.BaseService;
import com.baomidou.mybatisplus.core.metadata.IPage;

/**
 * 流程表达式 服务类
 *
 * @author ssc
 */
public interface IWfConditionService extends BaseService<WfCondition> {

	/**
	 * 自定义分页
	 *
	 * @param page
	 * @param wfCondition
	 * @return
	 */
	IPage<WfConditionVO> selectWfConditionPage(IPage<WfConditionVO> page, WfConditionVO wfCondition);

}
