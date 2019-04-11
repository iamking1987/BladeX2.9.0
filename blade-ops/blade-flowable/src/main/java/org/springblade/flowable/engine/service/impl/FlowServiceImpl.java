package org.springblade.flowable.engine.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springblade.flowable.engine.entity.FlowModel;
import org.springblade.flowable.engine.mapper.FlowMapper;
import org.springblade.flowable.engine.service.FlowService;
import org.springframework.stereotype.Service;

/**
 * FlowServiceImpl
 *
 * @author Chill
 */
@Service
public class FlowServiceImpl extends ServiceImpl<FlowMapper, FlowModel> implements FlowService {
	@Override
	public IPage<FlowModel> selectFlowPage(IPage<FlowModel> page, FlowModel flowModel) {
		return page.setRecords(baseMapper.selectFlowPage(page, flowModel));
	}
}
