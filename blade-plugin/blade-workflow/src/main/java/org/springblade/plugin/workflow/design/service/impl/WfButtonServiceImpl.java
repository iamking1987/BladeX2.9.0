package org.springblade.plugin.workflow.design.service.impl;

import lombok.AllArgsConstructor;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.ExtensionAttribute;
import org.flowable.bpmn.model.ExtensionElement;
import org.flowable.engine.HistoryService;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.task.api.history.HistoricTaskInstance;
import org.springblade.plugin.workflow.core.cache.WfProcessCache;
import org.springblade.plugin.workflow.core.constant.WfExtendConstant;
import org.springblade.plugin.workflow.core.utils.WfModelUtil;
import org.springblade.plugin.workflow.design.entity.WfButton;
import org.springblade.plugin.workflow.design.vo.WfButtonVO;
import org.springblade.plugin.workflow.design.mapper.WfButtonMapper;
import org.springblade.plugin.workflow.design.service.IWfButtonService;
import org.springblade.core.mp.base.BaseServiceImpl;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.AsyncResult;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Future;

/**
 * 流程按钮 服务实现类
 *
 * @author ssc
 */
@Service
@AllArgsConstructor
public class WfButtonServiceImpl extends BaseServiceImpl<WfButtonMapper, WfButton> implements IWfButtonService {

	private final HistoryService historyService;
	private final RepositoryService repositoryService;

	@Override
	public IPage<WfButtonVO> selectWfButtonPage(IPage<WfButtonVO> page, WfButtonVO wfButton) {
		return page.setRecords(baseMapper.selectWfButtonPage(page, wfButton));
	}

	@Async
	@Override
	public Future<List<WfButton>> getButtonByTaskId(String taskId) {
		HistoricTaskInstance task = historyService.createHistoricTaskInstanceQuery()
			.taskId(taskId)
			.singleResult();

		if (task == null) {
			return new AsyncResult<>(new ArrayList<>());
		}

		ProcessDefinition processDefinition = WfProcessCache.getProcessDefinition(task.getProcessDefinitionId());
		BpmnModel bpmnModel = repositoryService.getBpmnModel(processDefinition.getId());
		List<ExtensionElement> elementList = WfModelUtil.getUserTaskExtensionElements(task.getTaskDefinitionKey(), bpmnModel, WfExtendConstant.BUTTON);
		if (elementList == null || elementList.size() == 0) {
			return new AsyncResult<>(new ArrayList<>());
		}

		List<WfButton> buttonList = new ArrayList<>();
		elementList.forEach(ele -> {
			WfButton button = new WfButton();
			Map<String, List<ExtensionAttribute>> attributes = ele.getAttributes();
			boolean display = Boolean.parseBoolean(attributes.get("display").get(0).getValue());

			if (display) {
				button.setName(attributes.get("label").get(0).getValue());
				button.setButtonKey(attributes.get("prop").get(0).getValue());
				buttonList.add(button);
			}
		});

		return new AsyncResult<>(buttonList);
	}

}
