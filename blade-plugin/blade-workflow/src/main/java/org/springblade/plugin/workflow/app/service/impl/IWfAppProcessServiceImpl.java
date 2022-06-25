package org.springblade.plugin.workflow.app.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.AllArgsConstructor;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.ExtensionAttribute;
import org.flowable.engine.HistoryService;
import org.flowable.engine.ProcessEngineConfiguration;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.history.HistoricProcessInstance;
import org.flowable.engine.repository.ProcessDefinition;
import org.springblade.core.mp.support.Query;
import org.springblade.core.tool.utils.BeanUtil;
import org.springblade.core.tool.utils.StringUtil;
import org.springblade.plugin.workflow.app.entity.WfAppProcess;
import org.springblade.plugin.workflow.app.service.IWfAppProcessService;
import org.springblade.plugin.workflow.app.vo.WfAppProcessVo;
import org.springblade.plugin.workflow.core.cache.WfCategoryCache;
import org.springblade.plugin.workflow.core.constant.WfExtendConstant;
import org.springblade.plugin.workflow.core.constant.WfProcessConstant;
import org.springblade.plugin.workflow.core.query.WfProcessDefinitionQuery;
import org.springblade.plugin.workflow.core.utils.WfModelUtil;
import org.springblade.plugin.workflow.core.utils.WfTaskUtil;
import org.springblade.plugin.workflow.design.entity.WfCategory;
import org.springblade.plugin.workflow.design.vo.WfCategoryVO;
import org.springblade.plugin.workflow.process.model.WfProcess;
import org.springblade.plugin.workflow.process.service.IWfProcessService;
import org.springblade.system.user.cache.UserCache;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * App流程 服务实现类
 *
 * @author ssc
 */
@Service
@AllArgsConstructor
public class IWfAppProcessServiceImpl implements IWfAppProcessService {

	private final RepositoryService repositoryService;
	private final HistoryService historyService;
	private final ProcessEngineConfiguration processEngineConfiguration;

	private final IWfProcessService processService;

	@Override
	public List<WfAppProcessVo> list(WfAppProcess process) {
		List<WfCategoryVO> tree = WfCategoryCache.tree();

		WfProcessDefinitionQuery processDefinitionQuery = new WfProcessDefinitionQuery(processEngineConfiguration.getCommandExecutor())
			.latestVersion()
			.processDefinitionTenantId(WfTaskUtil.getTenantId())
			.active()
			.startableByUserOrGroups(WfTaskUtil.getTaskUser(), Arrays.asList(WfTaskUtil.getCandidateGroup().split(",")));

		if (StringUtil.isNotBlank(process.getProcessDefinitionName())) {
			processDefinitionQuery.processDefinitionNameLike("%" + process.getProcessDefinitionName() + "%");
		}
		if (StringUtil.isNotBlank(process.getPlatform())) {
			processDefinitionQuery.platform(process.getPlatform());
		}
		List<ProcessDefinition> processDefinitionList = processDefinitionQuery.list();

		List<WfAppProcessVo> list = new ArrayList<>();
		tree.forEach(category -> {
			WfAppProcessVo processVo = new WfAppProcessVo();
			List<String> ids = new ArrayList<>();
			this.getChildrenIds(ids, category);

			if (ids.size() > 0) {
				List<ProcessDefinition> processDefinitions = processDefinitionList.stream().filter(p -> ids.contains(p.getCategory())).collect(Collectors.toList());
				if (processDefinitions.size() > 0) {
					processVo.setCategory(category.getName());

					List<WfAppProcess> processList = new ArrayList<>();
					processDefinitions.forEach(processDefinition -> {
						WfAppProcess child = new WfAppProcess();
						child.setId(processDefinition.getId());
						child.setProcessDefinitionName(processDefinition.getName());
						child.setProcessDefinitionKey(processDefinition.getKey());

						try {
							BpmnModel bpmnModel = repositoryService.getBpmnModel(processDefinition.getId());
							Map<String, List<ExtensionAttribute>> exFormKey = WfModelUtil.getStartEventExtensionElementAttributes(bpmnModel, WfExtendConstant.EX_FORM_KEY);
							if (exFormKey != null) {
								String value = exFormKey.get("value").get(0).getValue();
								if (StringUtil.isNotBlank(value)) {
									child.setFormKey(WfProcessConstant.EX_FORM_PREFIX + value);
								}
							}

							Map<String, List<ExtensionAttribute>> exFormUrl = WfModelUtil.getStartEventExtensionElementAttributes(bpmnModel, WfExtendConstant.EX_FORM_URL);
							if (exFormUrl != null) {
								String value = exFormUrl.get("value").get(0).getValue();
								if (StringUtil.isNotBlank(value)) {
									child.setFormUrl(value);
								}
							}
						} catch (Exception ignore) {
						}
						processList.add(child);
					});
					if (processList.size() > 0) {
						processVo.setProcessList(processList);
						list.add(processVo);
					}
				}
			}
		});
		return list;
	}

	@Override
	public IPage<WfAppProcess> taskList(WfAppProcess process, Query query) {
		return buildAppProcess(processService.selectTaskPage(process, query));
	}

	@Override
	public IPage<WfAppProcess> processList(WfAppProcess process, Query query) {
		return buildAppProcess(processService.selectProcessPage(process, query));
	}

	private IPage<WfAppProcess> buildAppProcess(IPage<WfProcess> wfProcessIPage) {
		IPage<WfAppProcess> page = new Page<>();

		List<WfAppProcess> list = new ArrayList<>();
		wfProcessIPage.getRecords().forEach(wfProcess -> {
			WfAppProcess process = BeanUtil.copy(wfProcess, WfAppProcess.class);
			assert process != null;
			if (StringUtil.isNotBlank(process.getCategory())) {
				WfCategory category = WfCategoryCache.getById(Long.valueOf(process.getCategory()));
				if (category != null) {
					process.setCategoryName(category.getName());
				}
			}
			HistoricProcessInstance processInstance = historyService.createHistoricProcessInstanceQuery().processInstanceId(process.getProcessInstanceId()).singleResult();
			if (processInstance != null) {
				process.setApplyUser(UserCache.getUser(Long.valueOf(processInstance.getStartUserId())));

				// Status
				if (StringUtil.isBlank(wfProcess.getProcessIsFinished())) {
					processService.setProcessStatus(process, processInstance);
				}
			}

			list.add(process);
		});
		page.setTotal(wfProcessIPage.getTotal());
		page.setRecords(list);
		return page;
	}

	private List<String> getChildrenIds(List<String> result, WfCategoryVO category) {
		result.add(category.getId() + "");
		if (category.getChildren() != null && category.getChildren().size() > 0) {
			category.getChildren().forEach(c -> result.addAll(this.getChildrenIds(result, c)));
		}
		return result;
	}

}
