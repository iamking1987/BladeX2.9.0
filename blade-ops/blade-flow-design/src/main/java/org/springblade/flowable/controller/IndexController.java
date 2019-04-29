package org.springblade.flowable.controller;

import lombok.AllArgsConstructor;
import org.flowable.engine.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 登录
 *
 * @author Chill
 */
@Controller
@AllArgsConstructor
public class IndexController {

	private ProcessEngine processEngine;

	private IdentityService identityService;

	private TaskService taskService;

	private RuntimeService runtimeService;

	private RepositoryService repositoryService;

	private HistoryService historyService;

	private DynamicBpmnService dynamicBpmnService;

	private FormService formService;

	private ManagementService managementService;

	private ProcessEngineConfiguration processEngineConfiguration;

	@GetMapping("/login")
	public Object getService() {

		System.out.println("流程引擎类：" + processEngine);

		taskService = processEngine.getTaskService();
		runtimeService = processEngine.getRuntimeService();
		repositoryService = processEngine.getRepositoryService();
		historyService = processEngine.getHistoryService();
		dynamicBpmnService = processEngine.getDynamicBpmnService();
		formService = processEngine.getFormService();
		identityService = processEngine.getIdentityService();
		managementService = processEngine.getManagementService();
		processEngineConfiguration = processEngine.getProcessEngineConfiguration();

		String name = processEngine.getName();

		System.out.println("流程引擎的名称： " + name);
		System.out.println(processEngineConfiguration);
		return "success";
	}
}
