/*
 *      Copyright (c) 2018-2028, Chill Zhuang All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions are met:
 *
 *  Redistributions of source code must retain the above copyright notice,
 *  this list of conditions and the following disclaimer.
 *  Redistributions in binary form must reproduce the above copyright
 *  notice, this list of conditions and the following disclaimer in the
 *  documentation and/or other materials provided with the distribution.
 *  Neither the name of the dreamlu.net developer nor the names of its
 *  contributors may be used to endorse or promote products derived from
 *  this software without specific prior written permission.
 *  Author: Chill 庄骞 (smallchill@163.com)
 */
package org.springblade.system.wrapper;

import lombok.AllArgsConstructor;
import org.springblade.common.constant.CommonConstant;
import org.springblade.core.mp.support.BaseEntityWrapper;
import org.springblade.core.tool.api.R;
import org.springblade.core.tool.node.ForestNodeMerger;
import org.springblade.core.tool.utils.BeanUtil;
import org.springblade.core.tool.utils.Func;
import org.springblade.system.entity.Menu;
import org.springblade.system.feign.IDictClient;
import org.springblade.system.service.IMenuService;
import org.springblade.system.vo.MenuVO;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 包装类,返回视图层所需的字段
 *
 * @author Chill
 */
@AllArgsConstructor
public class MenuWrapper extends BaseEntityWrapper<Menu, MenuVO> {

	private IMenuService menuService;

	private IDictClient dictClient;

	public MenuWrapper() {
	}

	@Override
	public MenuVO entityVO(Menu menu) {
		MenuVO menuVO = BeanUtil.copy(menu, MenuVO.class);
		if (Func.equals(menu.getParentId(), CommonConstant.TOP_PARENT_ID)) {
			menuVO.setParentName(CommonConstant.TOP_PARENT_NAME);
		} else {
			Menu parent = menuService.getById(menu.getParentId());
			menuVO.setParentName(parent.getName());
		}
		R<String> d1 = dictClient.getValue("menu_category", Func.toInt(menuVO.getCategory()));
		R<String> d2 = dictClient.getValue("button_func", Func.toInt(menuVO.getAction()));
		R<String> d3 = dictClient.getValue("yes_no", Func.toInt(menuVO.getIsOpen()));
		if (d1.isSuccess()) {
			menuVO.setCategoryName(d1.getData());
		}
		if (d2.isSuccess()) {
			menuVO.setActionName(d2.getData());
		}
		if (d3.isSuccess()) {
			menuVO.setIsOpenName(d3.getData());
		}
		return menuVO;
	}


	public List<MenuVO> listNodeVO(List<Menu> list) {
		List<MenuVO> collect = list.stream().map(menu -> BeanUtil.copy(menu, MenuVO.class)).collect(Collectors.toList());
		return ForestNodeMerger.merge(collect);
	}

}
