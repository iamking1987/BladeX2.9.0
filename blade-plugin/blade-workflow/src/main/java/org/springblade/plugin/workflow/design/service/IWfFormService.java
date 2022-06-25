package org.springblade.plugin.workflow.design.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import org.flowable.bpmn.model.FlowElement;
import org.springblade.core.mp.base.BaseService;
import org.springblade.plugin.workflow.design.entity.WfForm;
import org.springblade.plugin.workflow.design.vo.WfFormVO;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Future;

/**
 * 服务类
 *
 * @since 2020-10-28
 */
public interface IWfFormService extends BaseService<WfForm> {

	/**
	 * 详情查询
	 */
	WfForm getOne(WfForm wfForm);

	/**
	 * 列表查询
	 */
	IPage<WfForm> page(IPage<WfForm> page, WfForm wfForm);

	/**
	 * select下拉使用
	 */
	List<WfForm> list(WfForm wfForm);


	Map<String, Object> getFormByProcessDefId(String processDefId);

	Future<Map<String, Object>> getFormByTaskId(String taskId);

	Object create(WfForm form);

	WfForm edit(WfFormVO form);

	void remove(WfFormVO form);

	void saveDeploymentForm(String formKey, String deployId, String tenantId);

	void saveIndepDeploymentForm(Collection<FlowElement> elements, String deployId, String tenantId);

	void changeCategory(String ids, Long categoryId);

}
