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
package org.springblade.desk.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.springblade.core.datascope.annotation.DataAuth;
import org.springblade.core.datascope.enums.DataScopeEnum;
import org.springblade.desk.entity.Notice;
import org.springblade.desk.vo.NoticeVO;

import java.util.List;

/**
 * Mapper 接口
 *
 * @author Chill
 */
public interface NoticeMapper extends BaseMapper<Notice> {

	/**
	 * 前N条数据
	 *
	 * @param number 数量
	 * @return List<Notice>
	 */
	List<Notice> topList(Integer number);

	/**
	 * 自定义分页
	 *
	 * @param page   分页
	 * @param notice 实体
	 * @return List<NoticeVO>
	 */
	// @DataAuth(type = DataScopeEnum.OWN_DEPT)  //仅仅本部门数据可见
	//@DataAuth(column = "create_user",type = DataScopeEnum.OWN)  //仅仅数据创建人可见

	//${}中可有userId,deptId roleId tenantId,account userName 注意数组的（${}）写法  在BladeUserDetail中的所有字段都可
	//@DataAuth(type = DataScopeEnum.CUSTOM,value = "where scope.create_user =${userId} or scope.create_dept in (${deptId})")

	List<NoticeVO> selectNoticePage(IPage page, NoticeVO notice);

}
