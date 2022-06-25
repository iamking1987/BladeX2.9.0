package org.springblade.plugin.workflow.core.utils;

import org.flowable.common.engine.api.query.Query;
import org.flowable.engine.history.HistoricProcessInstanceQuery;
import org.springblade.core.tool.utils.StringUtil;
import org.springblade.plugin.workflow.core.query.WfHistoricTaskInstanceQuery;

/**
 * 表单搜索条件工具类
 *
 * @author ssc
 */
public class WfSearchUtil {

	private static final String CONDITION_EQUAL = "equal";
	private static final String CONDITION_NOT_EQUAL = "notEqual";
	private static final String CONDITION_LIKE = "like";
	private static final String CONDITION_EXISTS = "exists";
	private static final String CONDITION_NOT_EXISTS = "notExists";
	private static final String CONDITION_GREATER_THAN = "greaterThan";
	private static final String CONDITION_LESS_THAN = "lessThan";
	private static final String CONDITION_GREATER_THAN_OR_EQUAL = "greaterThanOrEqual";
	private static final String CONDITION_LESS_THAN_OR_EQUAL = "lessThanOrEqual";

	public static void buildSearchQuery(Query query, String search) {
		if (StringUtil.isBlank(search)) {
			return;
		}
		if (query instanceof WfHistoricTaskInstanceQuery) {
			buildHistoricTaskQuery((WfHistoricTaskInstanceQuery) query, search.split(","));
		} else {
			buildHistoricProcessQuery((HistoricProcessInstanceQuery) query, search.split(","));
		}
	}

	private static void buildHistoricTaskQuery(WfHistoricTaskInstanceQuery query, String[] searchList) {
		for (String search : searchList) {
			String[] arr = search.split(":");
			if (arr.length == 2 || arr.length == 3) {
				String column = arr[0];
				String condition = arr[1];
				String value = "";
				if (arr.length == 3) value = arr[2];
				switch (condition) {
					case CONDITION_EQUAL:
						query.processVariableValueEquals(column, value);
						break;
					case CONDITION_NOT_EQUAL:
						query.processVariableValueNotEquals(column, value);
						break;
					case CONDITION_LIKE:
						query.processVariableValueLike(column, "%" + value + "%");
						break;
					case CONDITION_EXISTS:
						query.processVariableExists(column);
						break;
					case CONDITION_NOT_EXISTS:
						query.processVariableNotExists(column);
						break;
					case CONDITION_GREATER_THAN:
						query.processVariableValueGreaterThan(column, value);
						break;
					case CONDITION_LESS_THAN:
						query.processVariableValueLessThan(column, value);
						break;
					case CONDITION_GREATER_THAN_OR_EQUAL:
						query.processVariableValueGreaterThanOrEqual(column, value);
						break;
					case CONDITION_LESS_THAN_OR_EQUAL:
						query.processVariableValueLessThanOrEqual(column, value);
						break;
					default:
						break;
				}
			}

		}
	}

	private static void buildHistoricProcessQuery(HistoricProcessInstanceQuery query, String[] searchList) {
		for (String search : searchList) {
			String[] arr = search.split(":");
			if (arr.length == 2 || arr.length == 3) {
				String column = arr[0];
				String condition = arr[1];
				String value = "";
				if (arr.length == 3) value = arr[2];
				switch (condition) {
					case CONDITION_EQUAL:
						query.variableValueEquals(column, value);
						break;
					case CONDITION_NOT_EQUAL:
						query.variableValueNotEquals(column, value);
						break;
					case CONDITION_LIKE:
						query.variableValueLike(column, "%" + value + "%");
						break;
					case CONDITION_EXISTS:
						query.variableExists(column);
						break;
					case CONDITION_NOT_EXISTS:
						query.variableNotExists(column);
						break;
					case CONDITION_GREATER_THAN:
						query.variableValueGreaterThan(column, value);
						break;
					case CONDITION_LESS_THAN:
						query.variableValueLessThan(column, value);
						break;
					case CONDITION_GREATER_THAN_OR_EQUAL:
						query.variableValueGreaterThanOrEqual(column, value);
						break;
					case CONDITION_LESS_THAN_OR_EQUAL:
						query.variableValueLessThanOrEqual(column, value);
						break;
					default:
						break;
				}
			}
		}
	}
}
