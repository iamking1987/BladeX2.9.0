package org.springblade.plugin.workflow.core.factory;

import org.flowable.bpmn.model.UserTask;
import org.flowable.engine.impl.bpmn.behavior.UserTaskActivityBehavior;
import org.flowable.engine.impl.bpmn.parser.factory.DefaultActivityBehaviorFactory;
import org.springblade.plugin.workflow.core.handler.WfUserTaskActivityBehavior;

/**
 * 自定义的BehaviorFactory
 *
 * @author ssc
 */
public class WfActivityBehaviorFactory extends DefaultActivityBehaviorFactory {

	@Override
	public UserTaskActivityBehavior createUserTaskActivityBehavior(UserTask userTask) {
		return new WfUserTaskActivityBehavior(userTask);
	}
}
