package org.springblade.plugin.workflow.design.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.springblade.plugin.workflow.design.entity.WfModelScope;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * 流程模型权限 Mapper 接口
 *
 * @author ssc
 */
public interface WfModelScopeMapper extends BaseMapper<WfModelScope> {

	@Delete("DELETE FROM ACT_RU_IDENTITYLINK WHERE PROC_DEF_ID_ = #{processDefId}")
	void deleteIdentityLinkByDefId(@Param("processDefId") String processDefId);
}
