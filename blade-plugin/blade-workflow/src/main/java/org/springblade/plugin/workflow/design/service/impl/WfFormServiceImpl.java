package org.springblade.plugin.workflow.design.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.AllArgsConstructor;
import org.flowable.bpmn.model.*;
import org.flowable.engine.FormService;
import org.flowable.engine.HistoryService;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.form.StartFormData;
import org.flowable.engine.form.TaskFormData;
import org.flowable.engine.history.HistoricProcessInstance;
import org.flowable.engine.impl.persistence.entity.ProcessDefinitionEntityImpl;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.task.api.history.HistoricTaskInstance;
import org.springblade.core.mp.base.BaseServiceImpl;
import org.springblade.core.tool.api.R;
import org.springblade.core.tool.utils.BeanUtil;
import org.springblade.core.tool.utils.StringUtil;
import org.springblade.plugin.workflow.core.constant.WfExtendConstant;
import org.springblade.plugin.workflow.core.constant.WfProcessConstant;
import org.springblade.plugin.workflow.core.utils.WfModelUtil;
import org.springblade.plugin.workflow.design.entity.*;
import org.springblade.plugin.workflow.design.mapper.WfDeploymentFormMapper;
import org.springblade.plugin.workflow.design.mapper.WfFormHistoryMapper;
import org.springblade.plugin.workflow.design.mapper.WfFormMapper;
import org.springblade.plugin.workflow.design.service.IWfFormService;
import org.springblade.plugin.workflow.design.vo.WfFormVO;
import org.springblade.plugin.workflow.process.model.WfNode;
import org.springblade.plugin.workflow.process.model.WfProcess;
import org.springblade.plugin.workflow.process.service.IWfProcessService;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.AsyncResult;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.Future;
import java.util.stream.Collectors;

/**
 * 服务实现类
 *
 * @since 2020-10-28
 */
@Service
@AllArgsConstructor
public class WfFormServiceImpl extends BaseServiceImpl<WfFormMapper, WfForm> implements IWfFormService {

	private final WfDeploymentFormMapper wfDeploymentFormMapper;
	private final WfFormHistoryMapper formHistoryMapper;
	private final RepositoryService repositoryService;
	private final FormService formService;
	private final HistoryService historyService;
	private final IWfProcessService processService;

	@Override
	public WfForm getOne(WfForm wfForm) {
		return baseMapper.selectOne(new QueryWrapper<>(wfForm));
	}

	@Override
	public IPage<WfForm> page(IPage<WfForm> page, WfForm wfForm) {
		return baseMapper.selectPage(page, new QueryWrapper<>(wfForm));
	}

	@Override
	public List<WfForm> list(WfForm wfForm) {
		return baseMapper.selectList(new QueryWrapper<>(wfForm));
	}

	@Override
	public Map<String, Object> getFormByProcessDefId(String processDefId) {
		Map<String, Object> result = new HashMap<>();
		String formStr = null;
		String appForm = null;

		// 流程定义
		ProcessDefinition processDefinition = repositoryService.getProcessDefinition(processDefId);
		WfProcessDef processDef = new WfProcessDef((ProcessDefinitionEntityImpl) processDefinition);

		// 扩展属性，隐藏抄送人、隐藏下一步审核人、默认抄送人等
		BpmnModel bpmnModel = repositoryService.getBpmnModel(processDefId);
		Map<String, List<ExtensionAttribute>> hideCopy = WfModelUtil.getStartEventExtensionElementAttributes(bpmnModel, WfExtendConstant.HIDE_COPY);
		if (hideCopy != null) {
			String value = hideCopy.get("value").get(0).getValue();
			if (StringUtil.isNotBlank(value) && "true".equals(value)) {
				processDef.setHideCopy(true);
			}
		}
		Map<String, List<ExtensionAttribute>> hideExamine = WfModelUtil.getStartEventExtensionElementAttributes(bpmnModel, WfExtendConstant.HIDE_EXAMINE);
		if (hideExamine != null) {
			String value = hideExamine.get("value").get(0).getValue();
			if (StringUtil.isNotBlank(value) && "true".equals(value)) {
				processDef.setHideExamine(true);
			}
		}
		List<ExtensionElement> copyUsers = WfModelUtil.getStartEventExtensionElements(bpmnModel, WfExtendConstant.COPY_USER);
		if (copyUsers != null && copyUsers.size() > 0) {
			List<String> values = new ArrayList<>();
			List<String> texts = new ArrayList<>();
			copyUsers.forEach(copyUser -> {
				String value = copyUser.getAttributes().get("value").get(0).getValue();
				String text = copyUser.getAttributes().get("text").get(0).getValue();
				if (StringUtil.isNoneBlank(value, text)) {
					values.add(value);
					texts.add(text);
				}
			});
			if (values.size() > 0 && texts.size() > 0) {
				processDef.setCopyUser(String.join(",", values));
				processDef.setCopyUserName(String.join(",", texts));
			}
		}

		WfDeploymentForm wfDeploymentForm = new WfDeploymentForm();
		wfDeploymentForm.setDeploymentId(processDefinition.getDeploymentId());

		Map<String, List<ExtensionAttribute>> indepFormKey = WfModelUtil.getStartEventExtensionElementAttributes(bpmnModel, WfExtendConstant.INDEP_FORM_KEY);
		if (indepFormKey != null) { // 节点独立表单
			String value = indepFormKey.get("value").get(0).getValue();
			if (StringUtil.isNotBlank(value)) {
				StartEvent startEvent = WfModelUtil.getStartEvent(bpmnModel);
				wfDeploymentForm.setTaskKey(startEvent.getId());
				wfDeploymentForm.setTaskName(startEvent.getName());
			}
		}
		wfDeploymentForm = wfDeploymentFormMapper.selectOne(new QueryWrapper<>(wfDeploymentForm));
		if (wfDeploymentForm != null) {
			formStr = wfDeploymentForm.getContent();
			appForm = wfDeploymentForm.getAppContent();
			processDef.setFormKey(wfDeploymentForm.getFormKey());
		}

		// 开始节点表单
		StartFormData startFormData = formService.getStartFormData(processDefId);
		result.put("startForm", startFormData.getFormProperties());
		result.put("process", processDef);
		result.put("form", formStr);
		result.put("appForm", appForm);
		return result;
	}

	@Async
	@Override
	public Future<Map<String, Object>> getFormByTaskId(String taskId) {
		Map<String, Object> result = new HashMap<>();

		HistoricTaskInstance task = historyService.createHistoricTaskInstanceQuery()
			.taskId(taskId)
			.singleResult();

		HistoricProcessInstance processInstance = historyService.createHistoricProcessInstanceQuery()
			.processInstanceId(task.getProcessInstanceId())
			.singleResult();

		BpmnModel model = repositoryService.getBpmnModel(processInstance.getProcessDefinitionId());

		WfDeploymentForm wfDeploymentForm = new WfDeploymentForm();
		wfDeploymentForm.setDeploymentId(processInstance.getDeploymentId());

		String indepFormSummary = WfModelUtil.getUserTaskExtensionAttribute(task.getTaskDefinitionKey(), model, WfExtendConstant.INDEP_FORM_SUMMARY);
		if ("1".equals(indepFormSummary)) { // 汇总表单
			WfProcess process = new WfProcess();
			process.setTaskId(taskId);
			process.setProcessInstanceId(task.getProcessInstanceId());
			List<WfNode> backNodes = processService.getBackNodes(process);
			List<String> taskKeys = backNodes.stream().map(WfNode::getNodeId).collect(Collectors.toList());
			LambdaQueryWrapper<WfDeploymentForm> wrapper = new LambdaQueryWrapper<>(wfDeploymentForm);
			wrapper.in(WfDeploymentForm::getTaskKey, taskKeys);
			List<WfDeploymentForm> deploymentForms = wfDeploymentFormMapper.selectList(wrapper);
			result.put("formList", deploymentForms);
		} else {
			String indepFormKey = WfModelUtil.getUserTaskExtensionAttribute(task.getTaskDefinitionKey(), model, WfExtendConstant.INDEP_FORM_KEY);
			if (indepFormKey != null) {
				wfDeploymentForm.setTaskKey(task.getTaskDefinitionKey());
				wfDeploymentForm.setFormKey(indepFormKey.replace(WfProcessConstant.INDEP_FORM_PREFIX, ""));
			}
			wfDeploymentForm = wfDeploymentFormMapper.selectOne(new QueryWrapper<>(wfDeploymentForm));
			if (wfDeploymentForm != null) {
				result.put("allForm", wfDeploymentForm.getContent());
				result.put("allAppForm", wfDeploymentForm.getAppContent());
			}
		}
		if (task.getEndTime() == null) {
			TaskFormData taskFormData = formService.getTaskFormData(taskId);
			result.put("taskForm", taskFormData.getFormProperties());
		}
		return new AsyncResult<>(result);
	}

	@Override
	public Object create(WfForm form) {
		try {
			form.setVersion(1);
			this.save(form);
		} catch (Exception e) {
			return R.fail(String.format("表单key：%s 已存在", form.getFormKey()));
		}
		return R.data(form);
	}

	@Override
	public WfForm edit(WfFormVO form) {
		Boolean newVersion = form.getNewVersion();
		if (newVersion != null && newVersion) {
			WfForm oldForm = this.getById(form.getId());
			WfFormHistory history = BeanUtil.copy(oldForm, WfFormHistory.class);
			assert history != null;

			history.setId(null);
			history.setFormId(oldForm.getId());
			formHistoryMapper.insert(history);

			QueryWrapper<WfFormHistory> wrapper = new QueryWrapper<>();
			wrapper.select("max(version) version")
				.eq("form_id", oldForm.getId());
			WfFormHistory maxVersion = formHistoryMapper.selectOne(wrapper);
			if (maxVersion != null) {
				form.setVersion(maxVersion.getVersion() + 1);
			} else {
				form.setVersion(oldForm.getVersion() + 1);
			}
		}
		this.updateById(form);
		return form;
	}

	@Override
	public void remove(WfFormVO form) {
		Long id = form.getId();
		Boolean rollback = form.getRollback();
		if (rollback) { // 是否回退到最后版本
			QueryWrapper<WfFormHistory> wrapper = new QueryWrapper<>();
			wrapper.select("max(version) version")
				.eq("form_id", id);
			WfFormHistory formHistory = formHistoryMapper.selectOne(wrapper);
			if (formHistory == null) { // 无历史版本
				this.removeById(id);
			} else {
				formHistory = formHistoryMapper.selectOne(new QueryWrapper<WfFormHistory>().eq("version", formHistory.getVersion()).eq("form_id", id));
				WfForm newModel = BeanUtil.copy(formHistory, WfForm.class);
				assert newModel != null;
				newModel.setId(id);
				this.updateById(newModel);
				formHistoryMapper.deleteById(formHistory.getId());
			}
		} else {
			this.removeById(id);
			formHistoryMapper.removeByFormId(id);
		}
	}

	@Async
	@Override
	public void saveDeploymentForm(String formKey, String deployId, String tenantId) {
		WfForm wfForm = new WfForm();
		wfForm.setFormKey(formKey);
		wfForm.setTenantId(tenantId);
		wfForm = this.getOne(new QueryWrapper<>(wfForm));

		WfDeploymentForm wfDeploymentForm = new WfDeploymentForm();
		wfDeploymentForm.setDeploymentId(deployId);
		wfDeploymentForm.setFormKey(formKey);
		if (wfForm != null) {
			wfDeploymentForm.setContent(wfForm.getContent());
			wfDeploymentForm.setAppContent(wfForm.getAppContent());
		}
		wfDeploymentFormMapper.insert(wfDeploymentForm);
	}

	@Override
	public void saveIndepDeploymentForm(Collection<FlowElement> elements, String deployId, String tenantId) {
		for (FlowElement element : elements) {
			String formKey = null;
			String taskKey = null;
			String taskName = null;
			if (element instanceof SubProcess) {
				elements = ((SubProcess) element).getFlowElements();
				this.saveIndepDeploymentForm(elements, deployId, tenantId);
				break;
			} else if (element instanceof StartEvent) {
				List<ExtensionElement> extensionElements = element.getExtensionElements().get(WfExtendConstant.INDEP_FORM_KEY);
				if (extensionElements != null && extensionElements.size() > 0) {
					Map<String, List<ExtensionAttribute>> attributes = extensionElements.get(0).getAttributes();
					formKey = attributes.get("value").get(0).getValue();
					taskKey = element.getId();
					taskName = element.getName();
				}
			} else {
				List<ExtensionAttribute> attributes = element.getAttributes().get(WfExtendConstant.INDEP_FORM_KEY);
				if (attributes != null && attributes.size() > 0) {
					formKey = attributes.get(0).getValue();
					taskKey = element.getId();
					taskName = element.getName();
				}
			}
			if (formKey != null) {
				WfForm wfForm = new WfForm();
				wfForm.setFormKey(formKey.replace(WfProcessConstant.INDEP_FORM_PREFIX, ""));
				wfForm.setTenantId(tenantId);
				wfForm = this.getOne(new QueryWrapper<>(wfForm));

				WfDeploymentForm wfDeploymentForm = new WfDeploymentForm();
				wfDeploymentForm.setDeploymentId(deployId);
				wfDeploymentForm.setFormKey(formKey);
				wfDeploymentForm.setTaskKey(taskKey);
				wfDeploymentForm.setTaskName(taskName);
				if (wfForm != null) {
					wfDeploymentForm.setContent(wfForm.getContent());
					wfDeploymentForm.setAppContent(wfForm.getAppContent());
				}
				wfDeploymentFormMapper.insert(wfDeploymentForm);
			}
		}
	}

	@Override
	public void changeCategory(String ids, Long categoryId) {
		String[] arr = ids.split(",");
		for (String id : arr) {
			WfForm form = new WfForm();
			form.setId(Long.valueOf(id));
			form.setCategoryId(categoryId);
			this.updateById(form);
		}
	}

}
