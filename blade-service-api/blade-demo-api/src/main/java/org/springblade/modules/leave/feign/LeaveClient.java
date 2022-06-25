package org.springblade.modules.leave.feign;

import org.springblade.common.constant.LauncherConstant;
import org.springblade.core.tool.api.R;
import org.springblade.modules.leave.entity.Leave;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;

@FeignClient(
	value = LauncherConstant.APPLICATION_DEMO_NAME
//	fallback = LeaveClientFallback.class
)
public interface LeaveClient {

	String API_PREFIX="/api/leave";

	@GetMapping(API_PREFIX+"/detail")
	R<Leave> detail(@RequestParam("id") Long id);

	/**
	 * 新增 请假流程测试表
	 */
	@PostMapping(API_PREFIX+"/save")
	public R save(@Valid @RequestBody Leave leave);

	/**
	 * 修改 请假流程测试表
	 */
	@PostMapping(API_PREFIX+"/update")
	public R update(@Valid @RequestBody Leave leave);

	@PostMapping(API_PREFIX+"/saveOrUpdate")
	public R saveOrUpdate(@Valid @RequestBody Leave leave);


}
