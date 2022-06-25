package org.springblade.plugin.workflow.core.handler;

import lombok.RequiredArgsConstructor;
import org.flowable.engine.delegate.DelegateExecution;
import org.springblade.system.user.cache.UserCache;
import org.springblade.system.user.entity.User;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;

/**
 * 流转条件/人员配置调用函数示例
 *
 * @author ssc
 */
@Component("wfCustomUserHandler")
@RequiredArgsConstructor
public class WfCustomUserHandler {

	public List<User> userList(DelegateExecution execution, String... customParam) {
		return Arrays.asList(UserCache.getUser(1123598821738675201L), UserCache.getUser(1123598821738675202L));
	}

	public List<String> strList(DelegateExecution execution, String... customParam) {
		return Arrays.asList("1123598821738675201", "1123598821738675202");
	}

	public List<Long> longList(DelegateExecution execution, String... customParam) {
		return Arrays.asList(1123598821738675201L, 1123598821738675202L);
	}

	public String str(DelegateExecution execution, String... customParam) {
		return "1123598821738675201,1123598821738675202";
	}

	public Boolean condition(DelegateExecution execution, String... customParam) {
		String param = customParam[0];
		return "对".equals(param);
	}
}
