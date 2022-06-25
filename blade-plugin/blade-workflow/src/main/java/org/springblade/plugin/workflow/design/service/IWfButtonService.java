
package org.springblade.plugin.workflow.design.service;

import org.springblade.plugin.workflow.design.entity.WfButton;
import org.springblade.plugin.workflow.design.vo.WfButtonVO;
import org.springblade.core.mp.base.BaseService;
import com.baomidou.mybatisplus.core.metadata.IPage;

import java.util.List;
import java.util.concurrent.Future;

/**
 * 流程按钮 服务类
 *
 * @author ssc
 */
public interface IWfButtonService extends BaseService<WfButton> {

	/**
	 * 自定义分页
	 *
	 * @param page
	 * @param wfButton
	 * @return
	 */
	IPage<WfButtonVO> selectWfButtonPage(IPage<WfButtonVO> page, WfButtonVO wfButton);

	Future<List<WfButton>> getButtonByTaskId(String taskId);

}
