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
package org.springblade.flowable.engine.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springblade.flowable.engine.entity.FlowModel;
import org.springblade.flowable.engine.entity.FlowProcess;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.List;

/**
 * FlowService
 *
 * @author Chill
 */
public interface FlowService extends IService<FlowModel> {

	/**
	 * 自定义分页
	 *
	 * @param page      分页工具
	 * @param flowModel 流程模型
	 * @return
	 */
	IPage<FlowModel> selectFlowPage(IPage<FlowModel> page, FlowModel flowModel);

	/**
	 * 流程管理列表
	 *
	 * @param page     分页工具
	 * @param category 分类
	 * @return
	 */
	IPage<FlowProcess> selectManagerPage(IPage<FlowProcess> page, String category);

	/**
	 * 变更流程状态
	 *
	 * @param state     状态
	 * @param processId 流程ID
	 * @return
	 */
	String changeState(String state, String processId);

	/**
	 * 删除部署流程
	 *
	 * @param deploymentIds 部署流程id集合
	 * @return
	 */
	boolean deleteDeployment(String deploymentIds);

	/**
	 * 资源展示
	 *
	 * @param processId    流程ID
	 * @param instanceId   流程实例ID
	 * @param resourceType 资源类型(xml|image)
	 * @return
	 */
	InputStream resource(String processId, String instanceId, String resourceType);

	/**
	 * 上传部署流程
	 *
	 * @param files    流程配置文件
	 * @param category 流程分类
	 * @return
	 */
	boolean deployUpload(List<MultipartFile> files, String category);

	/**
	 * 部署流程
	 *
	 * @param modelId  模型id
	 * @param category 分类
	 * @return
	 */
	boolean deployModel(String modelId, String category);
}
