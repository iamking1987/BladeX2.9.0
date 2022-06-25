package org.springblade.plugin.workflow.core.config;

import org.flowable.spring.SpringProcessEngineConfiguration;
import org.flowable.spring.boot.EngineConfigurationConfigurer;
import org.springblade.plugin.workflow.core.factory.WfActivityBehaviorFactory;
import org.springframework.context.annotation.Configuration;

/**
 * flowable配置
 *
 * @author ssc
 */
@Configuration
public class WfProcessEngineConfig implements EngineConfigurationConfigurer<SpringProcessEngineConfiguration> {

	@Override
	public void configure(SpringProcessEngineConfiguration springProcessEngineConfiguration) {
		springProcessEngineConfiguration.setActivityBehaviorFactory(new WfActivityBehaviorFactory());
	}
}
