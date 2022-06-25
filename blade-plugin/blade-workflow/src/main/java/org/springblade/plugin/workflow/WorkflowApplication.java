package org.springblade.plugin.workflow;

import org.springblade.core.cloud.feign.EnableBladeFeign;
import org.springblade.core.launch.BladeApplication;
import org.springframework.cloud.client.SpringCloudApplication;

@EnableBladeFeign
@SpringCloudApplication
public class WorkflowApplication {

	public static void main(String[] args) {
		BladeApplication.run("blade-workflow", WorkflowApplication.class, args);
	}
}
