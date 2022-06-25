package org.springblade.plugin.workflow.design.wrapper;

import org.springblade.core.mp.support.BaseEntityWrapper;
import org.springblade.core.tool.utils.BeanUtil;
import org.springblade.plugin.workflow.design.entity.WfModel;
import org.springblade.plugin.workflow.design.vo.WfModelVO;

import java.util.Objects;

/**
 * 流程模型包装类,返回视图层所需的字段
 *
 * @author ssc
 */
public class WfModelWrapper extends BaseEntityWrapper<WfModel, WfModelVO> {

	public static WfModelWrapper build() {
		return new WfModelWrapper();
	}

	@Override
	public WfModelVO entityVO(WfModel model) {
		WfModelVO wfModelVO = Objects.requireNonNull(BeanUtil.copy(model, WfModelVO.class));

		//User createUser = UserCache.getUser(wfButton.getCreateUser());
		//User updateUser = UserCache.getUser(wfButton.getUpdateUser());
		//wfButtonVO.setCreateUserName(createUser.getName());
		//wfButtonVO.setUpdateUserName(updateUser.getName());

		return wfModelVO;
	}

}
