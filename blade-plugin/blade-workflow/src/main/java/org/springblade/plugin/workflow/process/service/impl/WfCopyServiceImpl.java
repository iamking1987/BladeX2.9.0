package org.springblade.plugin.workflow.process.service.impl;

import lombok.AllArgsConstructor;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.engine.HistoryService;
import org.flowable.engine.RepositoryService;
import org.flowable.task.api.history.HistoricTaskInstance;
import org.springblade.core.tool.utils.StringUtil;
import org.springblade.plugin.workflow.core.constant.WfExtendConstant;
import org.springblade.plugin.workflow.core.constant.WfProcessConstant;
import org.springblade.plugin.workflow.core.utils.WfModelUtil;
import org.springblade.plugin.workflow.process.entity.WfCopy;
import org.springblade.plugin.workflow.process.entity.WfNotice;
import org.springblade.plugin.workflow.process.model.WfProcess;
import org.springblade.plugin.workflow.process.service.IWfNoticeService;
import org.springblade.plugin.workflow.process.vo.WfCopyVO;
import org.springblade.plugin.workflow.process.mapper.WfCopyMapper;
import org.springblade.plugin.workflow.process.service.IWfCopyService;
import org.springblade.core.mp.base.BaseServiceImpl;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.AsyncResult;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;

import java.util.concurrent.Future;

/**
 * 流程抄送 服务实现类
 *
 * @author ssc
 */
@Service
@AllArgsConstructor
public class WfCopyServiceImpl extends BaseServiceImpl<WfCopyMapper, WfCopy> implements IWfCopyService {

	private final IWfNoticeService wfNoticeService;
	private final RepositoryService repositoryService;
	private final HistoryService historyService;

	@Override
	public IPage<WfCopyVO> selectCopyPage(IPage<WfCopyVO> page, WfCopyVO wfCopy) {
		return page.setRecords(baseMapper.selectWfCopyPage(page, wfCopy));
	}

	@Async
	@Override
	public Future<String> resolveCopyUser(WfProcess process) {
		HistoricTaskInstance taskInstance = historyService.createHistoricTaskInstanceQuery()
			.taskId(process.getTaskId())
			.singleResult();
		BpmnModel bpmnModel = repositoryService.getBpmnModel(taskInstance.getProcessDefinitionId());
		String exFormKey = WfModelUtil.getUserTaskExtensionAttribute(taskInstance.getTaskDefinitionKey(), bpmnModel, WfExtendConstant.EX_FORM_KEY);
		String exFormUrl = WfModelUtil.getUserTaskExtensionAttribute(taskInstance.getTaskDefinitionKey(), bpmnModel, WfExtendConstant.EX_FORM_URL);

		String copyUser = process.getCopyUser();
		if (StringUtil.isNotBlank(copyUser)) {
			String[] ids = copyUser.split(",");
			for (String id : ids) {
				WfCopy copy = new WfCopy();
				copy.setTaskId(process.getTaskId());
				copy.setProcessId(process.getProcessInstanceId());
				copy.setUserId(Long.parseLong(id));
				copy.setTitle(process.getTaskName());
				copy.setInitiator(process.getAssigneeName());
				if (StringUtil.isNotBlank(exFormKey)) {
					copy.setFormKey(WfProcessConstant.EX_FORM_PREFIX + exFormKey);
				}
				copy.setFormUrl(exFormUrl);
				this.save(copy);

				wfNoticeService.resolveNoticeInfo(new WfNotice()
					.setFromUserId(process.getAssignee())
					.setToUserId(id)
					.setTaskId(process.getTaskId())
					.setProcessId(process.getProcessInstanceId())
					.setType(WfNotice.Type.COPY));
			}
		}
		return new AsyncResult<>("");
	}

}
