package org.springblade.plugin.workflow.design.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.flowable.engine.repository.Deployment;
import org.springblade.plugin.workflow.design.entity.WfModel;
import org.springblade.plugin.workflow.design.entity.WfModelHistory;
import org.springblade.plugin.workflow.design.vo.WfModelVO;

/**
 * 服务类
 */
public interface IWfModelHistoryService extends IService<WfModelHistory> {

	Object setMainVersion(WfModelHistory modelHistory);
}
