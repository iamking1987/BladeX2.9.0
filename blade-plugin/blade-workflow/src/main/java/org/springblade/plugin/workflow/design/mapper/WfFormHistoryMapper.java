
package org.springblade.plugin.workflow.design.mapper;

import org.apache.ibatis.annotations.Param;
import org.springblade.plugin.workflow.design.entity.WfFormHistory;
import org.springblade.plugin.workflow.design.vo.WfFormHistoryVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;

import java.util.List;

/**
 * 流程表单 Mapper 接口
 *
 * @author ssc
 */
public interface WfFormHistoryMapper extends BaseMapper<WfFormHistory> {

	/**
	 * 自定义分页
	 *
	 * @param page
	 * @param wfFormHistory
	 * @return
	 */
	List<WfFormHistoryVO> selectWfFormHistoryPage(IPage page, WfFormHistoryVO wfFormHistory);

	void removeByFormId(@Param("id") Long id);

}
