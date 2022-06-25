package org.springblade.modules.leave.feign;

import org.springblade.core.tool.api.R;
import org.springblade.modules.leave.entity.Leave;
import org.springframework.stereotype.Component;

import javax.validation.Valid;

@Component
public class LeaveClientFallback implements LeaveClient {
	@Override
	public R<Leave> detail(Long id) {

		Leave leave = new Leave();
		leave.setPhase("Hystrix");
		leave.setReason("Fallback Success");
		leave.setIsDeleted(0);
		return R.data(leave);
	}

	@Override
	public R save(@Valid Leave leave) {
		return R.fail("Fallback Success");
	}

	@Override
	public R update(@Valid Leave leave) {
		return R.fail("Fallback Success");
	}

	@Override
	public R saveOrUpdate(@Valid Leave leave) {
		return R.fail("Fallback Success");
	}
}
