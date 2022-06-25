
package org.springblade.plugin.workflow.design.service.impl;

import org.springblade.plugin.workflow.design.entity.WfCondition;
import org.springblade.plugin.workflow.design.vo.WfConditionVO;
import org.springblade.plugin.workflow.design.mapper.WfConditionMapper;
import org.springblade.plugin.workflow.design.service.IWfConditionService;
import org.springblade.core.mp.base.BaseServiceImpl;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;

/**
 * 流程表达式 服务实现类
 *
 * @author ssc
 */
@Service
public class WfConditionServiceImpl extends BaseServiceImpl<WfConditionMapper, WfCondition> implements IWfConditionService {

	@Override
	public IPage<WfConditionVO> selectWfConditionPage(IPage<WfConditionVO> page, WfConditionVO wfCondition) {
		return page.setRecords(baseMapper.selectWfConditionPage(page, wfCondition));
	}

}
