package org.springblade.plugin.workflow.design.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.flowable.engine.repository.Deployment;
import org.springblade.plugin.workflow.design.entity.WfModel;
import org.springblade.plugin.workflow.design.vo.WfModelVO;

/**
 * 服务类
 */
public interface IWfModelService extends IService<WfModel> {

	WfModelVO detail(WfModel model);

	WfModel saveModel(WfModel model);

	WfModel updateModel(WfModelVO model);

	Deployment deploy(WfModelVO model);

	void remove(WfModelVO model);

	void changeCategory(String ids, Long categoryId);

}
