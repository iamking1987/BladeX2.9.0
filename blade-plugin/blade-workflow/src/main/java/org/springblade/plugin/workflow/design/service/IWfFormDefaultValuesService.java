package org.springblade.plugin.workflow.design.service;

import org.springblade.plugin.workflow.design.entity.WfFormDefaultValues;
import org.springblade.core.mp.base.BaseService;

/**
 * 流程表单字段默认值 服务类
 *
 * @author ssc
 */
public interface IWfFormDefaultValuesService extends BaseService<WfFormDefaultValues> {

	Object listType();
}
