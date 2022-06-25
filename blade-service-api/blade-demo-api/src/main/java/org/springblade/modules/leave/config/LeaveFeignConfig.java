package org.springblade.modules.leave.config;

import org.springblade.modules.leave.feign.LeaveClientFallback;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

//@Configuration
public class LeaveFeignConfig {

	@Bean
	public LeaveClientFallback leaveClientFallback(){
		return new LeaveClientFallback();
	}
}
