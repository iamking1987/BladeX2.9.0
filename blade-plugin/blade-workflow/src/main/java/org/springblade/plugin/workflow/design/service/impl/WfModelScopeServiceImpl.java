package org.springblade.plugin.workflow.design.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.repository.ProcessDefinition;
import org.springblade.core.tool.utils.StringUtil;
import org.springblade.plugin.workflow.design.entity.WfModelScope;
import org.springblade.plugin.workflow.design.mapper.WfModelScopeMapper;
import org.springblade.plugin.workflow.design.service.IWfModelScopeService;
import org.springblade.plugin.workflow.design.vo.WfModelScopeVO;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 流程模型权限 服务实现类
 *
 * @author ssc
 */
@Service
@AllArgsConstructor
public class WfModelScopeServiceImpl extends ServiceImpl<WfModelScopeMapper, WfModelScope> implements IWfModelScopeService {

	private final RepositoryService repositoryService;

	@Async
	@Override
	public void submit(WfModelScopeVO wfModelScope) {
		String modelId = wfModelScope.getModelId();
		String modelKey = wfModelScope.getModelKey();

		this.deleteByModelId(modelId);

		List<WfModelScope> scopeList = wfModelScope.getScopeList();
		scopeList.forEach(scope -> {
			scope.setModelId(modelId);
			scope.setModelKey(modelKey);
		});
		this.saveBatch(scopeList);

		List<ProcessDefinition> definitionList = repositoryService
			.createProcessDefinitionQuery()
			.processDefinitionKey(modelKey)
			.list();
		if (definitionList.size() > 0) {
			definitionList.forEach(definition -> {
				this.baseMapper.deleteIdentityLinkByDefId(definition.getId());

				scopeList.forEach(scope -> {
					String val = scope.getVal();
					if (StringUtil.isNotBlank(val)) {
						for (String id : val.split(",")) {
							if ("user".equals(scope.getType())) {
								repositoryService.addCandidateStarterUser(definition.getId(), id);
							} else {
								repositoryService.addCandidateStarterGroup(definition.getId(), id);
							}
						}
					}
				});
			});
		}
	}

	@Async
	@Override
	public void saveDeploymentScope(String modelId, String deploymentId) {
		List<WfModelScope> scopeList = this.list(new LambdaQueryWrapper<WfModelScope>().eq(WfModelScope::getModelId, modelId));

		ProcessDefinition definition = repositoryService.createProcessDefinitionQuery()
			.deploymentId(deploymentId)
			.singleResult();

		// 未知情况下ProcessDefinition可能是null，休眠0.5秒后再查询
		if (definition == null) {
			try {
				Thread.sleep(500);
			} catch (InterruptedException ignore) {
			}
			definition = repositoryService.createProcessDefinitionQuery()
				.deploymentId(deploymentId)
				.singleResult();
		}

		for (WfModelScope scope : scopeList) {
			String val = scope.getVal();
			if (StringUtil.isNotBlank(val)) {
				for (String id : val.split(",")) {
					if ("user".equals(scope.getType())) {
						repositoryService.addCandidateStarterUser(definition.getId(), id);
					} else {
						repositoryService.addCandidateStarterGroup(definition.getId(), id);
					}
				}
			}
		}
	}

	@Override
	public void deleteByModelId(String modelId) {
		this.remove(new LambdaQueryWrapper<WfModelScope>()
			.eq(WfModelScope::getModelId, modelId));
	}
}
