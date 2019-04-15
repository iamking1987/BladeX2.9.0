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
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.repository.Deployment;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.ui.modeler.domain.Model;
import org.flowable.ui.modeler.serviceapi.ModelService;
import org.springblade.core.log.exception.ServiceException;
import org.springblade.core.tool.utils.StringUtil;
import org.springblade.flowable.engine.constant.FlowableConstant;
import org.springblade.flowable.engine.entity.FlowModel;
import org.springblade.flowable.engine.mapper.FlowMapper;
import org.springblade.flowable.engine.service.FlowService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 工作流服务实现类
 *
 * @author Chill
 */
@Slf4j
@Service
@AllArgsConstructor
public class FlowServiceImpl extends ServiceImpl<FlowMapper, FlowModel> implements FlowService {

	private RepositoryService repositoryService;
	private ModelService modelService;

	@Override
	public IPage<FlowModel> selectFlowPage(IPage<FlowModel> page, FlowModel flowModel) {
		return page.setRecords(baseMapper.selectFlowPage(page, flowModel));
	}

	@Override
	public boolean deploy(String modelId, String category) {
		Model model = modelService.getModel(modelId);
		byte[] bytes = modelService.getBpmnXML(model);

		String processName = model.getName();
		if (!StringUtil.endsWithIgnoreCase(processName, FlowableConstant.suffix)) {
			processName += FlowableConstant.suffix;
		}

		Deployment deployment = repositoryService.createDeployment()
			.addBytes(processName, bytes)
			.name(model.getName())
			.key(model.getKey())
			.deploy();

		log.debug("流程部署--------deploy：" + deployment + "  分类---------->" + category);

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
}
