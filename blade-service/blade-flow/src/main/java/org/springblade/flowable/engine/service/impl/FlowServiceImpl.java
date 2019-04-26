/*
 *      Copyright (c) 2018-2028, Chill Zhuang All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions are met:
 *
 *  Redistributions of source code must retain the above copyright notice,
 *  this list of conditions and the following disclaimer.
 *  Redistributions in binary form must reproduce the above copyright
 *  notice, this list of conditions and the following disclaimer in the
 *  documentation and/or other materials provided with the distribution.
 *  Neither the name of the dreamlu.net developer nor the names of its
 *  contributors may be used to endorse or promote products derived from
 *  this software without specific prior written permission.
 *  Author: Chill 庄骞 (smallchill@163.com)
 */
package org.springblade.flowable.engine.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.flowable.bpmn.converter.BpmnXMLConverter;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.Process;
import org.flowable.editor.language.json.converter.BpmnJsonConverter;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.impl.persistence.entity.ProcessDefinitionEntityImpl;
import org.flowable.engine.repository.Deployment;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.engine.repository.ProcessDefinitionQuery;
import org.flowable.engine.runtime.ProcessInstance;
import org.springblade.core.log.exception.ServiceException;
import org.springblade.core.tool.utils.Func;
import org.springblade.core.tool.utils.StringPool;
import org.springblade.core.tool.utils.StringUtil;
import org.springblade.flowable.engine.constant.FlowableConstant;
import org.springblade.flowable.engine.entity.FlowModel;
import org.springblade.flowable.engine.entity.FlowProcess;
import org.springblade.flowable.engine.mapper.FlowMapper;
import org.springblade.flowable.engine.service.FlowService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 工作流服务实现类
 *
 * @author Chill
 */
@Slf4j
@Service
@AllArgsConstructor
public class FlowServiceImpl extends ServiceImpl<FlowMapper, FlowModel> implements FlowService {
	private static final String IMAGE_NAME = "image";
	private static final String XML_NAME = "xml";
	private static BpmnJsonConverter bpmnJsonConverter = new BpmnJsonConverter();
	private static BpmnXMLConverter bpmnXMLConverter = new BpmnXMLConverter();
	private ObjectMapper objectMapper;
	private RepositoryService repositoryService;
	private RuntimeService runtimeService;

	@Override
	public IPage<FlowModel> selectFlowPage(IPage<FlowModel> page, FlowModel flowModel) {
		return page.setRecords(baseMapper.selectFlowPage(page, flowModel));
	}

	@Override
	public IPage<FlowProcess> selectProcessPage(IPage<FlowProcess> page, String category) {
		ProcessDefinitionQuery processDefinitionQuery = repositoryService.createProcessDefinitionQuery().latestVersion().orderByProcessDefinitionKey().asc();
		if (StringUtils.isNotEmpty(category)) {
			processDefinitionQuery.processDefinitionCategory(category);
		}
		List<ProcessDefinition> processDefinitionList = processDefinitionQuery.listPage(Func.toInt(page.getCurrent() - 1), Func.toInt(page.getSize()));
		List<FlowProcess> flowProcessList = new ArrayList<>();
		for (ProcessDefinition processDefinition : processDefinitionList) {
			String deploymentId = processDefinition.getDeploymentId();
			Deployment deployment = repositoryService.createDeploymentQuery().deploymentId(deploymentId).singleResult();
			FlowProcess flowProcess = new FlowProcess((ProcessDefinitionEntityImpl) processDefinition);
			flowProcess.setDeploymentTime(deployment.getDeploymentTime());
			flowProcessList.add(flowProcess);
		}
		page.setTotal(processDefinitionQuery.count());
		page.setRecords(flowProcessList);
		return page;
	}

	@Override
	public String changeState(String state, String processId) {
		if (state.equals(FlowableConstant.ACTIVE)) {
			repositoryService.activateProcessDefinitionById(processId, true, null);
			return StringUtil.format("激活ID为 [{}] 的流程成功", processId);
		} else if (state.equals(FlowableConstant.SUSPEND)) {
			repositoryService.suspendProcessDefinitionById(processId, true, null);
			return StringUtil.format("挂起ID为 [{}] 的流程成功", processId);
		} else {
			return "暂无流程变更";
		}
	}

	@Override
	public boolean deleteDeployment(String deploymentIds) {
		Func.toStrList(deploymentIds).forEach(deploymentId -> repositoryService.deleteDeployment(deploymentId, true));
		return true;
	}

	@Override
	public InputStream resource(String processId, String instanceId, String resourceType) {
		if (StringUtils.isBlank(processId)) {
			ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(instanceId).singleResult();
			processId = processInstance.getProcessDefinitionId();
		}
		ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().processDefinitionId(processId).singleResult();
		String resourceName = StringPool.EMPTY;
		if (resourceType.equals(IMAGE_NAME)) {
			resourceName = processDefinition.getDiagramResourceName();
		} else if (resourceType.equals(XML_NAME)) {
			resourceName = processDefinition.getResourceName();
		}
		return repositoryService.getResourceAsStream(processDefinition.getDeploymentId(), resourceName);
	}

	@Override
	public boolean deployUpload(List<MultipartFile> files, String category) {
		files.forEach(file -> {
			try {
				String fileName = file.getOriginalFilename();
				InputStream fileInputStream = file.getInputStream();
				Deployment deployment = repositoryService.createDeployment().addInputStream(fileName, fileInputStream).deploy();
				deploy(deployment, category);
			} catch (IOException e) {
				e.printStackTrace();
			}
		});
		return true;
	}

	@Override
	public boolean deployModel(String modelId, String category) {
		FlowModel model = this.getById(modelId);
		if (model == null) {
			throw new ServiceException("No model found with the given id: " + modelId);
		}
		byte[] bytes = getBpmnXML(model);
		String processName = model.getName();
		if (!StringUtil.endsWithIgnoreCase(processName, FlowableConstant.SUFFIX)) {
			processName += FlowableConstant.SUFFIX;
		}
		Deployment deployment = repositoryService.createDeployment().addBytes(processName, bytes).name(model.getName()).key(model.getModelKey()).deploy();
		return deploy(deployment, category);
	}

	private boolean deploy(Deployment deployment, String category) {
		log.debug("流程部署--------deploy:  " + deployment + "  分类---------->" + category);
		List<ProcessDefinition> list = repositoryService.createProcessDefinitionQuery().deploymentId(deployment.getId()).list();
		StringBuilder logBuilder = new StringBuilder(500);
		List<Object> logArgs = new ArrayList<>();
		// 设置流程分类
		for (ProcessDefinition processDefinition : list) {
			if (StringUtil.isNotBlank(category)) {
				repositoryService.setProcessDefinitionCategory(processDefinition.getId(), category);
			}
			logBuilder.append("部署成功,流程ID={} \n");
			logArgs.add(processDefinition.getId());
		}
		if (list.size() == 0) {
			throw new ServiceException("部署失败,未找到流程");
		} else {
			log.info(logBuilder.toString(), logArgs.toArray());
			return true;
		}
	}

	private byte[] getBpmnXML(FlowModel model) {
		BpmnModel bpmnModel = getBpmnModel(model);
		return getBpmnXML(bpmnModel);
	}

	private byte[] getBpmnXML(BpmnModel bpmnModel) {
		for (Process process : bpmnModel.getProcesses()) {
			if (StringUtils.isNotEmpty(process.getId())) {
				char firstCharacter = process.getId().charAt(0);
				if (Character.isDigit(firstCharacter)) {
					process.setId("a" + process.getId());
				}
			}
		}
		return bpmnXMLConverter.convertToXML(bpmnModel);
	}

	private BpmnModel getBpmnModel(FlowModel model) {
		BpmnModel bpmnModel;
		try {
			Map<String, FlowModel> formMap = new HashMap<>(16);
			Map<String, FlowModel> decisionTableMap = new HashMap<>(16);

			List<FlowModel> referencedModels = baseMapper.findByParentModelId(model.getId());
			for (FlowModel childModel : referencedModels) {
				if (FlowModel.MODEL_TYPE_FORM == childModel.getModelType()) {
					formMap.put(childModel.getId(), childModel);

				} else if (FlowModel.MODEL_TYPE_DECISION_TABLE == childModel.getModelType()) {
					decisionTableMap.put(childModel.getId(), childModel);
				}
			}
			bpmnModel = getBpmnModel(model, formMap, decisionTableMap);
		} catch (Exception e) {
			log.error("Could not generate BPMN 2.0 model for {}", model.getId(), e);
			throw new ServiceException("Could not generate BPMN 2.0 model");
		}
		return bpmnModel;
	}

	private BpmnModel getBpmnModel(FlowModel model, Map<String, FlowModel> formMap, Map<String, FlowModel> decisionTableMap) {
		try {
			ObjectNode editorJsonNode = (ObjectNode) objectMapper.readTree(model.getModelEditorJson());
			Map<String, String> formKeyMap = new HashMap<>(16);
			for (FlowModel formModel : formMap.values()) {
				formKeyMap.put(formModel.getId(), formModel.getModelKey());
			}
			Map<String, String> decisionTableKeyMap = new HashMap<>(16);
			for (FlowModel decisionTableModel : decisionTableMap.values()) {
				decisionTableKeyMap.put(decisionTableModel.getId(), decisionTableModel.getModelKey());
			}
			return bpmnJsonConverter.convertToBpmnModel(editorJsonNode, formKeyMap, decisionTableKeyMap);
		} catch (Exception e) {
			log.error("Could not generate BPMN 2.0 model for {}", model.getId(), e);
			throw new ServiceException("Could not generate BPMN 2.0 model");
		}
	}

}
