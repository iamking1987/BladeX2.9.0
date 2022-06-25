
package org.springblade.plugin.workflow.design.mapper;

import org.springblade.plugin.workflow.design.entity.WfButton;
import org.springblade.plugin.workflow.design.vo.WfButtonVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;

import java.util.List;

/**
 * 流程按钮 Mapper 接口
 *
 * @author ssc
 */
public interface WfButtonMapper extends BaseMapper<WfButton> {

	/**
	 * 自定义分页
	 *
	 * @param page
	 * @param wfButton
	 * @return
	 */
	List<WfButtonVO> selectWfButtonPage(IPage page, WfButtonVO wfButton);

}
