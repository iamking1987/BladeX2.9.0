
package org.springblade.plugin.workflow.design.wrapper;

import org.springblade.core.mp.support.BaseEntityWrapper;
import org.springblade.core.tool.utils.BeanUtil;
import org.springblade.plugin.workflow.design.entity.WfFormHistory;
import org.springblade.plugin.workflow.design.vo.WfFormHistoryVO;

import java.util.Objects;

/**
 * 流程表单包装类,返回视图层所需的字段
 *
 * @author ssc
 */
public class WfFormHistoryWrapper extends BaseEntityWrapper<WfFormHistory, WfFormHistoryVO> {

	public static WfFormHistoryWrapper build() {
		return new WfFormHistoryWrapper();
	}

	@Override
	public WfFormHistoryVO entityVO(WfFormHistory wfFormHistory) {
		WfFormHistoryVO wfFormHistoryVO = Objects.requireNonNull(BeanUtil.copy(wfFormHistory, WfFormHistoryVO.class));

		//User createUser = UserCache.getUser(wfFormHistory.getCreateUser());
		//User updateUser = UserCache.getUser(wfFormHistory.getUpdateUser());
		//wfFormHistoryVO.setCreateUserName(createUser.getName());
		//wfFormHistoryVO.setUpdateUserName(updateUser.getName());

		return wfFormHistoryVO;
	}

}
