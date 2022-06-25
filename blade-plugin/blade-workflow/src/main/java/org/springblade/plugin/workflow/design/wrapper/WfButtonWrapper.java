
package org.springblade.plugin.workflow.design.wrapper;

import org.springblade.core.mp.support.BaseEntityWrapper;
import org.springblade.core.tool.utils.BeanUtil;
import org.springblade.plugin.workflow.design.entity.WfButton;
import org.springblade.plugin.workflow.design.vo.WfButtonVO;

import java.util.Objects;

/**
 * 流程按钮包装类,返回视图层所需的字段
 *
 * @author ssc
 */
public class WfButtonWrapper extends BaseEntityWrapper<WfButton, WfButtonVO> {

	public static WfButtonWrapper build() {
		return new WfButtonWrapper();
	}

	@Override
	public WfButtonVO entityVO(WfButton wfButton) {
		WfButtonVO wfButtonVO = Objects.requireNonNull(BeanUtil.copy(wfButton, WfButtonVO.class));

		//User createUser = UserCache.getUser(wfButton.getCreateUser());
		//User updateUser = UserCache.getUser(wfButton.getUpdateUser());
		//wfButtonVO.setCreateUserName(createUser.getName());
		//wfButtonVO.setUpdateUserName(updateUser.getName());

		return wfButtonVO;
	}

}
