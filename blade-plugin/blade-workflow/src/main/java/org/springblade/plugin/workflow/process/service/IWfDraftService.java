package org.springblade.plugin.workflow.process.service;

import org.springblade.plugin.workflow.process.entity.WfDraft;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 流程草稿箱 服务类
 *
 * @author ssc
 */
public interface IWfDraftService extends IService<WfDraft> {

	void submit(WfDraft wfDraft);

	void deleteByProcessDefId(String processDefId, String userId);

	void deleteByFormKey(String formKey);

}
