package org.springblade.plugin.workflow.design.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springblade.core.mp.support.Query;
import org.springblade.plugin.workflow.design.entity.WfModel;
import org.springblade.plugin.workflow.design.entity.WfProcessDef;

/**
 * 服务类
 */
public interface IWfDesignService extends IService<WfModel> {

	IPage<WfProcessDef> deploymentPage(WfProcessDef processDef, Query query);

	void changeDeploymentStatus(String processId, String status);

	void changeDeploymentCategory(String deploymentId, String category);

	void deleteDeployment(String deploymentId);
}
