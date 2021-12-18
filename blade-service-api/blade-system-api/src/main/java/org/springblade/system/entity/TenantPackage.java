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
package org.springblade.system.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springblade.core.mp.base.BaseEntity;

/**
 * 租户产品表实体类
 *
 * @author BladeX
 */
@Data
@TableName("blade_tenant_package")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "TenantPackage对象", description = "租户产品表")
public class TenantPackage extends BaseEntity {

	private static final long serialVersionUID = 1L;

	/**
	 * 产品包名称
	 */
	@ApiModelProperty(value = "产品包名称")
	private String packageName;
	/**
	 * 菜单ID
	 */
	@ApiModelProperty(value = "菜单ID")
	private String menuId;
	/**
	 * 备注
	 */
	@ApiModelProperty(value = "备注")
	private String remark;


}
