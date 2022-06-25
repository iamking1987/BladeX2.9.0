package org.springblade.plugin.workflow.app.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springblade.plugin.workflow.app.entity.WfAppProcess;

import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class WfAppProcessVo extends WfAppProcess {

	private String category;

	private List<Long> childrenIds;

	private List<WfAppProcess> processList;
}
