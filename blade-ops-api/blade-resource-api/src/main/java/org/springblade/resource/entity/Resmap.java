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
package org.springblade.resource.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springblade.core.tenant.mp.TenantEntity;

/**
 * 附件表实体类
 *
 * @author Chill
 */
@Data
@TableName("blade_resmap")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "Resmap对象", description = "资源名称映射表")
public class Resmap extends TenantEntity {
//public class Resmap  {

	 /*
	 * 附件名称
	 */
	@ApiModelProperty(value = "附件前台link")
	private String newLink;
	/**
	 * 附件原名
	 */
	@ApiModelProperty(value = "附件的OSSUrl")
	private String primitiveLink;



}
