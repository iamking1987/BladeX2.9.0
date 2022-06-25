package org.springblade.plugin.workflow.core.query;

import org.flowable.common.engine.api.FlowableException;
import org.flowable.common.engine.api.FlowableIllegalArgumentException;
import org.flowable.common.engine.impl.db.SuspensionState;
import org.flowable.common.engine.impl.interceptor.CommandContext;
import org.flowable.common.engine.impl.interceptor.CommandExecutor;
import org.flowable.common.engine.impl.query.AbstractQuery;
import org.flowable.engine.impl.ProcessDefinitionQueryProperty;
import org.flowable.engine.impl.util.CommandContextUtil;
import org.flowable.engine.repository.ProcessDefinition;

import java.util.Collection;
import java.util.List;
import java.util.Set;

public class WfProcessDefinitionQuery extends AbstractQuery<WfProcessDefinitionQuery, ProcessDefinition> {

	private static final long serialVersionUID = 1L;
	protected String id;
	protected Set<String> ids;
	protected String category;
	protected String categoryLike;
	protected String categoryNotEquals;
	protected String name;
	protected String nameLike;
	protected String deploymentId;
	protected Set<String> deploymentIds;
	protected String key;
	protected String keyLike;
	protected String resourceName;
	protected String resourceNameLike;
	protected Integer version;
	protected Integer versionGt;
	protected Integer versionGte;
	protected Integer versionLt;
	protected Integer versionLte;
	protected boolean latest;
	protected SuspensionState suspensionState;
	protected String authorizationUserId;
	protected Collection<String> authorizationGroups;
	protected boolean authorizationGroupsSet;
	protected String procDefId;
	protected String tenantId;
	protected String tenantIdLike;
	protected boolean withoutTenantId;
	protected String engineVersion;
	protected String locale;
	protected boolean withLocalizationFallback;
	protected String platform;

	protected String eventSubscriptionName;
	protected String eventSubscriptionType;

	public WfProcessDefinitionQuery() {
	}

	public WfProcessDefinitionQuery(CommandContext commandContext) {
		super(commandContext);
	}

	public WfProcessDefinitionQuery(CommandExecutor commandExecutor) {
		super(commandExecutor);
	}

	public WfProcessDefinitionQuery platform(String platform) {
		this.platform = platform;
		return this;
	}

	public WfProcessDefinitionQuery processDefinitionId(String processDefinitionId) {
		this.id = processDefinitionId;
		return this;
	}

	public WfProcessDefinitionQuery processDefinitionIds(Set<String> processDefinitionIds) {
		this.ids = processDefinitionIds;
		return this;
	}

	public WfProcessDefinitionQuery processDefinitionCategory(String category) {
		if (category == null) {
			throw new FlowableIllegalArgumentException("category is null");
		}
		this.category = category;
		return this;
	}

	public WfProcessDefinitionQuery processDefinitionCategoryLike(String categoryLike) {
		if (categoryLike == null) {
			throw new FlowableIllegalArgumentException("categoryLike is null");
		}
		this.categoryLike = categoryLike;
		return this;
	}

	public WfProcessDefinitionQuery processDefinitionCategoryNotEquals(String categoryNotEquals) {
		if (categoryNotEquals == null) {
			throw new FlowableIllegalArgumentException("categoryNotEquals is null");
		}
		this.categoryNotEquals = categoryNotEquals;
		return this;
	}

	public WfProcessDefinitionQuery processDefinitionName(String name) {
		if (name == null) {
			throw new FlowableIllegalArgumentException("name is null");
		}
		this.name = name;
		return this;
	}

	public WfProcessDefinitionQuery processDefinitionNameLike(String nameLike) {
		if (nameLike == null) {
			throw new FlowableIllegalArgumentException("nameLike is null");
		}
		this.nameLike = nameLike;
		return this;
	}

	public WfProcessDefinitionQuery deploymentId(String deploymentId) {
		if (deploymentId == null) {
			throw new FlowableIllegalArgumentException("id is null");
		}
		this.deploymentId = deploymentId;
		return this;
	}

	public WfProcessDefinitionQuery deploymentIds(Set<String> deploymentIds) {
		if (deploymentIds == null) {
			throw new FlowableIllegalArgumentException("ids are null");
		}
		this.deploymentIds = deploymentIds;
		return this;
	}

	public WfProcessDefinitionQuery processDefinitionKey(String key) {
		if (key == null) {
			throw new FlowableIllegalArgumentException("key is null");
		}
		this.key = key;
		return this;
	}

	public WfProcessDefinitionQuery processDefinitionKeyLike(String keyLike) {
		if (keyLike == null) {
			throw new FlowableIllegalArgumentException("keyLike is null");
		}
		this.keyLike = keyLike;
		return this;
	}

	public WfProcessDefinitionQuery processDefinitionResourceName(String resourceName) {
		if (resourceName == null) {
			throw new FlowableIllegalArgumentException("resourceName is null");
		}
		this.resourceName = resourceName;
		return this;
	}

	public WfProcessDefinitionQuery processDefinitionResourceNameLike(String resourceNameLike) {
		if (resourceNameLike == null) {
			throw new FlowableIllegalArgumentException("resourceNameLike is null");
		}
		this.resourceNameLike = resourceNameLike;
		return this;
	}

	public WfProcessDefinitionQuery processDefinitionVersion(Integer version) {
		checkVersion(version);
		this.version = version;
		return this;
	}

	public WfProcessDefinitionQuery processDefinitionVersionGreaterThan(Integer processDefinitionVersion) {
		checkVersion(processDefinitionVersion);
		this.versionGt = processDefinitionVersion;
		return this;
	}

	public WfProcessDefinitionQuery processDefinitionVersionGreaterThanOrEquals(Integer processDefinitionVersion) {
		checkVersion(processDefinitionVersion);
		this.versionGte = processDefinitionVersion;
		return this;
	}

	public WfProcessDefinitionQuery processDefinitionVersionLowerThan(Integer processDefinitionVersion) {
		checkVersion(processDefinitionVersion);
		this.versionLt = processDefinitionVersion;
		return this;
	}

	public WfProcessDefinitionQuery processDefinitionVersionLowerThanOrEquals(Integer processDefinitionVersion) {
		checkVersion(processDefinitionVersion);
		this.versionLte = processDefinitionVersion;
		return this;
	}

	protected void checkVersion(Integer version) {
		if (version == null) {
			throw new FlowableIllegalArgumentException("version is null");
		} else if (version <= 0) {
			throw new FlowableIllegalArgumentException("version must be positive");
		}
	}

	public WfProcessDefinitionQuery latestVersion() {
		this.latest = true;
		return this;
	}

	public WfProcessDefinitionQuery active() {
		this.suspensionState = SuspensionState.ACTIVE;
		return this;
	}

	public WfProcessDefinitionQuery suspended() {
		this.suspensionState = SuspensionState.SUSPENDED;
		return this;
	}

	public WfProcessDefinitionQuery processDefinitionTenantId(String tenantId) {
		if (tenantId == null) {
			throw new FlowableIllegalArgumentException("processDefinition tenantId is null");
		}
		this.tenantId = tenantId;
		return this;
	}

	public WfProcessDefinitionQuery processDefinitionTenantIdLike(String tenantIdLike) {
		if (tenantIdLike == null) {
			throw new FlowableIllegalArgumentException("process definition tenantId is null");
		}
		this.tenantIdLike = tenantIdLike;
		return this;
	}

	public WfProcessDefinitionQuery processDefinitionWithoutTenantId() {
		this.withoutTenantId = true;
		return this;
	}

	public WfProcessDefinitionQuery processDefinitionEngineVersion(String engineVersion) {
		this.engineVersion = engineVersion;
		return this;
	}

	public WfProcessDefinitionQuery messageEventSubscription(String messageName) {
		return eventSubscription("message", messageName);
	}

	public WfProcessDefinitionQuery messageEventSubscriptionName(String messageName) {
		return eventSubscription("message", messageName);
	}

	public WfProcessDefinitionQuery locale(String locale) {
		this.locale = locale;
		return this;
	}

	public WfProcessDefinitionQuery withLocalizationFallback() {
		this.withLocalizationFallback = true;
		return this;
	}

	public WfProcessDefinitionQuery processDefinitionStarter(String procDefId) {
		this.procDefId = procDefId;
		return this;
	}

	public WfProcessDefinitionQuery eventSubscription(String eventType, String eventName) {
		if (eventName == null) {
			throw new FlowableIllegalArgumentException("event name is null");
		}
		if (eventType == null) {
			throw new FlowableException("event type is null");
		}
		this.eventSubscriptionType = eventType;
		this.eventSubscriptionName = eventName;
		return this;
	}

	public Collection<String> getAuthorizationGroups() {
		if (authorizationGroupsSet) {
			// if authorizationGroupsSet is true then startableByUserOrGroups was called
			// and the groups passed in that methods have precedence
			return authorizationGroups;
		} else if (authorizationUserId == null) {
			return null;
		}
		return CommandContextUtil.getProcessEngineConfiguration().getCandidateManager().getGroupsForCandidateUser(authorizationUserId);
	}

	public WfProcessDefinitionQuery startableByUser(String userId) {
		if (userId == null) {
			throw new FlowableIllegalArgumentException("userId is null");
		}
		this.authorizationUserId = userId;
		return this;
	}

	public WfProcessDefinitionQuery startableByUserOrGroups(String userId, Collection<String> groups) {
		if (userId == null && (groups == null || groups.isEmpty())) {
			throw new FlowableIllegalArgumentException("userId is null and groups are null or empty");
		}
		this.authorizationUserId = userId;
		this.authorizationGroups = groups;
		this.authorizationGroupsSet = true;
		return this;
	}

	// sorting ////////////////////////////////////////////

	public WfProcessDefinitionQuery orderByDeploymentId() {
		return orderBy(ProcessDefinitionQueryProperty.DEPLOYMENT_ID);
	}

	public WfProcessDefinitionQuery orderByProcessDefinitionKey() {
		return orderBy(ProcessDefinitionQueryProperty.PROCESS_DEFINITION_KEY);
	}

	public WfProcessDefinitionQuery orderByProcessDefinitionCategory() {
		return orderBy(ProcessDefinitionQueryProperty.PROCESS_DEFINITION_CATEGORY);
	}

	public WfProcessDefinitionQuery orderByProcessDefinitionId() {
		return orderBy(ProcessDefinitionQueryProperty.PROCESS_DEFINITION_ID);
	}

	public WfProcessDefinitionQuery orderByProcessDefinitionVersion() {
		return orderBy(ProcessDefinitionQueryProperty.PROCESS_DEFINITION_VERSION);
	}

	public WfProcessDefinitionQuery orderByProcessDefinitionName() {
		return orderBy(ProcessDefinitionQueryProperty.PROCESS_DEFINITION_NAME);
	}

	public WfProcessDefinitionQuery orderByTenantId() {
		return orderBy(ProcessDefinitionQueryProperty.PROCESS_DEFINITION_TENANT_ID);
	}

	@Override
	public long executeCount(CommandContext commandContext) {
		return (long) CommandContextUtil.getDbSqlSession(commandContext).selectOne("selectWfProcessDefinitionCountByQueryCriteria", this);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<ProcessDefinition> executeList(CommandContext commandContext) {
		return CommandContextUtil.getDbSqlSession(commandContext).selectList("selectWfProcessDefinitionsByQueryCriteria", this);
	}

	// getters ////////////////////////////////////////////

	public String getDeploymentId() {
		return deploymentId;
	}

	public Set<String> getDeploymentIds() {
		return deploymentIds;
	}

	public String getId() {
		return id;
	}

	public Set<String> getIds() {
		return ids;
	}

	public String getName() {
		return name;
	}

	public String getNameLike() {
		return nameLike;
	}

	public String getKey() {
		return key;
	}

	public String getKeyLike() {
		return keyLike;
	}

	public Integer getVersion() {
		return version;
	}

	public Integer getVersionGt() {
		return versionGt;
	}

	public Integer getVersionGte() {
		return versionGte;
	}

	public Integer getVersionLt() {
		return versionLt;
	}

	public Integer getVersionLte() {
		return versionLte;
	}

	public boolean isLatest() {
		return latest;
	}

	public String getCategory() {
		return category;
	}

	public String getCategoryLike() {
		return categoryLike;
	}

	public String getResourceName() {
		return resourceName;
	}

	public String getResourceNameLike() {
		return resourceNameLike;
	}

	public SuspensionState getSuspensionState() {
		return suspensionState;
	}

	public void setSuspensionState(SuspensionState suspensionState) {
		this.suspensionState = suspensionState;
	}

	public String getCategoryNotEquals() {
		return categoryNotEquals;
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

	public String getEngineVersion() {
		return engineVersion;
	}

	public String getAuthorizationUserId() {
		return authorizationUserId;
	}

	public String getProcDefId() {
		return procDefId;
	}

	public String getEventSubscriptionName() {
		return eventSubscriptionName;
	}

	public String getEventSubscriptionType() {
		return eventSubscriptionType;
	}

	public boolean isIncludeAuthorization() {
		return authorizationUserId != null || (authorizationGroups != null && !authorizationGroups.isEmpty());
	}
}
