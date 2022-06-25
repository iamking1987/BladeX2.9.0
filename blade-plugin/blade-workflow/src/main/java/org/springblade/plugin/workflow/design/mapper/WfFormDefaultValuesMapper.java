
package org.springblade.plugin.workflow.design.mapper;

import org.springblade.plugin.workflow.design.entity.WfFormDefaultValues;
import org.springblade.plugin.workflow.design.vo.WfFormDefaultValuesVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;

import java.util.List;

/**
 * 流程表单字段默认值 Mapper 接口
 *
 * @author ssc
 */
public interface WfFormDefaultValuesMapper extends BaseMapper<WfFormDefaultValues> {

	/**
	 * 自定义分页
	 *
	 * @param page
	 * @param wfFormDefaultValues
	 * @return
	 */
	List<WfFormDefaultValuesVO> selectWfFormDefaultValuesPage(IPage page, WfFormDefaultValuesVO wfFormDefaultValues);

}
