
package org.springblade.plugin.workflow.design.wrapper;

import org.springblade.core.mp.support.BaseEntityWrapper;
import org.springblade.core.tool.utils.BeanUtil;
import org.springblade.plugin.workflow.design.entity.WfModelScope;
import org.springblade.plugin.workflow.design.vo.WfModelScopeVO;

import java.util.Objects;

/**
 * 流程模型权限包装类,返回视图层所需的字段
 *
 * @author ssc
 */
public class WfModelScopeWrapper extends BaseEntityWrapper<WfModelScope, WfModelScopeVO> {

	public static WfModelScopeWrapper build() {
		return new WfModelScopeWrapper();
	}

	@Override
	public WfModelScopeVO entityVO(WfModelScope wfModelScope) {
		WfModelScopeVO wfModelScopeVO = Objects.requireNonNull(BeanUtil.copy(wfModelScope, WfModelScopeVO.class));

		//User createUser = UserCache.getUser(wfModelScope.getCreateUser());
		//User updateUser = UserCache.getUser(wfModelScope.getUpdateUser());
		//wfModelScopeVO.setCreateUserName(createUser.getName());
		//wfModelScopeVO.setUpdateUserName(updateUser.getName());

		return wfModelScopeVO;
	}

}
