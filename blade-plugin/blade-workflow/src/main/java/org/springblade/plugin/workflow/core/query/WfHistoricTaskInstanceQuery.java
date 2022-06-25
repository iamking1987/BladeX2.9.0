package org.springblade.plugin.workflow.core.query;

import org.flowable.common.engine.api.FlowableException;
import org.flowable.common.engine.api.FlowableIllegalArgumentException;
import org.flowable.common.engine.api.scope.ScopeTypes;
import org.flowable.common.engine.impl.interceptor.CommandContext;
import org.flowable.common.engine.impl.interceptor.CommandExecutor;
import org.flowable.common.engine.impl.persistence.cache.EntityCache;
import org.flowable.engine.impl.util.CommandContextUtil;
import org.flowable.idm.api.Group;
import org.flowable.idm.api.IdmIdentityService;
import org.flowable.task.api.history.HistoricTaskInstance;
import org.flowable.task.service.TaskServiceConfiguration;
import org.flowable.task.service.impl.HistoricTaskInstanceQueryProperty;
import org.flowable.task.service.impl.persistence.entity.HistoricTaskInstanceEntity;
import org.flowable.variable.service.VariableServiceConfiguration;
import org.flowable.variable.service.impl.AbstractVariableQueryImpl;
import org.flowable.variable.service.impl.QueryVariableValue;
import org.flowable.variable.service.impl.persistence.entity.HistoricVariableInstanceEntity;

import java.util.*;

public class WfHistoricTaskInstanceQuery extends AbstractVariableQueryImpl<WfHistoricTaskInstanceQuery, HistoricTaskInstance> {

	private static final long serialVersionUID = 1L;

	protected TaskServiceConfiguration taskServiceConfiguration;
	protected VariableServiceConfiguration variableServiceConfiguration;

	protected String taskDefinitionId;
	protected String processDefinitionId;
	protected String processDefinitionKey;
	protected String processDefinitionKeyLike;
	protected String processDefinitionKeyLikeIgnoreCase;
	protected Collection<String> processDefinitionKeys;
	protected String processDefinitionName;
	protected String processDefinitionNameLike;
	protected Collection<String> processCategoryInList;
	protected Collection<String> processCategoryNotInList;
	protected String deploymentId;
	protected Collection<String> deploymentIds;
	protected String cmmnDeploymentId;
	protected Collection<String> cmmnDeploymentIds;
	protected String processInstanceId;
	protected Collection<String> processInstanceIds;
	protected String processInstanceBusinessKey;
	protected String processInstanceBusinessKeyLike;
	protected String processInstanceBusinessKeyLikeIgnoreCase;
	protected String executionId;
	protected String scopeId;
	protected String subScopeId;
	protected String scopeType;
	protected String scopeDefinitionId;
	protected String propagatedStageInstanceId;
	protected String processInstanceIdWithChildren;
	protected String caseInstanceIdWithChildren;
	protected String caseDefinitionKey;
	protected String caseDefinitionKeyLike;
	protected String caseDefinitionKeyLikeIgnoreCase;
	protected Collection<String> caseDefinitionKeys;
	protected String taskId;
	protected String taskName;
	protected String taskNameLike;
	protected String taskNameLikeIgnoreCase;
	protected Collection<String> taskNameList;
	protected Collection<String> taskNameListIgnoreCase;
	protected String taskParentTaskId;
	protected String taskDescription;
	protected String taskDescriptionLike;
	protected String taskDescriptionLikeIgnoreCase;
	protected String taskDeleteReason;
	protected String taskDeleteReasonLike;
	protected String taskOwner;
	protected String taskOwnerLike;
	protected String taskOwnerLikeIgnoreCase;
	protected String taskAssignee;
	protected String taskAssigneeLike;
	protected String taskAssigneeLikeIgnoreCase;
	protected Collection<String> taskAssigneeIds;
	protected String taskDefinitionKey;
	protected String taskDefinitionKeyLike;
	protected Collection<String> taskDefinitionKeys;
	protected String candidateUser;
	protected String candidateGroup;
	private Collection<String> candidateGroups;
	protected String involvedUser;
	protected Collection<String> involvedGroups;
	protected boolean ignoreAssigneeValue;
	protected Integer taskPriority;
	protected Integer taskMinPriority;
	protected Integer taskMaxPriority;
	protected boolean finished;
	protected boolean unfinished;
	protected boolean processFinished;
	protected boolean processUnfinished;
	protected Date dueDate;
	protected Date dueAfter;
	protected Date dueBefore;
	protected boolean withoutDueDate;
	protected Date creationDate;
	protected Date creationAfterDate;
	protected Date creationBeforeDate;
	protected Date completedDate;
	protected Date completedAfterDate;
	protected Date completedBeforeDate;
	protected String category;
	protected boolean withFormKey;
	protected String formKey;
	protected String tenantId;
	protected String tenantIdLike;
	protected boolean withoutTenantId;
	protected boolean withoutDeleteReason;
	protected String locale;
	protected boolean withLocalizationFallback;
	protected boolean includeTaskLocalVariables;
	protected boolean includeProcessVariables;
	protected Integer taskVariablesLimit;
	protected boolean includeIdentityLinks;
	protected List<WfHistoricTaskInstanceQuery> orQueryObjects = new ArrayList<>();
	protected WfHistoricTaskInstanceQuery currentOrQueryObject;

	protected boolean inOrStatement;

	protected boolean active;

	public WfHistoricTaskInstanceQuery() {
	}

	public WfHistoricTaskInstanceQuery(CommandExecutor commandExecutor, TaskServiceConfiguration taskServiceConfiguration,
                                       VariableServiceConfiguration variableServiceConfiguration) {

		super(commandExecutor, variableServiceConfiguration);
		this.taskServiceConfiguration = taskServiceConfiguration;
		this.variableServiceConfiguration = variableServiceConfiguration;
	}

	public WfHistoricTaskInstanceQuery(CommandExecutor commandExecutor, String databaseType,
                                       TaskServiceConfiguration taskServiceConfiguration, VariableServiceConfiguration variableServiceConfiguration) {

		super(commandExecutor, variableServiceConfiguration);
		this.databaseType = databaseType;
		this.taskServiceConfiguration = taskServiceConfiguration;
		this.variableServiceConfiguration = variableServiceConfiguration;
	}

	public long executeCount(CommandContext commandContext) {
		ensureVariablesInitialized();
		return (long) CommandContextUtil.getDbSqlSession(commandContext).selectOne("selectWfHistoricTaskInstanceCountByQueryCriteria", this);
	}

	@SuppressWarnings("unchecked")
	public List<HistoricTaskInstance> executeList(CommandContext commandContext) {
		ensureVariablesInitialized();
		List<HistoricTaskInstance> tasks = CommandContextUtil.getDbSqlSession(commandContext).selectList("selectWfHistoricTaskInstancesByQueryCriteria", this);

		if (tasks != null && taskServiceConfiguration.getInternalTaskLocalizationManager() != null && taskServiceConfiguration.isEnableLocalization()) {
			for (HistoricTaskInstance task : tasks) {
				taskServiceConfiguration.getInternalTaskLocalizationManager().localize(task, locale, withLocalizationFallback);
			}
		}

		return tasks;
	}

	public WfHistoricTaskInstanceQuery active() {
		this.active = true;
		return this;
	}

	protected void addCachedVariableForQueryById(CommandContext commandContext, List<HistoricTaskInstance> results, boolean local) {
		for (HistoricTaskInstance task : results) {
			if (Objects.equals(taskId, task.getId())) {

				EntityCache entityCache = commandContext.getSession(EntityCache.class);
				List<HistoricVariableInstanceEntity> cachedVariableEntities = entityCache.findInCache(HistoricVariableInstanceEntity.class);
				for (HistoricVariableInstanceEntity cachedVariableEntity : cachedVariableEntities) {

					if (local) {
						if (task.getId().equals(cachedVariableEntity.getTaskId())) {
							((HistoricTaskInstanceEntity) task).getQueryVariables().add(cachedVariableEntity);
						}
					} else {
						if (task.getProcessInstanceId().equals(cachedVariableEntity.getProcessInstanceId())) {
							((HistoricTaskInstanceEntity) task).getQueryVariables().add(cachedVariableEntity);
						}
					}
				}

			}
		}
	}

	public void enhanceCachedValue(HistoricTaskInstanceEntity task) {
		if (includeProcessVariables) {
			task.getQueryVariables().addAll(variableServiceConfiguration.getHistoricVariableInstanceEntityManager()
				.findHistoricalVariableInstancesByProcessInstanceId(task.getProcessInstanceId()));
		} else if (includeTaskLocalVariables) {
			task.getQueryVariables().addAll(variableServiceConfiguration.getHistoricVariableInstanceEntityManager()
				.findHistoricalVariableInstancesByTaskId(task.getId()));
		}
	}

	public WfHistoricTaskInstanceQuery processInstanceId(String processInstanceId) {
		if (inOrStatement) {
			this.currentOrQueryObject.processInstanceId = processInstanceId;
		} else {
			this.processInstanceId = processInstanceId;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery processInstanceIdIn(Collection<String> processInstanceIds) {
		if (processInstanceIds == null) {
			throw new FlowableIllegalArgumentException("Process instance id list is null");
		}
		if (processInstanceIds.isEmpty()) {
			throw new FlowableIllegalArgumentException("Process instance id list is empty");
		}
		for (String processInstanceId : processInstanceIds) {
			if (processInstanceId == null) {
				throw new FlowableIllegalArgumentException("None of the given process instance ids can be null");
			}
		}

		if (inOrStatement) {
			this.currentOrQueryObject.processInstanceIds = processInstanceIds;
		} else {
			this.processInstanceIds = processInstanceIds;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery processInstanceBusinessKey(String processInstanceBusinessKey) {
		if (inOrStatement) {
			this.currentOrQueryObject.processInstanceBusinessKey = processInstanceBusinessKey;
		} else {
			this.processInstanceBusinessKey = processInstanceBusinessKey;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery processInstanceBusinessKeyLike(String processInstanceBusinessKeyLike) {
		if (inOrStatement) {
			this.currentOrQueryObject.processInstanceBusinessKeyLike = processInstanceBusinessKeyLike;
		} else {
			this.processInstanceBusinessKeyLike = processInstanceBusinessKeyLike;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery processInstanceBusinessKeyLikeIgnoreCase(String processInstanceBusinessKeyLikeIgnoreCase) {
		if (inOrStatement) {
			this.currentOrQueryObject.processInstanceBusinessKeyLikeIgnoreCase = processInstanceBusinessKeyLikeIgnoreCase.toLowerCase();
		} else {
			this.processInstanceBusinessKeyLikeIgnoreCase = processInstanceBusinessKeyLikeIgnoreCase.toLowerCase();
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery executionId(String executionId) {
		if (inOrStatement) {
			this.currentOrQueryObject.executionId = executionId;
		} else {
			this.executionId = executionId;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery caseInstanceId(String caseInstanceId) {
		if (inOrStatement) {
			currentOrQueryObject.scopeId(caseInstanceId);
			currentOrQueryObject.scopeType(ScopeTypes.CMMN);
		} else {
			this.scopeId(caseInstanceId);
			this.scopeType(ScopeTypes.CMMN);
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery caseDefinitionId(String caseDefinitionId) {
		if (inOrStatement) {
			currentOrQueryObject.scopeDefinitionId(caseDefinitionId);
			currentOrQueryObject.scopeType(ScopeTypes.CMMN);
		} else {
			this.scopeDefinitionId(caseDefinitionId);
			this.scopeType(ScopeTypes.CMMN);
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery caseDefinitionKey(String caseDefinitionKey) {
		if (inOrStatement) {
			currentOrQueryObject.caseDefinitionKey = caseDefinitionKey;
		} else {
			this.caseDefinitionKey = caseDefinitionKey;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery caseDefinitionKeyLike(String caseDefinitionKeyLike) {
		if (inOrStatement) {
			currentOrQueryObject.caseDefinitionKeyLike = caseDefinitionKeyLike;
		} else {
			this.caseDefinitionKeyLike = caseDefinitionKeyLike;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery caseDefinitionKeyLikeIgnoreCase(String caseDefinitionKeyLikeIgnoreCase) {
		if (inOrStatement) {
			currentOrQueryObject.caseDefinitionKeyLikeIgnoreCase = caseDefinitionKeyLikeIgnoreCase;
		} else {
			this.caseDefinitionKeyLikeIgnoreCase = caseDefinitionKeyLikeIgnoreCase;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery caseDefinitionKeyIn(Collection<String> caseDefinitionKeys) {
		if (inOrStatement) {
			currentOrQueryObject.caseDefinitionKeys = caseDefinitionKeys;
		} else {
			this.caseDefinitionKeys = caseDefinitionKeys;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery processInstanceIdWithChildren(String processInstanceId) {
		if (inOrStatement) {
			currentOrQueryObject.processInstanceIdWithChildren(processInstanceId);
		} else {
			this.processInstanceIdWithChildren = processInstanceId;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery caseInstanceIdWithChildren(String caseInstanceId) {
		if (inOrStatement) {
			currentOrQueryObject.caseInstanceIdWithChildren(caseInstanceId);
		} else {
			this.caseInstanceIdWithChildren = caseInstanceId;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery planItemInstanceId(String planItemInstanceId) {
		if (inOrStatement) {
			currentOrQueryObject.subScopeId(planItemInstanceId);
			currentOrQueryObject.scopeType(ScopeTypes.CMMN);
		} else {
			this.subScopeId(planItemInstanceId);
			this.scopeType(ScopeTypes.CMMN);
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery scopeId(String scopeId) {
		if (inOrStatement) {
			currentOrQueryObject.scopeId = scopeId;
		} else {
			this.scopeId = scopeId;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery subScopeId(String subScopeId) {
		if (inOrStatement) {
			currentOrQueryObject.subScopeId = subScopeId;
		} else {
			this.subScopeId = subScopeId;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery scopeType(String scopeType) {
		if (inOrStatement) {
			currentOrQueryObject.scopeType = scopeType;
		} else {
			this.scopeType = scopeType;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery scopeDefinitionId(String scopeDefinitionId) {
		if (inOrStatement) {
			currentOrQueryObject.scopeDefinitionId = scopeDefinitionId;
		} else {
			this.scopeDefinitionId = scopeDefinitionId;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery propagatedStageInstanceId(String propagatedStageInstanceId) {
		if (inOrStatement) {
			currentOrQueryObject.propagatedStageInstanceId = propagatedStageInstanceId;
		} else {
			this.propagatedStageInstanceId = propagatedStageInstanceId;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskDefinitionId(String taskDefinitionId) {
		if (inOrStatement) {
			this.currentOrQueryObject.taskDefinitionId = taskDefinitionId;
		} else {
			this.taskDefinitionId = taskDefinitionId;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery processDefinitionId(String processDefinitionId) {
		if (inOrStatement) {
			this.currentOrQueryObject.processDefinitionId = processDefinitionId;
		} else {
			this.processDefinitionId = processDefinitionId;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery processDefinitionKey(String processDefinitionKey) {
		if (inOrStatement) {
			this.currentOrQueryObject.processDefinitionKey = processDefinitionKey;
		} else {
			this.processDefinitionKey = processDefinitionKey;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery processDefinitionKeyLike(String processDefinitionKeyLike) {
		if (inOrStatement) {
			this.currentOrQueryObject.processDefinitionKeyLike = processDefinitionKeyLike;
		} else {
			this.processDefinitionKeyLike = processDefinitionKeyLike;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery processDefinitionKeyLikeIgnoreCase(String processDefinitionKeyLikeIgnoreCase) {
		if (inOrStatement) {
			this.currentOrQueryObject.processDefinitionKeyLikeIgnoreCase = processDefinitionKeyLikeIgnoreCase.toLowerCase();
		} else {
			this.processDefinitionKeyLikeIgnoreCase = processDefinitionKeyLikeIgnoreCase.toLowerCase();
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery processDefinitionKeyIn(Collection<String> processDefinitionKeys) {
		if (inOrStatement) {
			this.currentOrQueryObject.processDefinitionKeys = processDefinitionKeys;
		} else {
			this.processDefinitionKeys = processDefinitionKeys;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery processDefinitionName(String processDefinitionName) {
		if (inOrStatement) {
			this.currentOrQueryObject.processDefinitionName = processDefinitionName;
		} else {
			this.processDefinitionName = processDefinitionName;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery processDefinitionNameLike(String processDefinitionNameLike) {
		if (inOrStatement) {
			this.currentOrQueryObject.processDefinitionNameLike = processDefinitionNameLike;
		} else {
			this.processDefinitionNameLike = processDefinitionNameLike;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery processCategoryIn(Collection<String> processCategoryInList) {
		if (processCategoryInList == null) {
			throw new FlowableIllegalArgumentException("Process category list is null");
		}
		if (processCategoryInList.isEmpty()) {
			throw new FlowableIllegalArgumentException("Process category list is empty");
		}
		for (String processCategory : processCategoryInList) {
			if (processCategory == null) {
				throw new FlowableIllegalArgumentException("None of the given process categories can be null");
			}
		}

		if (inOrStatement) {
			currentOrQueryObject.processCategoryInList = processCategoryInList;
		} else {
			this.processCategoryInList = processCategoryInList;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery processCategoryNotIn(Collection<String> processCategoryNotInList) {
		if (processCategoryNotInList == null) {
			throw new FlowableIllegalArgumentException("Process category list is null");
		}
		if (processCategoryNotInList.isEmpty()) {
			throw new FlowableIllegalArgumentException("Process category list is empty");
		}
		for (String processCategory : processCategoryNotInList) {
			if (processCategory == null) {
				throw new FlowableIllegalArgumentException("None of the given process categories can be null");
			}
		}

		if (inOrStatement) {
			currentOrQueryObject.processCategoryNotInList = processCategoryNotInList;
		} else {
			this.processCategoryNotInList = processCategoryNotInList;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery deploymentId(String deploymentId) {
		if (inOrStatement) {
			this.currentOrQueryObject.deploymentId = deploymentId;
		} else {
			this.deploymentId = deploymentId;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery deploymentIdIn(Collection<String> deploymentIds) {
		if (inOrStatement) {
			currentOrQueryObject.deploymentIds = deploymentIds;
		} else {
			this.deploymentIds = deploymentIds;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery cmmnDeploymentId(String cmmnDeploymentId) {
		if (inOrStatement) {
			currentOrQueryObject.cmmnDeploymentId = cmmnDeploymentId;
		} else {
			this.cmmnDeploymentId = cmmnDeploymentId;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery cmmnDeploymentIdIn(Collection<String> cmmnDeploymentIds) {
		if (inOrStatement) {
			currentOrQueryObject.cmmnDeploymentIds = cmmnDeploymentIds;
		} else {
			this.cmmnDeploymentIds = cmmnDeploymentIds;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskId(String taskId) {
		if (inOrStatement) {
			this.currentOrQueryObject.taskId = taskId;
		} else {
			this.taskId = taskId;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskName(String taskName) {
		if (inOrStatement) {
			this.currentOrQueryObject.taskName = taskName;
		} else {
			this.taskName = taskName;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskNameIn(Collection<String> taskNameList) {
		if (taskNameList == null) {
			throw new FlowableIllegalArgumentException("Task name list is null");
		}
		if (taskNameList.isEmpty()) {
			throw new FlowableIllegalArgumentException("Task name list is empty");
		}

		if (taskName != null) {
			throw new FlowableIllegalArgumentException("Invalid query usage: cannot set both taskNameIn and taskName");
		}
		if (taskNameLike != null) {
			throw new FlowableIllegalArgumentException("Invalid query usage: cannot set both taskNameIn and taskNameLike");
		}
		if (taskNameLikeIgnoreCase != null) {
			throw new FlowableIllegalArgumentException("Invalid query usage: cannot set both taskNameIn and taskNameLikeIgnoreCase");
		}

		if (inOrStatement) {
			currentOrQueryObject.taskNameList = taskNameList;
		} else {
			this.taskNameList = taskNameList;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskNameInIgnoreCase(Collection<String> taskNameList) {
		if (taskNameList == null) {
			throw new FlowableIllegalArgumentException("Task name list is null");
		}
		if (taskNameList.isEmpty()) {
			throw new FlowableIllegalArgumentException("Task name list is empty");
		}
		for (String taskName : taskNameList) {
			if (taskName == null) {
				throw new FlowableIllegalArgumentException("None of the given task names can be null");
			}
		}

		if (taskName != null) {
			throw new FlowableIllegalArgumentException("Invalid query usage: cannot set both taskNameInIgnoreCase and name");
		}
		if (taskNameLike != null) {
			throw new FlowableIllegalArgumentException("Invalid query usage: cannot set both taskNameInIgnoreCase and nameLike");
		}
		if (taskNameLikeIgnoreCase != null) {
			throw new FlowableIllegalArgumentException("Invalid query usage: cannot set both taskNameInIgnoreCase and nameLikeIgnoreCase");
		}

		final int nameListSize = taskNameList.size();
		final Collection<String> caseIgnoredTaskNameList = new ArrayList<>(nameListSize);
		for (String taskName : taskNameList) {
			caseIgnoredTaskNameList.add(taskName.toLowerCase());
		}

		if (inOrStatement) {
			this.currentOrQueryObject.taskNameListIgnoreCase = caseIgnoredTaskNameList;
		} else {
			this.taskNameListIgnoreCase = caseIgnoredTaskNameList;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskNameLike(String taskNameLike) {
		if (inOrStatement) {
			this.currentOrQueryObject.taskNameLike = taskNameLike;
		} else {
			this.taskNameLike = taskNameLike;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskNameLikeIgnoreCase(String taskNameLikeIgnoreCase) {
		if (inOrStatement) {
			this.currentOrQueryObject.taskNameLikeIgnoreCase = taskNameLikeIgnoreCase.toLowerCase();
		} else {
			this.taskNameLikeIgnoreCase = taskNameLikeIgnoreCase.toLowerCase();
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskParentTaskId(String parentTaskId) {
		if (inOrStatement) {
			this.currentOrQueryObject.taskParentTaskId = parentTaskId;
		} else {
			this.taskParentTaskId = parentTaskId;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskDescription(String taskDescription) {
		if (inOrStatement) {
			this.currentOrQueryObject.taskDescription = taskDescription;
		} else {
			this.taskDescription = taskDescription;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskDescriptionLike(String taskDescriptionLike) {
		if (inOrStatement) {
			this.currentOrQueryObject.taskDescriptionLike = taskDescriptionLike;
		} else {
			this.taskDescriptionLike = taskDescriptionLike;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskDescriptionLikeIgnoreCase(String taskDescriptionLikeIgnoreCase) {
		if (inOrStatement) {
			this.currentOrQueryObject.taskDescriptionLikeIgnoreCase = taskDescriptionLikeIgnoreCase.toLowerCase();
		} else {
			this.taskDescriptionLikeIgnoreCase = taskDescriptionLikeIgnoreCase.toLowerCase();
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskDeleteReason(String taskDeleteReason) {
		if (inOrStatement) {
			this.currentOrQueryObject.taskDeleteReason = taskDeleteReason;
		} else {
			this.taskDeleteReason = taskDeleteReason;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskDeleteReasonLike(String taskDeleteReasonLike) {
		if (inOrStatement) {
			this.currentOrQueryObject.taskDeleteReasonLike = taskDeleteReasonLike;
		} else {
			this.taskDeleteReasonLike = taskDeleteReasonLike;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskAssignee(String taskAssignee) {
		if (inOrStatement) {
			this.currentOrQueryObject.taskAssignee = taskAssignee;
		} else {
			this.taskAssignee = taskAssignee;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskAssigneeLike(String taskAssigneeLike) {
		if (inOrStatement) {
			this.currentOrQueryObject.taskAssigneeLike = taskAssigneeLike;
		} else {
			this.taskAssigneeLike = taskAssigneeLike;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskAssigneeLikeIgnoreCase(String taskAssigneeLikeIgnoreCase) {
		if (inOrStatement) {
			this.currentOrQueryObject.taskAssigneeLikeIgnoreCase = taskAssigneeLikeIgnoreCase.toLowerCase();
		} else {
			this.taskAssigneeLikeIgnoreCase = taskAssigneeLikeIgnoreCase.toLowerCase();
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskAssigneeIds(Collection<String> assigneeIds) {
		if (assigneeIds == null) {
			throw new FlowableIllegalArgumentException("Task assignee list is null");
		}
		if (assigneeIds.isEmpty()) {
			throw new FlowableIllegalArgumentException("Task assignee list is empty");
		}
		for (String assignee : assigneeIds) {
			if (assignee == null) {
				throw new FlowableIllegalArgumentException("None of the given task assignees can be null");
			}
		}

		if (taskAssignee != null) {
			throw new FlowableIllegalArgumentException("Invalid query usage: cannot set both taskAssigneeIds and taskAssignee");
		}
		if (taskAssigneeLike != null) {
			throw new FlowableIllegalArgumentException("Invalid query usage: cannot set both taskAssigneeIds and taskAssigneeLike");
		}
		if (taskAssigneeLikeIgnoreCase != null) {
			throw new FlowableIllegalArgumentException("Invalid query usage: cannot set both taskAssigneeIds and taskAssigneeLikeIgnoreCase");
		}

		if (inOrStatement) {
			currentOrQueryObject.taskAssigneeIds = assigneeIds;
		} else {
			this.taskAssigneeIds = assigneeIds;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskOwner(String taskOwner) {
		if (inOrStatement) {
			this.currentOrQueryObject.taskOwner = taskOwner;
		} else {
			this.taskOwner = taskOwner;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskOwnerLike(String taskOwnerLike) {
		if (inOrStatement) {
			this.currentOrQueryObject.taskOwnerLike = taskOwnerLike;
		} else {
			this.taskOwnerLike = taskOwnerLike;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskOwnerLikeIgnoreCase(String taskOwnerLikeIgnoreCase) {
		if (inOrStatement) {
			this.currentOrQueryObject.taskOwnerLikeIgnoreCase = taskOwnerLikeIgnoreCase.toLowerCase();
		} else {
			this.taskOwnerLikeIgnoreCase = taskOwnerLikeIgnoreCase.toLowerCase();
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery finished() {
		if (inOrStatement) {
			this.currentOrQueryObject.finished = true;
		} else {
			this.finished = true;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery unfinished() {
		if (inOrStatement) {
			this.currentOrQueryObject.unfinished = true;
		} else {
			this.unfinished = true;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskVariableValueEquals(String variableName, Object variableValue) {
		if (inOrStatement) {
			currentOrQueryObject.variableValueEquals(variableName, variableValue);
			return this;
		} else {
			return variableValueEquals(variableName, variableValue);
		}
	}

	public WfHistoricTaskInstanceQuery taskVariableValueEquals(Object variableValue) {
		if (inOrStatement) {
			currentOrQueryObject.variableValueEquals(variableValue);
			return this;
		} else {
			return variableValueEquals(variableValue);
		}
	}

	public WfHistoricTaskInstanceQuery taskVariableValueEqualsIgnoreCase(String name, String value) {
		if (inOrStatement) {
			currentOrQueryObject.variableValueEqualsIgnoreCase(name, value);
			return this;
		} else {
			return variableValueEqualsIgnoreCase(name, value);
		}
	}

	public WfHistoricTaskInstanceQuery taskVariableValueNotEqualsIgnoreCase(String name, String value) {
		if (inOrStatement) {
			currentOrQueryObject.variableValueNotEqualsIgnoreCase(name, value);
			return this;
		} else {
			return variableValueNotEqualsIgnoreCase(name, value);
		}
	}

	public WfHistoricTaskInstanceQuery taskVariableValueNotEquals(String variableName, Object variableValue) {
		if (inOrStatement) {
			currentOrQueryObject.variableValueNotEquals(variableName, variableValue);
			return this;
		} else {
			return variableValueNotEquals(variableName, variableValue);
		}
	}

	public WfHistoricTaskInstanceQuery taskVariableValueGreaterThan(String name, Object value) {
		if (inOrStatement) {
			currentOrQueryObject.variableValueGreaterThan(name, value);
			return this;
		} else {
			return variableValueGreaterThan(name, value);
		}
	}

	public WfHistoricTaskInstanceQuery taskVariableValueGreaterThanOrEqual(String name, Object value) {
		if (inOrStatement) {
			currentOrQueryObject.variableValueGreaterThanOrEqual(name, value);
			return this;
		} else {
			return variableValueGreaterThanOrEqual(name, value);
		}
	}

	public WfHistoricTaskInstanceQuery taskVariableValueLessThan(String name, Object value) {
		if (inOrStatement) {
			currentOrQueryObject.variableValueLessThan(name, value);
			return this;
		} else {
			return variableValueLessThan(name, value);
		}
	}

	public WfHistoricTaskInstanceQuery taskVariableValueLessThanOrEqual(String name, Object value) {
		if (inOrStatement) {
			currentOrQueryObject.variableValueLessThanOrEqual(name, value);
			return this;
		} else {
			return variableValueLessThanOrEqual(name, value);
		}
	}

	public WfHistoricTaskInstanceQuery taskVariableValueLike(String name, String value) {
		if (inOrStatement) {
			currentOrQueryObject.variableValueLike(name, value);
			return this;
		} else {
			return variableValueLike(name, value);
		}
	}

	public WfHistoricTaskInstanceQuery taskVariableValueLikeIgnoreCase(String name, String value) {
		if (inOrStatement) {
			currentOrQueryObject.variableValueLikeIgnoreCase(name, value, true);
			return this;
		} else {
			return variableValueLikeIgnoreCase(name, value, true);
		}
	}

	public WfHistoricTaskInstanceQuery taskVariableExists(String name) {
		if (inOrStatement) {
			currentOrQueryObject.variableExists(name, true);
			return this;
		} else {
			return variableExists(name, true);
		}
	}

	public WfHistoricTaskInstanceQuery taskVariableNotExists(String name) {
		if (inOrStatement) {
			currentOrQueryObject.variableNotExists(name, true);
			return this;
		} else {
			return variableNotExists(name, true);
		}
	}

	public WfHistoricTaskInstanceQuery processVariableValueEquals(String variableName, Object variableValue) {
		if (inOrStatement) {
			currentOrQueryObject.variableValueEquals(variableName, variableValue, false);
			return this;
		} else {
			return variableValueEquals(variableName, variableValue, false);
		}
	}

	public WfHistoricTaskInstanceQuery processVariableValueNotEquals(String variableName, Object variableValue) {
		if (inOrStatement) {
			currentOrQueryObject.variableValueNotEquals(variableName, variableValue, false);
			return this;
		} else {
			return variableValueNotEquals(variableName, variableValue, false);
		}
	}

	public WfHistoricTaskInstanceQuery processVariableValueEquals(Object variableValue) {
		if (inOrStatement) {
			currentOrQueryObject.variableValueEquals(variableValue, false);
			return this;
		} else {
			return variableValueEquals(variableValue, false);
		}
	}

	public WfHistoricTaskInstanceQuery processVariableValueEqualsIgnoreCase(String name, String value) {
		if (inOrStatement) {
			currentOrQueryObject.variableValueEqualsIgnoreCase(name, value, false);
			return this;
		} else {
			return variableValueEqualsIgnoreCase(name, value, false);
		}
	}

	public WfHistoricTaskInstanceQuery processVariableValueNotEqualsIgnoreCase(String name, String value) {
		if (inOrStatement) {
			currentOrQueryObject.variableValueNotEqualsIgnoreCase(name, value, false);
			return this;
		} else {
			return variableValueNotEqualsIgnoreCase(name, value, false);
		}
	}

	public WfHistoricTaskInstanceQuery processVariableValueGreaterThan(String name, Object value) {
		if (inOrStatement) {
			currentOrQueryObject.variableValueGreaterThan(name, value, false);
			return this;
		} else {
			return variableValueGreaterThan(name, value, false);
		}
	}

	public WfHistoricTaskInstanceQuery processVariableValueGreaterThanOrEqual(String name, Object value) {
		if (inOrStatement) {
			currentOrQueryObject.variableValueGreaterThanOrEqual(name, value, false);
			return this;
		} else {
			return variableValueGreaterThanOrEqual(name, value, false);
		}
	}

	public WfHistoricTaskInstanceQuery processVariableValueLessThan(String name, Object value) {
		if (inOrStatement) {
			currentOrQueryObject.variableValueLessThan(name, value, false);
			return this;
		} else {
			return variableValueLessThan(name, value, false);
		}
	}

	public WfHistoricTaskInstanceQuery processVariableValueLessThanOrEqual(String name, Object value) {
		if (inOrStatement) {
			currentOrQueryObject.variableValueLessThanOrEqual(name, value, false);
			return this;
		} else {
			return variableValueLessThanOrEqual(name, value, false);
		}
	}

	public WfHistoricTaskInstanceQuery processVariableValueLike(String name, String value) {
		if (inOrStatement) {
			currentOrQueryObject.variableValueLike(name, value, false);
			return this;
		} else {
			return variableValueLike(name, value, false);
		}
	}

	public WfHistoricTaskInstanceQuery processVariableValueLikeIgnoreCase(String name, String value) {
		if (inOrStatement) {
			currentOrQueryObject.variableValueLikeIgnoreCase(name, value, false);
			return this;
		} else {
			return variableValueLikeIgnoreCase(name, value, false);
		}
	}

	public WfHistoricTaskInstanceQuery processVariableExists(String name) {
		if (inOrStatement) {
			currentOrQueryObject.variableExists(name, false);
			return this;
		} else {
			return variableExists(name, false);
		}
	}

	public WfHistoricTaskInstanceQuery processVariableNotExists(String name) {
		if (inOrStatement) {
			currentOrQueryObject.variableNotExists(name, false);
			return this;
		} else {
			return variableNotExists(name, false);
		}
	}

	public WfHistoricTaskInstanceQuery taskDefinitionKey(String taskDefinitionKey) {
		if (inOrStatement) {
			this.currentOrQueryObject.taskDefinitionKey = taskDefinitionKey;
		} else {
			this.taskDefinitionKey = taskDefinitionKey;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskDefinitionKeyLike(String taskDefinitionKeyLike) {
		if (inOrStatement) {
			this.currentOrQueryObject.taskDefinitionKeyLike = taskDefinitionKeyLike;
		} else {
			this.taskDefinitionKeyLike = taskDefinitionKeyLike;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskDefinitionKeys(Collection<String> taskDefinitionKeys) {
		if (inOrStatement) {
			this.currentOrQueryObject.taskDefinitionKeys = taskDefinitionKeys;
		} else {
			this.taskDefinitionKeys = taskDefinitionKeys;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskPriority(Integer taskPriority) {
		if (inOrStatement) {
			this.currentOrQueryObject.taskPriority = taskPriority;
		} else {
			this.taskPriority = taskPriority;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskMinPriority(Integer taskMinPriority) {
		if (inOrStatement) {
			this.currentOrQueryObject.taskMinPriority = taskMinPriority;
		} else {
			this.taskMinPriority = taskMinPriority;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskMaxPriority(Integer taskMaxPriority) {
		if (inOrStatement) {
			this.currentOrQueryObject.taskMaxPriority = taskMaxPriority;
		} else {
			this.taskMaxPriority = taskMaxPriority;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery processFinished() {
		if (inOrStatement) {
			this.currentOrQueryObject.processFinished = true;
		} else {
			this.processFinished = true;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery processUnfinished() {
		if (inOrStatement) {
			this.currentOrQueryObject.processUnfinished = true;
		} else {
			this.processUnfinished = true;
		}
		return this;
	}

	protected void ensureVariablesInitialized() {
		for (QueryVariableValue var : queryVariableValues) {
			var.initialize(variableServiceConfiguration);
		}

		for (WfHistoricTaskInstanceQuery orQueryObject : orQueryObjects) {
			orQueryObject.ensureVariablesInitialized();
		}
	}

	public WfHistoricTaskInstanceQuery taskDueDate(Date dueDate) {
		if (inOrStatement) {
			this.currentOrQueryObject.dueDate = dueDate;
		} else {
			this.dueDate = dueDate;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskDueAfter(Date dueAfter) {
		if (inOrStatement) {
			this.currentOrQueryObject.dueAfter = dueAfter;
		} else {
			this.dueAfter = dueAfter;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskDueBefore(Date dueBefore) {
		if (inOrStatement) {
			this.currentOrQueryObject.dueBefore = dueBefore;
		} else {
			this.dueBefore = dueBefore;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskCreatedOn(Date creationDate) {
		if (inOrStatement) {
			this.currentOrQueryObject.creationDate = creationDate;
		} else {
			this.creationDate = creationDate;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskCreatedBefore(Date creationBeforeDate) {
		if (inOrStatement) {
			this.currentOrQueryObject.creationBeforeDate = creationBeforeDate;
		} else {
			this.creationBeforeDate = creationBeforeDate;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskCreatedAfter(Date creationAfterDate) {
		if (inOrStatement) {
			this.currentOrQueryObject.creationAfterDate = creationAfterDate;
		} else {
			this.creationAfterDate = creationAfterDate;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskCompletedOn(Date completedDate) {
		if (inOrStatement) {
			this.currentOrQueryObject.completedDate = completedDate;
		} else {
			this.completedDate = completedDate;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskCompletedBefore(Date completedBeforeDate) {
		if (inOrStatement) {
			this.currentOrQueryObject.completedBeforeDate = completedBeforeDate;
		} else {
			this.completedBeforeDate = completedBeforeDate;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskCompletedAfter(Date completedAfterDate) {
		if (inOrStatement) {
			this.currentOrQueryObject.completedAfterDate = completedAfterDate;
		} else {
			this.completedAfterDate = completedAfterDate;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery withoutTaskDueDate() {
		if (inOrStatement) {
			this.currentOrQueryObject.withoutDueDate = true;
		} else {
			this.withoutDueDate = true;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskCategory(String category) {
		if (inOrStatement) {
			this.currentOrQueryObject.category = category;
		} else {
			this.category = category;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskWithFormKey() {
		if (inOrStatement) {
			currentOrQueryObject.withFormKey = true;
		} else {
			this.withFormKey = true;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskFormKey(String formKey) {
		if (formKey == null) {
			throw new FlowableIllegalArgumentException("Task formKey is null");
		}

		if (inOrStatement) {
			currentOrQueryObject.formKey = formKey;
		} else {
			this.formKey = formKey;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskCandidateUser(String candidateUser) {
		if (candidateUser == null) {
			throw new FlowableIllegalArgumentException("Candidate user is null");
		}

		if (inOrStatement) {
			this.currentOrQueryObject.candidateUser = candidateUser;
		} else {
			this.candidateUser = candidateUser;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskCandidateGroup(String candidateGroup) {
		if (candidateGroup == null) {
			throw new FlowableIllegalArgumentException("Candidate group is null");
		}

		if (candidateGroups != null) {
			throw new FlowableIllegalArgumentException("Invalid query usage: cannot set both candidateGroup and candidateGroupIn");
		}

		if (inOrStatement) {
			this.currentOrQueryObject.candidateGroup = candidateGroup;
		} else {
			this.candidateGroup = candidateGroup;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskCandidateGroupIn(Collection<String> candidateGroups) {
		if (candidateGroups == null) {
			throw new FlowableIllegalArgumentException("Candidate group list is null");
		}

		if (candidateGroups.isEmpty()) {
			throw new FlowableIllegalArgumentException("Candidate group list is empty");
		}

		if (candidateGroup != null) {
			throw new FlowableIllegalArgumentException("Invalid query usage: cannot set both candidateGroupIn and candidateGroup");
		}

		if (inOrStatement) {
			this.currentOrQueryObject.candidateGroups = candidateGroups;
		} else {
			this.candidateGroups = candidateGroups;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskInvolvedUser(String involvedUser) {
		if (involvedUser == null) {
			throw new FlowableIllegalArgumentException("involved user is null");
		}

		if (inOrStatement) {
			this.currentOrQueryObject.involvedUser = involvedUser;
		} else {
			this.involvedUser = involvedUser;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskInvolvedGroups(Collection<String> involvedGroups) {
		if (involvedGroups == null) {
			throw new FlowableIllegalArgumentException("Involved groups are null");
		}
		if (involvedGroups.isEmpty()) {
			throw new FlowableIllegalArgumentException("Involved groups are empty");
		}
		if (inOrStatement) {
			this.currentOrQueryObject.involvedGroups = involvedGroups;
		} else {
			this.involvedGroups = involvedGroups;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery ignoreAssigneeValue() {
		if (inOrStatement) {
			this.currentOrQueryObject.ignoreAssigneeValue = true;
		} else {
			this.ignoreAssigneeValue = true;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskTenantId(String tenantId) {
		if (tenantId == null) {
			throw new FlowableIllegalArgumentException("task tenant id is null");
		}
		if (inOrStatement) {
			this.currentOrQueryObject.tenantId = tenantId;
		} else {
			this.tenantId = tenantId;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskTenantIdLike(String tenantIdLike) {
		if (tenantIdLike == null) {
			throw new FlowableIllegalArgumentException("task tenant id is null");
		}
		if (inOrStatement) {
			this.currentOrQueryObject.tenantIdLike = tenantIdLike;
		} else {
			this.tenantIdLike = tenantIdLike;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskWithoutTenantId() {
		if (inOrStatement) {
			this.currentOrQueryObject.withoutTenantId = true;
		} else {
			this.withoutTenantId = true;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery taskWithoutDeleteReason() {
		if (inOrStatement) {
			this.currentOrQueryObject.withoutDeleteReason = true;
		} else {
			this.withoutDeleteReason = true;
		}
		return this;
	}

	public WfHistoricTaskInstanceQuery locale(String locale) {
		this.locale = locale;
		return this;
	}

	public WfHistoricTaskInstanceQuery withLocalizationFallback() {
		withLocalizationFallback = true;
		return this;
	}

	public WfHistoricTaskInstanceQuery includeTaskLocalVariables() {
		this.includeTaskLocalVariables = true;
		return this;
	}

	public WfHistoricTaskInstanceQuery includeProcessVariables() {
		this.includeProcessVariables = true;
		return this;
	}

	public WfHistoricTaskInstanceQuery limitTaskVariables(Integer taskVariablesLimit) {
		this.taskVariablesLimit = taskVariablesLimit;
		return this;
	}

	public WfHistoricTaskInstanceQuery includeIdentityLinks() {
		this.includeIdentityLinks = true;
		return this;
	}

	public Integer getTaskVariablesLimit() {
		return taskVariablesLimit;
	}

	public WfHistoricTaskInstanceQuery or() {
		if (inOrStatement) {
			throw new FlowableException("the query is already in an or statement");
		}

		inOrStatement = true;
		if (databaseType != null) {
			currentOrQueryObject = new WfHistoricTaskInstanceQuery(commandExecutor, databaseType, taskServiceConfiguration, variableServiceConfiguration);
		} else {
			currentOrQueryObject = new WfHistoricTaskInstanceQuery(commandExecutor, taskServiceConfiguration, variableServiceConfiguration);
		}
		orQueryObjects.add(currentOrQueryObject);
		return this;
	}

	public WfHistoricTaskInstanceQuery endOr() {
		if (!inOrStatement) {
			throw new FlowableException("endOr() can only be called after calling or()");
		}

		inOrStatement = false;
		currentOrQueryObject = null;
		return this;
	}

	// ordering
	// /////////////////////////////////////////////////////////////////

	public WfHistoricTaskInstanceQuery orderByTaskId() {
		orderBy(HistoricTaskInstanceQueryProperty.HISTORIC_TASK_INSTANCE_ID);
		return this;
	}

	public WfHistoricTaskInstanceQuery orderByHistoricActivityInstanceId() {
		orderBy(HistoricTaskInstanceQueryProperty.PROCESS_DEFINITION_ID);
		return this;
	}

	public WfHistoricTaskInstanceQuery orderByProcessDefinitionId() {
		orderBy(HistoricTaskInstanceQueryProperty.PROCESS_DEFINITION_ID);
		return this;
	}

	public WfHistoricTaskInstanceQuery orderByProcessInstanceId() {
		orderBy(HistoricTaskInstanceQueryProperty.PROCESS_INSTANCE_ID);
		return this;
	}

	public WfHistoricTaskInstanceQuery orderByExecutionId() {
		orderBy(HistoricTaskInstanceQueryProperty.EXECUTION_ID);
		return this;
	}

	public WfHistoricTaskInstanceQuery orderByHistoricTaskInstanceDuration() {
		orderBy(HistoricTaskInstanceQueryProperty.DURATION);
		return this;
	}

	public WfHistoricTaskInstanceQuery orderByHistoricTaskInstanceEndTime() {
		orderBy(HistoricTaskInstanceQueryProperty.END);
		return this;
	}

	public WfHistoricTaskInstanceQuery orderByHistoricActivityInstanceStartTime() {
		orderBy(HistoricTaskInstanceQueryProperty.START);
		return this;
	}

	public WfHistoricTaskInstanceQuery orderByHistoricTaskInstanceStartTime() {
		orderBy(HistoricTaskInstanceQueryProperty.START);
		return this;
	}

	public WfHistoricTaskInstanceQuery orderByTaskCreateTime() {
		return orderByHistoricTaskInstanceStartTime();
	}

	public WfHistoricTaskInstanceQuery orderByTaskName() {
		orderBy(HistoricTaskInstanceQueryProperty.TASK_NAME);
		return this;
	}

	public WfHistoricTaskInstanceQuery orderByTaskDescription() {
		orderBy(HistoricTaskInstanceQueryProperty.TASK_DESCRIPTION);
		return this;
	}

	public WfHistoricTaskInstanceQuery orderByTaskAssignee() {
		orderBy(HistoricTaskInstanceQueryProperty.TASK_ASSIGNEE);
		return this;
	}

	public WfHistoricTaskInstanceQuery orderByTaskOwner() {
		orderBy(HistoricTaskInstanceQueryProperty.TASK_OWNER);
		return this;
	}

	public WfHistoricTaskInstanceQuery orderByTaskDueDate() {
		orderBy(HistoricTaskInstanceQueryProperty.TASK_DUE_DATE);
		return this;
	}

	public WfHistoricTaskInstanceQuery orderByDueDateNullsFirst() {
		return orderBy(HistoricTaskInstanceQueryProperty.TASK_DUE_DATE, NullHandlingOnOrder.NULLS_FIRST);
	}

	public WfHistoricTaskInstanceQuery orderByDueDateNullsLast() {
		return orderBy(HistoricTaskInstanceQueryProperty.TASK_DUE_DATE, NullHandlingOnOrder.NULLS_LAST);
	}

	public WfHistoricTaskInstanceQuery orderByCategory() {
		orderBy(HistoricTaskInstanceQueryProperty.CATEGORY);
		return this;
	}

	public WfHistoricTaskInstanceQuery orderByDeleteReason() {
		orderBy(HistoricTaskInstanceQueryProperty.DELETE_REASON);
		return this;
	}

	public WfHistoricTaskInstanceQuery orderByTaskDefinitionKey() {
		orderBy(HistoricTaskInstanceQueryProperty.TASK_DEFINITION_KEY);
		return this;
	}

	public WfHistoricTaskInstanceQuery orderByTaskPriority() {
		orderBy(HistoricTaskInstanceQueryProperty.TASK_PRIORITY);
		return this;
	}

	public WfHistoricTaskInstanceQuery orderByTenantId() {
		orderBy(HistoricTaskInstanceQueryProperty.TENANT_ID_);
		return this;
	}

	public Collection<String> getCandidateGroups() {
		if (candidateGroup != null) {
			Collection<String> candidateGroupList = new ArrayList<>(1);
			candidateGroupList.add(candidateGroup);
			return candidateGroupList;

		} else if (candidateGroups != null) {
			return candidateGroups;

		} else if (candidateUser != null) {
			return getGroupsForCandidateUser(candidateUser);
		}
		return null;
	}

	protected Collection<String> getGroupsForCandidateUser(String candidateUser) {
		Collection<String> groupIds = new ArrayList<>();
		IdmIdentityService idmIdentityService = taskServiceConfiguration.getIdmIdentityService();
		if (idmIdentityService != null) {
			List<Group> groups = idmIdentityService.createGroupQuery().groupMember(candidateUser).list();
			for (Group group : groups) {
				groupIds.add(group.getId());
			}
		}
		return groupIds;
	}

	// getters and setters
	// //////////////////////////////////////////////////////

	public String getProcessInstanceId() {
		return processInstanceId;
	}

	public Collection<String> getProcessInstanceIds() {
		return processInstanceIds;
	}

	public String getProcessInstanceBusinessKey() {
		return processInstanceBusinessKey;
	}

	public String getExecutionId() {
		return executionId;
	}

	public String getScopeId() {
		return scopeId;
	}

	public String getSubScopeId() {
		return subScopeId;
	}

	public String getScopeType() {
		return scopeType;
	}

	public String getScopeDefinitionId() {
		return scopeDefinitionId;
	}

	public String getPropagatedStageInstanceId() {
		return propagatedStageInstanceId;
	}

	public String getTaskDefinitionId() {
		return taskDefinitionId;
	}

	public String getProcessDefinitionId() {
		return processDefinitionId;
	}

	public String getProcessDefinitionKey() {
		return processDefinitionKey;
	}

	public String getProcessDefinitionKeyLike() {
		return processDefinitionKeyLike;
	}

	public Collection<String> getProcessDefinitionKeys() {
		return processDefinitionKeys;
	}

	public String getProcessDefinitionName() {
		return processDefinitionName;
	}

	public String getProcessDefinitionNameLike() {
		return processDefinitionNameLike;
	}

	public Collection<String> getProcessCategoryInList() {
		return processCategoryInList;
	}

	public Collection<String> getProcessCategoryNotInList() {
		return processCategoryNotInList;
	}

	public String getDeploymentId() {
		return deploymentId;
	}

	public Collection<String> getDeploymentIds() {
		return deploymentIds;
	}

	public String getCmmnDeploymentId() {
		return cmmnDeploymentId;
	}

	public Collection<String> getCmmnDeploymentIds() {
		return cmmnDeploymentIds;
	}

	public String getProcessInstanceBusinessKeyLike() {
		return processInstanceBusinessKeyLike;
	}

	public String getTaskDefinitionKeyLike() {
		return taskDefinitionKeyLike;
	}

	public String getProcessInstanceIdWithChildren() {
		return processInstanceIdWithChildren;
	}

	public String getCaseInstanceIdWithChildren() {
		return caseInstanceIdWithChildren;
	}

	public Integer getTaskPriority() {
		return taskPriority;
	}

	public Integer getTaskMinPriority() {
		return taskMinPriority;
	}

	public Integer getTaskMaxPriority() {
		return taskMaxPriority;
	}

	public boolean isProcessFinished() {
		return processFinished;
	}

	public boolean isProcessUnfinished() {
		return processUnfinished;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public Date getDueAfter() {
		return dueAfter;
	}

	public Date getDueBefore() {
		return dueBefore;
	}

	public boolean isWithoutDueDate() {
		return withoutDueDate;
	}

	public Date getCreationAfterDate() {
		return creationAfterDate;
	}

	public Date getCreationBeforeDate() {
		return creationBeforeDate;
	}

	public Date getCompletedDate() {
		return completedDate;
	}

	public Date getCompletedAfterDate() {
		return completedAfterDate;
	}

	public Date getCompletedBeforeDate() {
		return completedBeforeDate;
	}

	public String getCategory() {
		return category;
	}

	public boolean isWithFormKey() {
		return withFormKey;
	}

	public String getFormKey() {
		return formKey;
	}

	public String getTenantId() {
		return tenantId;
	}

	public String getTenantIdLike() {
		return tenantIdLike;
	}

	public boolean isWithoutTenantId() {
		return withoutTenantId;
	}

	public boolean isIncludeTaskLocalVariables() {
		return includeTaskLocalVariables;
	}

	public boolean isIncludeProcessVariables() {
		return includeProcessVariables;
	}

	public boolean isIncludeIdentityLinks() {
		return includeIdentityLinks;
	}

	public boolean isInOrStatement() {
		return inOrStatement;
	}

	public boolean isFinished() {
		return finished;
	}

	public boolean isUnfinished() {
		return unfinished;
	}

	public String getTaskName() {
		return taskName;
	}

	public String getTaskNameLike() {
		return taskNameLike;
	}

	public Collection<String> getTaskNameList() {
		return taskNameList;
	}

	public Collection<String> getTaskNameListIgnoreCase() {
		return taskNameListIgnoreCase;
	}

	public String getTaskDescription() {
		return taskDescription;
	}

	public String getTaskDescriptionLike() {
		return taskDescriptionLike;
	}

	public String getTaskDeleteReason() {
		return taskDeleteReason;
	}

	public String getTaskDeleteReasonLike() {
		return taskDeleteReasonLike;
	}

	public String getTaskAssignee() {
		return taskAssignee;
	}

	public String getTaskAssigneeLike() {
		return taskAssigneeLike;
	}

	public Collection<String> getTaskAssigneeIds() {
		return taskAssigneeIds;
	}

	public String getTaskId() {
		return taskId;
	}

	public String getId() {
		return taskId;
	}

	public String getTaskDefinitionKey() {
		return taskDefinitionKey;
	}

	public String getTaskOwnerLike() {
		return taskOwnerLike;
	}

	public String getTaskOwner() {
		return taskOwner;
	}

	public Collection<String> getTaskDefinitionKeys() {
		return taskDefinitionKeys;
	}

	public String getTaskParentTaskId() {
		return taskParentTaskId;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public String getCandidateUser() {
		return candidateUser;
	}

	public String getCandidateGroup() {
		return candidateGroup;
	}

	public String getInvolvedUser() {
		return involvedUser;
	}

	public Collection<String> getInvolvedGroups() {
		return involvedGroups;
	}

	public boolean isIgnoreAssigneeValue() {
		return ignoreAssigneeValue;
	}

	public String getProcessDefinitionKeyLikeIgnoreCase() {
		return processDefinitionKeyLikeIgnoreCase;
	}

	public String getProcessInstanceBusinessKeyLikeIgnoreCase() {
		return processInstanceBusinessKeyLikeIgnoreCase;
	}

	public String getTaskNameLikeIgnoreCase() {
		return taskNameLikeIgnoreCase;
	}

	public String getTaskDescriptionLikeIgnoreCase() {
		return taskDescriptionLikeIgnoreCase;
	}

	public String getTaskOwnerLikeIgnoreCase() {
		return taskOwnerLikeIgnoreCase;
	}

	public String getTaskAssigneeLikeIgnoreCase() {
		return taskAssigneeLikeIgnoreCase;
	}

	public boolean isWithoutDeleteReason() {
		return withoutDeleteReason;
	}

	public String getLocale() {
		return locale;
	}

	public List<WfHistoricTaskInstanceQuery> getOrQueryObjects() {
		return orQueryObjects;
	}
}
