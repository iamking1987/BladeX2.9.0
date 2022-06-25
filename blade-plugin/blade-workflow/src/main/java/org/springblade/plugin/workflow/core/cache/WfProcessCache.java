package org.springblade.plugin.workflow.core.cache;

import org.flowable.engine.RepositoryService;
import org.flowable.engine.repository.ProcessDefinition;
import org.springblade.core.cache.utils.CacheUtil;
import org.springblade.core.tool.utils.SpringUtil;

import static org.springblade.plugin.workflow.core.cache.WfCacheConstant.WORKFLOW_CACHE;

/**
 * 流程缓存
 *
 * @author ssc
 */
public class WfProcessCache {

	private static final String WORKFLOW_DEFINITION_ID = "processDef:id";
	private static RepositoryService repositoryService;

	private static RepositoryService getRepositoryService() {
		if (repositoryService == null) {
			repositoryService = SpringUtil.getBean(RepositoryService.class);
		}
		return repositoryService;
	}

	/**
	 * 获得流程定义对象
	 *
	 * @param processDefinitionId 流程对象id
	 */
	public static ProcessDefinition getProcessDefinition(String processDefinitionId) {
		return CacheUtil.get(WORKFLOW_CACHE, WORKFLOW_DEFINITION_ID, processDefinitionId, () -> getRepositoryService().createProcessDefinitionQuery().processDefinitionId(processDefinitionId).singleResult());
	}

}
