package org.springblade.plugin.workflow.ops.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import org.springblade.core.mp.support.Query;
import org.springblade.plugin.workflow.ops.model.WfOps;
import org.springblade.plugin.workflow.process.model.WfNode;

import java.util.List;

/**
 * 流程运维 服务
 *
 * @author ssc
 */
public interface IWfOpsService {

	IPage<WfOps> list(WfOps ops, Query query);

	IPage<WfOps> processList(WfOps ops, Query query);

	void completeTask(WfOps ops);

	void changeTaskAssignee(WfOps ops);

	void changeTaskStatus(WfOps ops);

	void transferTask(WfOps ops);

	void delegateTask(WfOps ops);

	void copyTask(WfOps ops);

	void urgeTask(WfOps ops);

	void terminateProcess(WfOps ops);

	List<WfNode> processNodes(WfOps ops);

	void rollbackTask(WfOps ops);

	void dispatchTask(WfOps ops);

	void addMultiInstance(WfOps ops);

	void deleteMultiInstance(WfOps ops);

}
