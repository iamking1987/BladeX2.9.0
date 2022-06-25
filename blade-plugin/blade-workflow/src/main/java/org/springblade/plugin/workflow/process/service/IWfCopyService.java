package org.springblade.plugin.workflow.process.service;

import org.springblade.plugin.workflow.process.entity.WfCopy;
import org.springblade.plugin.workflow.process.model.WfProcess;
import org.springblade.plugin.workflow.process.vo.WfCopyVO;
import org.springblade.core.mp.base.BaseService;
import com.baomidou.mybatisplus.core.metadata.IPage;

import java.util.concurrent.Future;

/**
 * 流程抄送 服务类
 *
 * @author ssc
 */
public interface IWfCopyService extends BaseService<WfCopy> {

	IPage<WfCopyVO> selectCopyPage(IPage<WfCopyVO> page, WfCopyVO wfCopy);

	/**
	 * 处理抄送人
	 */
	Future<String> resolveCopyUser(WfProcess process);
}
