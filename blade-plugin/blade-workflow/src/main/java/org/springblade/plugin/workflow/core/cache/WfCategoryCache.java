package org.springblade.plugin.workflow.core.cache;

import org.springblade.core.cache.utils.CacheUtil;
import org.springblade.core.tool.utils.SpringUtil;
import org.springblade.plugin.workflow.design.entity.WfCategory;
import org.springblade.plugin.workflow.design.service.IWfCategoryService;
import org.springblade.plugin.workflow.design.vo.WfCategoryVO;

import java.util.List;

import static org.springblade.plugin.workflow.core.cache.WfCacheConstant.WORKFLOW_CACHE;

/**
 * 流程分类缓存
 *
 * @author ssc
 */
public class WfCategoryCache {

	private static final String WORKFLOW_CATEGORY_CACHE = "category:";
	private static IWfCategoryService wfCategoryService;

	private static IWfCategoryService getWfCategoryService() {
		if (wfCategoryService == null) {
			wfCategoryService = SpringUtil.getBean(IWfCategoryService.class);
		}
		return wfCategoryService;
	}

	public static WfCategory getById(Long id) {
		return CacheUtil.get(WORKFLOW_CACHE, WORKFLOW_CATEGORY_CACHE, id, () -> getWfCategoryService().getById(id));
	}

	public static void removeById(Long id) {
		if (id != null) {
			CacheUtil.evict(WORKFLOW_CACHE, WORKFLOW_CATEGORY_CACHE, id);
		}
	}

	public static List<WfCategoryVO> tree() {
		return CacheUtil.get(WORKFLOW_CACHE, WORKFLOW_CATEGORY_CACHE, "tree", () -> getWfCategoryService().tree());
	}

	public static void removeTreeCache() {
		CacheUtil.evict(WORKFLOW_CACHE, WORKFLOW_CATEGORY_CACHE, "tree");
	}

}
