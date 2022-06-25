package org.springblade.plugin.workflow.design.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springblade.core.tool.api.R;
import org.springblade.core.tool.utils.BeanUtil;
import org.springblade.plugin.workflow.design.entity.WfModel;
import org.springblade.plugin.workflow.design.entity.WfModelHistory;
import org.springblade.plugin.workflow.design.mapper.WfModelHistoryMapper;
import org.springblade.plugin.workflow.design.service.IWfModelHistoryService;
import org.springblade.plugin.workflow.design.service.IWfModelService;
import org.springframework.stereotype.Service;

/**
 * 服务实现类
 */
@Service
@AllArgsConstructor
public class WfModelHistoryServiceImpl extends ServiceImpl<WfModelHistoryMapper, WfModelHistory> implements IWfModelHistoryService {

	private final IWfModelService wfModelService;

	@Override
	public Object setMainVersion(WfModelHistory modelHistory) {
		String id = modelHistory.getId();
		modelHistory = this.getById(id);
		if (modelHistory == null) {
			return R.fail("查询不到此数据");
		}

		String modelId = modelHistory.getModelId();
		WfModel model = wfModelService.getById(modelId);
		if (model == null) {
			return R.fail("查询不到此数据");
		}

		WfModel newModel = BeanUtil.copy(modelHistory, WfModel.class);
		assert newModel != null;
		newModel.setId(modelId);
		wfModelService.updateById(newModel);

		WfModelHistory newVersion = BeanUtil.copy(model, WfModelHistory.class);
		assert newVersion != null;
		newVersion.setId(null);
		newVersion.setModelId(modelId);
		this.save(newVersion);
		this.removeById(id);

		return R.success("操作成功");
	}
}
