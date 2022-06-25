package org.springblade.plugin.workflow.design.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.RequiredArgsConstructor;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.ExtensionAttribute;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.repository.ProcessDefinition;
import org.springblade.core.redis.lock.RedisLock;
import org.springblade.core.tool.utils.ObjectUtil;
import org.springblade.core.tool.utils.StringUtil;
import org.springblade.plugin.workflow.core.constant.WfExtendConstant;
import org.springblade.plugin.workflow.core.utils.WfModelUtil;
import org.springblade.plugin.workflow.design.entity.WfSerial;
import org.springblade.plugin.workflow.design.mapper.WfSerialMapper;
import org.springblade.plugin.workflow.design.service.IWfSerialService;
import org.springblade.core.mp.base.BaseServiceImpl;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 流程流水号 服务实现类
 *
 * @author ssc
 */
@Service
@RequiredArgsConstructor
public class WfSerialServiceImpl extends BaseServiceImpl<WfSerialMapper, WfSerial> implements IWfSerialService {

	private final RepositoryService repositoryService;

	@Async
	@Override
	public void create(BpmnModel model, String deploymentId) {
		Map<String, List<ExtensionAttribute>> attributes = WfModelUtil.getProcessExtensionElementAttributes(model, WfExtendConstant.SERIAL);
		if (attributes != null) {
			WfSerial serial = new WfSerial();
			serial.setName(attributes.get("name").get(0).getValue());
			serial.setPrefix(attributes.get("prefix").get(0).getValue());
			serial.setDateFormat(attributes.get("dateFormat").get(0).getValue());
			serial.setSuffixLength(Integer.valueOf(attributes.get("suffixLength").get(0).getValue()));
			Integer startSequence = Integer.valueOf(attributes.get("startSequence").get(0).getValue());
			serial.setStartSequence(startSequence);

			// 继承上次部署模型的自增序列
			ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().deploymentId(deploymentId).singleResult();
			if (processDefinition != null && processDefinition.getVersion() != 0) {
				if (processDefinition.getVersion() != 1) {
					processDefinition = repositoryService.createProcessDefinitionQuery().processDefinitionKey(processDefinition.getKey()).processDefinitionVersion(processDefinition.getVersion() - 1).singleResult();
					if (processDefinition != null) {
						WfSerial wfSerial = this.getOne(new LambdaQueryWrapper<WfSerial>().eq(WfSerial::getDeploymentId, processDefinition.getDeploymentId()));
						if (wfSerial != null) {
							serial.setCurrentSequence(wfSerial.getCurrentSequence());
						}
					}
				}
			}
			if (ObjectUtil.isEmpty(serial.getCurrentSequence())) {
				serial.setCurrentSequence(ObjectUtil.isEmpty(startSequence) ? 0 : startSequence);
			}
			serial.setConnector(attributes.get("connector").get(0).getValue());
			serial.setCycle(attributes.get("cycle").get(0).getValue());
			serial.setDeploymentId(deploymentId);

			this.save(serial);
		}
	}

	@Override
	@RedisLock(value = "WfSerialLock", param = "#deploymentId")
	public String getNextSN(String deploymentId) {
		WfSerial serial = this.getOne(new LambdaQueryWrapper<WfSerial>().eq(WfSerial::getDeploymentId, deploymentId));
		if (serial != null) {
			SimpleDateFormat dateFormat = new SimpleDateFormat(serial.getDateFormat());
			StringBuilder buffer = new StringBuilder(serial.getPrefix());
			if (StringUtil.isNotBlank(serial.getConnector())) buffer.append(serial.getConnector());
			buffer.append(dateFormat.format(new Date()));
			if (StringUtil.isNotBlank(serial.getConnector())) buffer.append(serial.getConnector());
			buffer.append(String.format("%0" + serial.getSuffixLength() + "d", serial.getCurrentSequence()));

			serial.setCurrentSequence(serial.getCurrentSequence() + 1);
			if (serial.getCurrentSequence().toString().length() > serial.getSuffixLength()) {
				serial.setCurrentSequence(serial.getStartSequence());
			}

			this.updateById(serial);
			return buffer.toString();
		}
		return null;
	}

	@Override
	public void resetSN(String type) {
		baseMapper.resetSN(type);
	}

}
