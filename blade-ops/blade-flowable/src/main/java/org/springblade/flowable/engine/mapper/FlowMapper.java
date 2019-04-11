package org.springblade.flowable.engine.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.springblade.flowable.engine.entity.FlowModel;

import java.util.List;

/**
 * FlowMapper.
 *
 * @author Chill
 */
public interface FlowMapper extends BaseMapper<FlowModel> {

	/**
	 * 自定义分页
	 * @param page
	 * @param flowModel
	 * @return
	 */
	List<FlowModel> selectFlowPage(IPage page, FlowModel flowModel);
}
