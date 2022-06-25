package org.springblade.plugin.workflow.design.service;

import org.flowable.bpmn.model.BpmnModel;
import org.springblade.plugin.workflow.design.entity.WfSerial;
import org.springblade.core.mp.base.BaseService;

/**
 * 流程流水号 服务类
 *
 * @author ssc
 */
public interface IWfSerialService extends BaseService<WfSerial> {

	void create(BpmnModel model, String deploymentId);

	String getNextSN(String deploymentId);

	void resetSN(String type);

}
