
package org.springblade.plugin.workflow.design.wrapper;

import org.springblade.core.mp.support.BaseEntityWrapper;
import org.springblade.core.tool.utils.BeanUtil;
import org.springblade.plugin.workflow.design.entity.WfCategory;
import org.springblade.plugin.workflow.design.vo.WfCategoryVO;

import java.util.Objects;

/**
 * 流程分类包装类,返回视图层所需的字段
 *
 * @author ssc
 */
public class WfCategoryWrapper extends BaseEntityWrapper<WfCategory, WfCategoryVO> {

	public static WfCategoryWrapper build() {
		return new WfCategoryWrapper();
	}

	@Override
	public WfCategoryVO entityVO(WfCategory wfCategory) {
		WfCategoryVO wfCategoryVO = Objects.requireNonNull(BeanUtil.copy(wfCategory, WfCategoryVO.class));

		//User createUser = UserCache.getUser(wfCategory.getCreateUser());
		//User updateUser = UserCache.getUser(wfCategory.getUpdateUser());
		//wfCategoryVO.setCreateUserName(createUser.getName());
		//wfCategoryVO.setUpdateUserName(updateUser.getName());

		return wfCategoryVO;
	}

}
