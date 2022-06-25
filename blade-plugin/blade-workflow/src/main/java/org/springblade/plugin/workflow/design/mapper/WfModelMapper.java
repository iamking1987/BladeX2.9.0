package org.springblade.plugin.workflow.design.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springblade.plugin.workflow.design.entity.WfModel;

/**
 * Mapper 接口
 */
public interface WfModelMapper extends BaseMapper<WfModel> {

	@Update("UPDATE ACT_RE_PROCDEF SET CATEGORY_ = #{category} where DEPLOYMENT_ID_ = #{deploymentId}")
	void changeProcDefCategory(@Param("deploymentId") String deploymentId, @Param("category") String category);
}
