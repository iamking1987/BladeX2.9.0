package org.springblade.flowable.business.handler;


import org.flowable.engine.delegate.TaskListener;
import org.flowable.task.service.delegate.DelegateTask;

/**
 * 老板处理器
 *
 * @author Chill
 */
public class BossTaskHandler implements TaskListener {

	@Override
	public void notify(DelegateTask delegateTask) {
		delegateTask.setAssignee("老板");
	}

}
