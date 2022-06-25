
package org.springblade.plugin.workflow.process.wrapper;

import org.springblade.core.mp.support.BaseEntityWrapper;
import org.springblade.core.tool.utils.BeanUtil;
import org.springblade.plugin.workflow.process.entity.WfCopy;
import org.springblade.plugin.workflow.process.vo.WfCopyVO;
import java.util.Objects;

/**
 * 流程抄送包装类,返回视图层所需的字段
 *
 * @author ssc
 */
public class WfCopyWrapper extends BaseEntityWrapper<WfCopy, WfCopyVO>  {

	public static WfCopyWrapper build() {
		return new WfCopyWrapper();
 	}

	@Override
	public WfCopyVO entityVO(WfCopy wfCopy) {
		WfCopyVO wfCopyVO = Objects.requireNonNull(BeanUtil.copy(wfCopy, WfCopyVO.class));

		//User createUser = UserCache.getUser(wfCopy.getCreateUser());
		//User updateUser = UserCache.getUser(wfCopy.getUpdateUser());
		//wfCopyVO.setCreateUserName(createUser.getName());
		//wfCopyVO.setUpdateUserName(updateUser.getName());

		return wfCopyVO;
	}

}
