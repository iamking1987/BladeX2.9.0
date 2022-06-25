package org.springblade.plugin.workflow.design.service.impl;

import org.springblade.plugin.workflow.design.entity.WfFormDefaultValues;
import org.springblade.plugin.workflow.design.mapper.WfFormDefaultValuesMapper;
import org.springblade.plugin.workflow.design.service.IWfFormDefaultValuesService;
import org.springblade.core.mp.base.BaseServiceImpl;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 流程表单字段默认值 服务实现类
 *
 * @author ssc
 */
@Service
public class WfFormDefaultValuesServiceImpl extends BaseServiceImpl<WfFormDefaultValuesMapper, WfFormDefaultValues> implements IWfFormDefaultValuesService {

	@Override
	public Object listType() {
		Map<String, List<WfFormDefaultValues>> map = this.list().stream().collect(Collectors.groupingBy(WfFormDefaultValues::getFieldType));
		Map<String, Object> result = new HashMap<>();
		map.keySet().forEach(s -> result.put(s, map.get(s).stream().map(v -> {
			Map<String, Object> m = new HashMap<>();
			m.put("label", v.getName());
			m.put("value", v.getContent());
			return m;
		}).collect(Collectors.toList())));
		return result;
	}
}
