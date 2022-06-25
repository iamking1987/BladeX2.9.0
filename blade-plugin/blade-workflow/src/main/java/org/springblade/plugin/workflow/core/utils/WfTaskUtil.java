
package org.springblade.plugin.workflow.core.utils;

import org.springblade.core.secure.BladeUser;
import org.springblade.core.secure.utils.AuthUtil;
import org.springblade.core.tool.utils.Func;
import org.springblade.core.tool.utils.StringUtil;

import java.util.*;

/**
 * 工作流任务工具类
 *
 * @author Chill
 */
public class WfTaskUtil {

	/**
	 * 获取任务用户格式
	 *
	 * @return taskUser
	 */
	public static String getTaskUser() {
		return AuthUtil.getUserId() + "";
	}


	/**
	 * 获取用户主键
	 *
	 * @param taskUser 任务用户
	 * @return userId
	 */
	public static Long getUserId(String taskUser) {
		return Func.toLong(taskUser);
	}

	/**
	 * 获取用户组格式
	 *
	 * @return candidateGroup
	 */
	public static String getCandidateGroup() {
		// 候选组支持角色、部门、岗位
		BladeUser user = AuthUtil.getUser();
		if (user == null) return "";
		String roleId = user.getRoleId();
		String deptId = user.getDeptId();
		String postId = user.getPostId();
		List<String> list = new ArrayList<>();
		if (StringUtil.isNotBlank(roleId)) list.addAll(Arrays.asList(roleId.split(",")));
		if (StringUtil.isNotBlank(deptId)) list.addAll(Arrays.asList(deptId.split(",")));
		if (StringUtil.isNotBlank(postId)) list.addAll(Arrays.asList(postId.split(",")));
		return StringUtil.join(list, ",");
	}

	/**
	 * 获取用户昵称
	 *
	 * @return nickName
	 */
	public static String getNickName() {
		return AuthUtil.getNickName();
	}

	/**
	 * 获取租户id
	 *
	 * @return tenantId
	 */
	public static String getTenantId() {
		return AuthUtil.getTenantId();
	}

}
