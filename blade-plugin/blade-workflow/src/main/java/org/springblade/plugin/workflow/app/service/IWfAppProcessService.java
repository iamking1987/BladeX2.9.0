package org.springblade.plugin.workflow.app.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import org.springblade.core.mp.support.Query;
import org.springblade.plugin.workflow.app.entity.WfAppProcess;
import org.springblade.plugin.workflow.app.vo.WfAppProcessVo;

import java.util.List;

/**
 * App流程 服务类
 *
 * @author ssc
 */
public interface IWfAppProcessService {

	/**
	 * 可发起流程列表
	 */
	List<WfAppProcessVo> list(WfAppProcess process);

	/**
	 * 待办/待签/我的已办列表
	 */
	IPage<WfAppProcess> taskList(WfAppProcess process, Query query);

	/**
	 * 我的请求/办结列表
	 */
	IPage<WfAppProcess> processList(WfAppProcess process, Query query);

}
