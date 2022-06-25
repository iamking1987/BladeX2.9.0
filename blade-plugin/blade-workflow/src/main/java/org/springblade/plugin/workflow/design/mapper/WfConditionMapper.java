
package org.springblade.plugin.workflow.design.mapper;

import org.springblade.plugin.workflow.design.entity.WfCondition;
import org.springblade.plugin.workflow.design.vo.WfConditionVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;

import java.util.List;

/**
 * 流程表达式 Mapper 接口
 *
 * @author ssc
 */
public interface WfConditionMapper extends BaseMapper<WfCondition> {

	/**
	 * 自定义分页
	 *
	 * @param page
	 * @param wfCondition
	 * @return
	 */
	List<WfConditionVO> selectWfConditionPage(IPage page, WfConditionVO wfCondition);

}
