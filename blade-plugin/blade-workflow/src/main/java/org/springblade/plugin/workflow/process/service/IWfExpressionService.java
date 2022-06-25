package org.springblade.plugin.workflow.process.service;

public interface IWfExpressionService {

	/**
	 * 获取表达式值
	 *
	 * @param processInstanceId 流程实例id
	 * @param exp               表达式
	 */
	Object getValue(String processInstanceId, String exp);

}
