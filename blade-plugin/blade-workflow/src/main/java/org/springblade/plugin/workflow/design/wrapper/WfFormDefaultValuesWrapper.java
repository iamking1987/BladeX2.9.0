
package org.springblade.plugin.workflow.design.wrapper;

import org.springblade.core.mp.support.BaseEntityWrapper;
import org.springblade.core.tool.utils.BeanUtil;
import org.springblade.plugin.workflow.design.entity.WfFormDefaultValues;
import org.springblade.plugin.workflow.design.vo.WfFormDefaultValuesVO;

import java.util.Objects;

/**
 * 流程表单字段默认值包装类,返回视图层所需的字段
 *
 * @author ssc
 */
public class WfFormDefaultValuesWrapper extends BaseEntityWrapper<WfFormDefaultValues, WfFormDefaultValuesVO> {

	public static WfFormDefaultValuesWrapper build() {
		return new WfFormDefaultValuesWrapper();
	}

	@Override
	public WfFormDefaultValuesVO entityVO(WfFormDefaultValues wfFormDefaultValues) {
		WfFormDefaultValuesVO wfFormDefaultValuesVO = Objects.requireNonNull(BeanUtil.copy(wfFormDefaultValues, WfFormDefaultValuesVO.class));

		//User createUser = UserCache.getUser(wfFormDefaultValues.getCreateUser());
		//User updateUser = UserCache.getUser(wfFormDefaultValues.getUpdateUser());
		//wfFormDefaultValuesVO.setCreateUserName(createUser.getName());
		//wfFormDefaultValuesVO.setUpdateUserName(updateUser.getName());

		return wfFormDefaultValuesVO;
	}

}
