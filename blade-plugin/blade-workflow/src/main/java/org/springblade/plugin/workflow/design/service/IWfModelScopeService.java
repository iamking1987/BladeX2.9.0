package org.springblade.plugin.workflow.design.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.springblade.plugin.workflow.design.entity.WfModelScope;
import org.springblade.plugin.workflow.design.vo.WfModelScopeVO;

/**
 * 流程模型权限 服务类
 *
 * @author ssc
 */
public interface IWfModelScopeService extends IService<WfModelScope> {

	void submit(WfModelScopeVO wfModelScope);

	void saveDeploymentScope(String modelId, String deploymentId);

	void deleteByModelId(String modelId);

}
