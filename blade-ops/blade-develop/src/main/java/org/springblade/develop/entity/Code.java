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
package org.springblade.develop.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * 实体类
 *
 * @author Chill
 * @since 2018-12-24
 */
@Data
@TableName("blade_code")
@ApiModel(value = "Code对象", description = "Code对象")
public class Code implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@ApiModelProperty(value = "主键")
	@TableId(value = "id", type = IdType.AUTO)
	private Integer id;

	/**
	 * 模块名称
	 */
	@ApiModelProperty(value = "服务名称")
	private String serviceName;

	/**
	 * 模块名称
	 */
	@ApiModelProperty(value = "模块名称")
	private String codeName;

	/**
	 * 表名
	 */
	@ApiModelProperty(value = "表名")
	private String tableName;

	/**
	 * 实体名
	 */
	@ApiModelProperty(value = "表前缀")
	private String tablePrefix;

	/**
	 * 主键名
	 */
	@ApiModelProperty(value = "主键名")
	private String pkName;

	/**
	 * 后端包名
	 */
	@ApiModelProperty(value = "后端包名")
	private String packageName;

	/**
	 * 后端路径
	 */
	@ApiModelProperty(value = "后端路径")
	private String apiPath;

	/**
	 * 前端路径
	 */
	@ApiModelProperty(value = "前端路径")
	private String webPath;

	/**
	 * 是否已删除
	 */
	@TableLogic
	@ApiModelProperty(value = "是否已删除")
	private Integer isDeleted;


}
