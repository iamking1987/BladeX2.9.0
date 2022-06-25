
package org.springblade.plugin.workflow.design.wrapper;

import org.springblade.core.mp.support.BaseEntityWrapper;
import org.springblade.core.tool.utils.BeanUtil;
import org.springblade.plugin.workflow.design.entity.WfSerial;
import org.springblade.plugin.workflow.design.vo.WfSerialVO;

import java.util.Objects;

/**
 * 流程流水号包装类,返回视图层所需的字段
 *
 * @author ssc
 */
public class WfSerialWrapper extends BaseEntityWrapper<WfSerial, WfSerialVO> {

	public static WfSerialWrapper build() {
		return new WfSerialWrapper();
	}

	@Override
	public WfSerialVO entityVO(WfSerial wfSerial) {
		WfSerialVO wfSerialVO = Objects.requireNonNull(BeanUtil.copy(wfSerial, WfSerialVO.class));

		//User createUser = UserCache.getUser(wfSerial.getCreateUser());
		//User updateUser = UserCache.getUser(wfSerial.getUpdateUser());
		//wfSerialVO.setCreateUserName(createUser.getName());
		//wfSerialVO.setUpdateUserName(updateUser.getName());

		return wfSerialVO;
	}

}
