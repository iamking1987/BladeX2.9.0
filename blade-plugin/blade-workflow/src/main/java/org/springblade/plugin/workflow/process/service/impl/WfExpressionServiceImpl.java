package org.springblade.plugin.workflow.process.service.impl;

import lombok.RequiredArgsConstructor;
import org.flowable.common.engine.api.delegate.Expression;
import org.flowable.engine.ManagementService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.impl.cfg.ProcessEngineConfigurationImpl;
import org.flowable.engine.impl.persistence.entity.ExecutionEntity;
import org.springblade.plugin.workflow.process.service.IWfExpressionService;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class WfExpressionServiceImpl implements IWfExpressionService {

	private final ProcessEngineConfigurationImpl processEngineConfiguration;
	private final ManagementService managementService;
	private final RuntimeService runtimeService;

	@Override
	public Object getValue(String processInstanceId, String exp) {
		Expression expression = processEngineConfiguration.getExpressionManager().createExpression(exp);
		return managementService.executeCommand((commandContext) ->
			expression.getValue((ExecutionEntity) runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult()));
	}

}
