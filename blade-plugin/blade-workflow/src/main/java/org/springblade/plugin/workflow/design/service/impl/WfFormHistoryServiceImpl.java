package org.springblade.plugin.workflow.design.service.impl;

import lombok.AllArgsConstructor;
import org.springblade.core.tool.api.R;
import org.springblade.core.tool.utils.BeanUtil;
import org.springblade.plugin.workflow.design.entity.WfForm;
import org.springblade.plugin.workflow.design.entity.WfFormHistory;
import org.springblade.plugin.workflow.design.mapper.WfFormHistoryMapper;
import org.springblade.plugin.workflow.design.service.IWfFormHistoryService;
import org.springblade.core.mp.base.BaseServiceImpl;
import org.springblade.plugin.workflow.design.service.IWfFormService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 流程表单 服务实现类
 *
 * @author ssc
 */
@Service
@AllArgsConstructor
public class WfFormHistoryServiceImpl extends BaseServiceImpl<WfFormHistoryMapper, WfFormHistory> implements IWfFormHistoryService {

	private final IWfFormService wfFormService;

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Object setMainVersion(WfFormHistory formHistory) {
		Long id = formHistory.getId();
		formHistory = this.getById(id);
		if (formHistory == null) {
			return R.fail("查询不到此数据");
		}

		Long formId = formHistory.getFormId();

		WfForm form = wfFormService.getById(formId);
		if (form == null) {
			return R.fail("查询不到此数据");
		}

		WfForm newForm = BeanUtil.copy(formHistory, WfForm.class);
		assert newForm != null;
		newForm.setId(formId);
		wfFormService.updateById(newForm);

		WfFormHistory newVersion = BeanUtil.copy(form, WfFormHistory.class);
		assert newVersion != null;
		newVersion.setId(null);
		newVersion.setFormId(formId);
		this.save(newVersion);
		this.removeById(id);

		return R.success("操作成功");
	}
}
