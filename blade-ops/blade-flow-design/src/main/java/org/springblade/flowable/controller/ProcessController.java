package org.springblade.flowable.controller;

import lombok.AllArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.engine.runtime.ProcessInstance;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;

/**
 * 流程
 *
 * @author Chill
 */
@Controller
@RequestMapping("/process")
@AllArgsConstructor
public class ProcessController {

	private static final String IMAGE_NAME = "image";
	private static final String XML_NAME = "xml";
	private static final Integer INT_1024 = 1024;

	private RepositoryService repositoryService;
	private RuntimeService runtimeService;

	/**
	 * 资源展示
	 *
	 * @param processId    流程id
	 * @param instanceId   实例id
	 * @param resourceType 资源类型
	 * @param response     响应
	 */
	@GetMapping("resource")
	public void resource(@RequestParam String processId, String instanceId, @RequestParam(defaultValue = IMAGE_NAME) String resourceType, HttpServletResponse response) throws Exception {
		if (StringUtils.isAllBlank(processId, instanceId)) {
			return;
		}
		if (StringUtils.isBlank(processId)) {
			ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(instanceId).singleResult();
			processId = processInstance.getProcessDefinitionId();
		}
		ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().processDefinitionId(processId).singleResult();
		String resourceName = "";
		if (resourceType.equals(IMAGE_NAME)) {
			resourceName = processDefinition.getDiagramResourceName();
		} else if (resourceType.equals(XML_NAME)) {
			resourceName = processDefinition.getResourceName();
		}
		InputStream resourceAsStream =  repositoryService.getResourceAsStream(processDefinition.getDeploymentId(), resourceName);
		byte[] b = new byte[1024];
		int len;
		while ((len = resourceAsStream.read(b, 0, INT_1024)) != -1) {
			response.getOutputStream().write(b, 0, len);
		}
	}

}
