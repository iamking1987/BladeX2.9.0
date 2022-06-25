
package org.springblade.plugin.workflow.design.wrapper;

import org.springblade.core.mp.support.BaseEntityWrapper;
import org.springblade.core.tool.utils.BeanUtil;
import org.springblade.plugin.workflow.design.entity.WfCondition;
import org.springblade.plugin.workflow.design.vo.WfConditionVO;

import java.util.Objects;

/**
 * 流程表达式包装类,返回视图层所需的字段
 *
 * @author ssc
 */
public class WfConditionWrapper extends BaseEntityWrapper<WfCondition, WfConditionVO> {

	public static WfConditionWrapper build() {
		return new WfConditionWrapper();
	}

	@Override
	public WfConditionVO entityVO(WfCondition wfCondition) {
		WfConditionVO wfConditionVO = Objects.requireNonNull(BeanUtil.copy(wfCondition, WfConditionVO.class));

		//User createUser = UserCache.getUser(wfCondition.getCreateUser());
		//User updateUser = UserCache.getUser(wfCondition.getUpdateUser());
		//wfConditionVO.setCreateUserName(createUser.getName());
		//wfConditionVO.setUpdateUserName(updateUser.getName());

		return wfConditionVO;
	}

}
