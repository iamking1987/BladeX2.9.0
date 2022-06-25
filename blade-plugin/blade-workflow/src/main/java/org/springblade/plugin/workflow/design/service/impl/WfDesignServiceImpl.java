package org.springblade.plugin.workflow.design.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.ExtensionAttribute;
import org.flowable.common.engine.impl.db.SuspensionState;
import org.flowable.engine.ProcessEngineConfiguration;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.impl.persistence.entity.ProcessDefinitionEntityImpl;
import org.flowable.engine.repository.Deployment;
import org.flowable.engine.repository.ProcessDefinition;
import org.springblade.core.mp.support.Query;
import org.springblade.core.tool.utils.Func;
import org.springblade.core.tool.utils.ObjectUtil;
import org.springblade.core.tool.utils.StringUtil;
import org.springblade.plugin.workflow.core.constant.WfExtendConstant;
import org.springblade.plugin.workflow.core.constant.WfProcessConstant;
import org.springblade.plugin.workflow.core.query.WfProcessDefinitionQuery;
import org.springblade.plugin.workflow.core.utils.WfModelUtil;
import org.springblade.plugin.workflow.core.utils.WfTaskUtil;
import org.springblade.plugin.workflow.design.mapper.WfDeploymentFormMapper;
import org.springblade.plugin.workflow.design.mapper.WfModelMapper;
import org.springblade.plugin.workflow.design.entity.*;
import org.springblade.plugin.workflow.design.entity.WfProcessDef;
import org.springblade.plugin.workflow.design.mapper.WfSerialMapper;
import org.springblade.plugin.workflow.design.service.IWfDesignService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * 服务实现类
 */
@Service
@AllArgsConstructor
public class WfDesignServiceImpl extends ServiceImpl<WfModelMapper, WfModel> implements IWfDesignService {

	private final WfDeploymentFormMapper wfDeploymentFormMapper;
	private final WfSerialMapper wfSerialMapper;
	private final RepositoryService repositoryService;
	private final ProcessEngineConfiguration processEngineConfiguration;

	@Override
	public IPage<WfProcessDef> deploymentPage(WfProcessDef process, Query query) {
		IPage<WfProcessDef> page = new Page<>();

		WfProcessDefinitionQuery processDefinitionQuery = new WfProcessDefinitionQuery(processEngineConfiguration.getCommandExecutor())
			.latestVersion()
			.orderByProcessDefinitionKey()
			.processDefinitionTenantId(WfTaskUtil.getTenantId())
			.asc();

		if (ObjectUtil.isNotEmpty(process.getStatus()) && process.getStatus() == 1) {
			processDefinitionQuery.active();
		}
		if (StringUtils.isNotEmpty(process.getCategory())) {
			processDefinitionQuery.processDefinitionCategory(process.getCategory());
		}
		if (StringUtil.isNotBlank(process.getName())) {
			processDefinitionQuery.processDefinitionNameLike("%" + process.getName() + "%");
		}
		if (StringUtil.isNotBlank(process.getKey())) {
			processDefinitionQuery.processDefinitionKeyLike("%" + process.getKey() + "%");
		}
		if (ObjectUtil.isNotEmpty(process.getScope()) && process.getScope()) {
			processDefinitionQuery.startableByUserOrGroups(WfTaskUtil.getTaskUser(), Arrays.asList(WfTaskUtil.getCandidateGroup().split(",")));
		}
		if (StringUtil.isNotBlank(process.getPlatform())) {
			processDefinitionQuery.platform(process.getPlatform());
		}

		long count = processDefinitionQuery.count();
		if (count > 0) {
			List<ProcessDefinition> processDefinitionList;
			if (query != null) {
				processDefinitionList = processDefinitionQuery.listPage(Func.toInt((query.getCurrent() - 1) * query.getSize()), Func.toInt(query.getSize()));
			} else {
				processDefinitionList = processDefinitionQuery.list();
			}
			List<WfProcessDef> list = new ArrayList<>();

			processDefinitionList.forEach(processDefinition -> {
				Deployment d = repositoryService.createDeploymentQuery().deploymentId(processDefinition.getDeploymentId()).singleResult();
				WfProcessDef processDef = new WfProcessDef();
				processDef.setId(processDefinition.getId());
				processDef.setName(processDefinition.getName());
				processDef.setKey(processDefinition.getKey());
				processDef.setVersion(processDefinition.getVersion());
				processDef.setStatus(((ProcessDefinitionEntityImpl) processDefinition).getSuspensionState());
				processDef.setCategory(d.getCategory());
				processDef.setDeployTime(d.getDeploymentTime());
				processDef.setDeploymentId(d.getId());

				try {
					BpmnModel bpmnModel = repositoryService.getBpmnModel(processDefinition.getId());
					Map<String, List<ExtensionAttribute>> exFormKey = WfModelUtil.getStartEventExtensionElementAttributes(bpmnModel, WfExtendConstant.EX_FORM_KEY);
					if (exFormKey != null) {
						String value = exFormKey.get("value").get(0).getValue();
						if (StringUtil.isNotBlank(value)) {
							processDef.setFormKey(WfProcessConstant.EX_FORM_PREFIX + value);
						}
					}

					Map<String, List<ExtensionAttribute>> exFormUrl = WfModelUtil.getStartEventExtensionElementAttributes(bpmnModel, WfExtendConstant.EX_FORM_URL);
					if (exFormUrl != null) {
						String value = exFormUrl.get("value").get(0).getValue();
						if (StringUtil.isNotBlank(value)) {
							processDef.setFormUrl(value);
						}
					}

					Map<String, List<ExtensionAttribute>> exAppFormUrl = WfModelUtil.getStartEventExtensionElementAttributes(bpmnModel, WfExtendConstant.EX_APP_FORM_URL);
					if (exAppFormUrl != null) {
						String value = exAppFormUrl.get("value").get(0).getValue();
						if (StringUtil.isNotBlank(value)) {
							processDef.setAppFormUrl(value);
						}
					}
				} catch (Exception ignore) {
				}

				list.add(processDef);
			});
			page.setRecords(list);
		}
		page.setTotal(count);
		return page;
	}

	@Override
	public void changeDeploymentStatus(String id, String status) {
		if (status.equals(SuspensionState.SUSPENDED.toString())) {
			repositoryService.suspendProcessDefinitionById(id, true, null);
		} else if (status.equals(SuspensionState.ACTIVE.toString())) {
			repositoryService.activateProcessDefinitionById(id, true, null);
		}
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void changeDeploymentCategory(String deploymentId, String category) {
		String[] arr = deploymentId.split(",");
		for (String id : arr) {
			repositoryService.setDeploymentCategory(id, category);
			this.baseMapper.changeProcDefCategory(id, category);
		}
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void deleteDeployment(String deploymentId) {
		repositoryService.deleteDeployment(deploymentId, true);

		WfDeploymentForm form = new WfDeploymentForm();
		form.setDeploymentId(deploymentId);
		wfDeploymentFormMapper.delete(new QueryWrapper<>(form));

		WfSerial serial = new WfSerial();
		serial.setDeploymentId(deploymentId);
		wfSerialMapper.delete(new QueryWrapper<>(serial));
	}

}
