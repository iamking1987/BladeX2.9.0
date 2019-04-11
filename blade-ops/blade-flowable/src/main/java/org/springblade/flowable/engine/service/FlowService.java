package org.springblade.flowable.engine.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springblade.flowable.engine.entity.FlowModel;

/**
 * FlowService
 *
 * @author Chill
 */
public interface FlowService extends IService<FlowModel> {

	/**
	 * 自定义分页
	 * @param page
	 * @param flowModel
	 * @return
	 */
	IPage<FlowModel> selectFlowPage(IPage<FlowModel> page, FlowModel flowModel);
}
