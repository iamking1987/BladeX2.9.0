package org.springblade.plugin.workflow.core.listener;

import org.flowable.engine.delegate.DelegateExecution;
import org.springframework.stereotype.Component;

@Component("WfExecutionListener")
public class WfExecutionListener implements org.flowable.engine.delegate.ExecutionListener {

	@Override
	public void notify(DelegateExecution execution) {
		String eventName = execution.getEventName();
		switch (eventName) {
			case EVENTNAME_START:
				System.err.println("执行创建");
				break;
			case EVENTNAME_TAKE:
				System.err.println("执行到达");
				break;
			case EVENTNAME_END:
				System.err.println("执行结束");
				break;
		}
	}
}
