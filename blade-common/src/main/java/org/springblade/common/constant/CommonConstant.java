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
package org.springblade.common.constant;

/**
 * 通用常量
 *
 * @author Chill
 */
public interface CommonConstant {

	/**
	 * nacos dev 地址
	 */
	String NACOS_DEV_ADDR = "127.0.0.1:8848";

	/**
	 * nacos prod 地址
	 */
	String NACOS_PROD_ADDR = "172.30.0.48:8848";

	/**
	 * sentinel dev 地址
	 */
	String SENTINEL_DEV_ADDR = "127.0.0.1:8858";

	/**
	 * sentinel prod 地址
	 */
	String SENTINEL_PROD_ADDR = "172.30.0.58:8858";

	/**
	 * sword 系统名
	 */
	String SWORD_NAME = "sword";

	/**
	 * saber 系统名
	 */
	String SABER_NAME = "saber";

	/**
	 * 顶级父节点id
	 */
	Integer TOP_PARENT_ID = 0;

	/**
	 * 顶级父节点名称
	 */
	String TOP_PARENT_NAME = "顶级";


	/**
	 * 默认密码
	 */
	String DEFAULT_PASSWORD = "123456";

}
