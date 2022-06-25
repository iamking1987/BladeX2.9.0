package org.springblade.plugin.workflow.core.listener;

import org.flowable.task.service.delegate.DelegateTask;
import org.springframework.stereotype.Component;

@Component("wfTaskListener")
public class WfTaskListener implements org.flowable.engine.delegate.TaskListener {

	@Override
	public void notify(DelegateTask delegateTask) {
		System.err.println(delegateTask.getEventName());
		String eventName = delegateTask.getEventName();
		switch (eventName) {
			case EVENTNAME_CREATE:
				System.err.println("任务创建");
				break;
			case EVENTNAME_ASSIGNMENT:
				System.err.println("任务分配审核人");
				break;
			case EVENTNAME_COMPLETE:
				System.err.println("任务完成");
				break;
			case EVENTNAME_DELETE:
				System.err.println("任务删除");
				break;
		}
	}
}
