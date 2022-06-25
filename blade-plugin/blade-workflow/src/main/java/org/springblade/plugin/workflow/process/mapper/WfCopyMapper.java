
package org.springblade.plugin.workflow.process.mapper;

import org.springblade.plugin.workflow.process.entity.WfCopy;
import org.springblade.plugin.workflow.process.vo.WfCopyVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import java.util.List;

/**
 * 流程抄送 Mapper 接口
 *
 * @author ssc
 */
public interface WfCopyMapper extends BaseMapper<WfCopy> {

	/**
	 * 自定义分页
	 *
	 * @param page
	 * @param wfCopy
	 * @return
	 */
	List<WfCopyVO> selectWfCopyPage(IPage page, WfCopyVO wfCopy);

}
