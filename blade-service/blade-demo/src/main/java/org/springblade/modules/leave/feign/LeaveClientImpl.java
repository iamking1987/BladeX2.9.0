package org.springblade.modules.leave.feign;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.AllArgsConstructor;
import org.springblade.core.tool.api.R;
import org.springblade.modules.leave.entity.Leave;
import org.springblade.modules.leave.service.ILeaveService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
@AllArgsConstructor   //总体注入作用
public class LeaveClientImpl implements LeaveClient {

	private ILeaveService leaveService;

	@Override
	@GetMapping(API_PREFIX+"/detail")
	public R<Leave> detail(Long id) {
		return R.data(leaveService.getById(id));
	}

	/**
	 * 新增 请假流程测试表
	 */
	@Override
	@PostMapping(API_PREFIX+"/save")
	public R save(@Valid @RequestBody Leave leave) {
		return R.status(leaveService.save(leave));
	}

	/**
	 * 修改 请假流程测试表
	 */
	@Override
	@PostMapping(API_PREFIX+"/update")
	public R update(@Valid @RequestBody Leave leave) {
		return R.status(leaveService.updateById(leave));
	}

	@Override
	@PostMapping(API_PREFIX+"/saveOrUpdate")
	public R saveOrUpdate(@Valid Leave leave) {
		LambdaQueryWrapper<Leave> queryWrapper = new QueryWrapper<Leave>().lambda().eq(Leave::getProcessInsId, leave.getProcessInsId());
		Leave one = leaveService.getOne(queryWrapper);
		boolean result;
		if (one!=null){
			leave.setId(one.getId());
			return update(leave);
		}else {
			return save(leave);
		}
	}
}
