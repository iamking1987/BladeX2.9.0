package org.springblade.plugin.workflow.design.service;

import org.springblade.plugin.workflow.design.entity.WfFormHistory;
import org.springblade.core.mp.base.BaseService;

/**
 * 流程表单 服务类
 *
 * @author ssc
 */
public interface IWfFormHistoryService extends BaseService<WfFormHistory> {

	Object setMainVersion(WfFormHistory formHistory);
}
