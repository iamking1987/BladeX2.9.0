package org.springblade.plugin.workflow.design.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.springblade.plugin.workflow.design.entity.WfModelHistory;

/**
 * Mapper 接口
 */
public interface WfModelHistoryMapper extends BaseMapper<WfModelHistory> {

	void removeByModelId(@Param("id") String id);
}
