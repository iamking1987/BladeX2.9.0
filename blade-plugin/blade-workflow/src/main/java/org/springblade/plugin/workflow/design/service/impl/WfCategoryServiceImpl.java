package org.springblade.plugin.workflow.design.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springblade.plugin.workflow.design.entity.WfCategory;
import org.springblade.plugin.workflow.design.vo.WfCategoryVO;
import org.springblade.plugin.workflow.design.mapper.WfCategoryMapper;
import org.springblade.plugin.workflow.design.service.IWfCategoryService;
import org.springblade.core.mp.base.BaseServiceImpl;
import org.springblade.plugin.workflow.design.wrapper.WfCategoryWrapper;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 流程分类 服务实现类
 *
 * @author ssc
 */
@Service
public class WfCategoryServiceImpl extends BaseServiceImpl<WfCategoryMapper, WfCategory> implements IWfCategoryService {

	@Override
	public IPage<WfCategoryVO> selectWfCategoryPage(IPage<WfCategoryVO> page, WfCategoryVO wfCategory) {
		return page.setRecords(baseMapper.selectWfCategoryPage(page, wfCategory));
	}

	@Override
	public List<WfCategoryVO> tree() {
		List<WfCategoryVO> list = WfCategoryWrapper.build().listVO(this.list(new LambdaQueryWrapper<WfCategory>()
			.orderByAsc(WfCategory::getSort)
			.eq(WfCategory::getStatus, "1")));

		Map<Long, List<WfCategoryVO>> categoryMap = list.stream().collect(Collectors.groupingBy(WfCategoryVO::getPid));

		return getCategoryTree(0L, categoryMap);
	}

	@Override
	public List<WfCategoryVO> allTree() {
		List<WfCategoryVO> list = WfCategoryWrapper.build().listVO(this.list(new LambdaQueryWrapper<WfCategory>()
			.orderByAsc(WfCategory::getSort)));

		Map<Long, List<WfCategoryVO>> categoryMap = list.stream().collect(Collectors.groupingBy(WfCategoryVO::getPid));

		return getCategoryTree(0L, categoryMap);
	}

	private List<WfCategoryVO> getCategoryTree(Long parentId, Map<Long, List<WfCategoryVO>> categoryMap) {
		List<WfCategoryVO> list = new ArrayList<>();
		List<WfCategoryVO> categoryList = categoryMap.get(parentId);
		if (categoryList != null && categoryList.size() > 0) {
			categoryList.forEach(category -> {
				WfCategoryVO vo = new WfCategoryVO();
				List<WfCategoryVO> children = getCategoryTree(category.getId(), categoryMap);
				if (children.size() > 0) {
					vo.setChildren(children);
				}
				vo.setId(category.getId());
				vo.setPid(parentId);
				vo.setName(category.getName());
				vo.setSort(category.getSort());
				vo.setStatus(category.getStatus());
				list.add(vo);
			});
		}
		return list;
	}

}
