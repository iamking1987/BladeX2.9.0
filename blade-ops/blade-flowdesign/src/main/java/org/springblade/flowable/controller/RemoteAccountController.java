package org.springblade.flowable.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 登录用户模拟返回
 *
 * @author Chill
 */
@RestController
@RequestMapping("/app")
public class RemoteAccountController {
	@RequestMapping(value = "/rest/account")
	public String getAccount() {
		return "{\"id\":\"admin\",\"firstName\":\"Test\",\"lastName\":\"Administrator\",\"email\":\"admin@flowable.org\",\"fullName\":\"Test Administrator\",\"groups\":[],\"privileges\":[\"access-idm\",\"access-task\",\"access-modeler\",\"access-admin\"]}\n";
	}
}
