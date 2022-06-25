package org.springblade.plugin.workflow.design.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.StartEvent;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.repository.Deployment;
import org.springblade.core.mp.support.Condition;
import org.springblade.core.tool.utils.BeanUtil;
import org.springblade.core.tool.utils.StringUtil;
import org.springblade.plugin.workflow.core.constant.WfProcessConstant;
import org.springblade.plugin.workflow.core.utils.WfModelUtil;
import org.springblade.plugin.workflow.core.utils.WfTaskUtil;
import org.springblade.plugin.workflow.design.entity.*;
import org.springblade.plugin.workflow.design.mapper.WfModelHistoryMapper;
import org.springblade.plugin.workflow.design.mapper.WfModelMapper;
import org.springblade.plugin.workflow.design.service.IWfFormService;
import org.springblade.plugin.workflow.design.service.IWfModelScopeService;
import org.springblade.plugin.workflow.design.service.IWfModelService;
import org.springblade.plugin.workflow.design.service.IWfSerialService;
import org.springblade.plugin.workflow.design.vo.WfModelVO;
import org.springblade.plugin.workflow.design.wrapper.WfModelWrapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Calendar;

/**
 * 服务实现类
 */
@Service
@AllArgsConstructor
public class WfModelServiceImpl extends ServiceImpl<WfModelMapper, WfModel> implements IWfModelService {

	private final WfModelHistoryMapper wfModelHistoryMapper;
	private final IWfSerialService wfSerialService;
	private final IWfFormService wfFormService;
	private final IWfModelScopeService wfModelScopeService;

	private final RepositoryService repositoryService;

	@Override
	public WfModelVO detail(WfModel model) {
		WfModelVO vo = WfModelWrapper.build().entityVO(this.getOne(Condition.getQueryWrapper(model)));
		if (vo.getFormKey().startsWith(WfProcessConstant.EX_FORM_PREFIX)) { // 外置表单
			StartEvent event = WfModelUtil.getStartEvent(vo.getXml());
			vo.setExForm(event.getFormProperties());
			return vo;
		}
		return vo;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public WfModel saveModel(WfModel model) {
		WfModel newWfModel = new WfModel();

		newWfModel.setVersion(1);
		newWfModel.setName(model.getName());
		newWfModel.setModelKey(model.getModelKey());
		newWfModel.setFormKey(model.getFormKey());
		newWfModel.setModelType(WfModel.MODEL_TYPE_BPMN);
		newWfModel.setCreated(Calendar.getInstance().getTime());
		newWfModel.setCreatedBy(WfTaskUtil.getTaskUser());
		newWfModel.setDescription(model.getDescription());
		newWfModel.setLastUpdated(Calendar.getInstance().getTime());
		newWfModel.setLastUpdatedBy(WfTaskUtil.getTaskUser());
		newWfModel.setTenantId(WfTaskUtil.getTenantId());
		newWfModel.setXml(model.getXml());

		if (StringUtil.isNotBlank(model.getXml())) {
			newWfModel.setModelEditorJson(WfModelUtil.getBpmnJsonString(model.getXml()));
		}
		this.save(newWfModel);
		return newWfModel;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public WfModel updateModel(WfModelVO model) {
		WfModel newModel = new WfModel();

		Boolean newVersion = model.getNewVersion();
		if (newVersion != null && newVersion) {
			WfModel oldModel = this.getById(model.getId());
			if (oldModel != null) {
				WfModelHistory modelHistory = BeanUtil.copy(oldModel, WfModelHistory.class);
				assert modelHistory != null;
				modelHistory.setId(null);
				modelHistory.setModelId(oldModel.getId());
				wfModelHistoryMapper.insert(modelHistory);

				QueryWrapper<WfModelHistory> wrapper = new QueryWrapper<>();
				wrapper.select("max(version) version")
					.eq("model_id", oldModel.getId());
				WfModelHistory maxVersion = wfModelHistoryMapper.selectOne(wrapper);
				if (maxVersion != null) {
					newModel.setVersion(maxVersion.getVersion() + 1);
				} else {
					newModel.setVersion(oldModel.getVersion() + 1);
				}
			}
		}
		newModel.setId(model.getId());
		newModel.setName(model.getName());
		newModel.setModelKey(model.getModelKey());
		newModel.setFormKey(model.getFormKey());
		newModel.setDescription(model.getDescription());
		newModel.setLastUpdated(Calendar.getInstance().getTime());
		newModel.setLastUpdatedBy(WfTaskUtil.getTaskUser());
		newModel.setXml(model.getXml());
		newModel.setTenantId(WfTaskUtil.getTenantId());

		if (StringUtil.isNotBlank(model.getXml())) {
			newModel.setModelEditorJson(WfModelUtil.getBpmnJsonString(model.getXml()));
		}
		this.updateById(newModel);

		return newModel;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Deployment deploy(WfModelVO modelVo) {
		String category = modelVo.getCategory();
		WfModel model = this.getById(modelVo.getId());

		BpmnModel bpmnModel = WfModelUtil.getBpmnModel(model.getXml());
		bpmnModel.setTargetNamespace(category);

		Deployment deployment = repositoryService.createDeployment()
			.name(model.getName())
			.key(model.getModelKey())
			.addBpmnModel(model.getName() + model.getVersion() + WfProcessConstant.SUFFIX, bpmnModel)
			.category(category)
			.tenantId(WfTaskUtil.getTenantId())
			.deploy();

		// 保存部署表单
		if (model.getFormKey().startsWith(WfProcessConstant.INDEP_FORM_PREFIX)) {
			wfFormService.saveIndepDeploymentForm(bpmnModel.getMainProcess().getFlowElements(), deployment.getId(), WfTaskUtil.getTenantId());
		} else {
			wfFormService.saveDeploymentForm(model.getFormKey(), deployment.getId(), WfTaskUtil.getTenantId());
		}
		// 保存流水号
		wfSerialService.create(bpmnModel, deployment.getId());
		// 设置流程权限
		wfModelScopeService.saveDeploymentScope(model.getId(), deployment.getId());

		return deployment;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void remove(WfModelVO model) {
		String id = model.getId();
		Boolean rollback = model.getRollback();
		if (rollback) { // 是否回退到最后版本
			QueryWrapper<WfModelHistory> wrapper = new QueryWrapper<>();
			wrapper.select("max(version) version")
				.eq("model_id", id);
			WfModelHistory modelHistory = wfModelHistoryMapper.selectOne(wrapper);
			if (modelHistory == null) { // 无历史版本
				this.removeById(id);
				wfModelScopeService.deleteByModelId(id);
			} else {
				modelHistory = wfModelHistoryMapper.selectOne(new QueryWrapper<WfModelHistory>().eq("version", modelHistory.getVersion()).eq("model_id", id));
				WfModel newModel = BeanUtil.copy(modelHistory, WfModel.class);
				assert newModel != null;
				newModel.setId(id);
				this.updateById(newModel);
				wfModelHistoryMapper.deleteById(modelHistory.getId());
			}
		} else {
			this.removeById(id);
			wfModelHistoryMapper.removeByModelId(id);
			wfModelScopeService.deleteByModelId(id);
		}
	}

	@Override
	public void changeCategory(String ids, Long categoryId) {
		String[] arr = ids.split(",");
		for (String id : arr) {
			WfModel model = new WfModel();
			model.setId(id);
			model.setCategoryId(categoryId);
			this.updateById(model);
		}
	}

}
