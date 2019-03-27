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
package org.springblade.auth.utils;

import lombok.SneakyThrows;
import org.springblade.core.launch.constant.TokenConstant;
import org.springblade.core.tool.utils.Charsets;
import org.springframework.security.authentication.BadCredentialsException;

import java.util.Base64;
import java.util.Calendar;

/**
 * 认证工具类
 *
 * @author Chill
 */
public class TokenUtil {

	public final static String AVATAR = TokenConstant.AVATAR;
	public final static String ACCOUNT = TokenConstant.ACCOUNT;
	public final static String USER_ID = TokenConstant.USER_ID;
	public final static String ROLE_ID = TokenConstant.ROLE_ID;
	public final static String USER_NAME = TokenConstant.USER_NAME;
	public final static String ROLE_NAME = TokenConstant.ROLE_NAME;
	public final static String TENANT_CODE = TokenConstant.TENANT_CODE;
	public final static String LICENSE = TokenConstant.LICENSE;
	public final static String LICENSE_NAME = TokenConstant.LICENSE_NAME;


	public final static String TENANT_HEADER_KEY = "Tenant-Code";
	public final static String DEFAULT_TENANT_CODE = "000000";
	public final static String USER_NOT_FOUND = "用户名或密码错误";
	public final static String HEADER_KEY = "Authorization";
	public final static String HEADER_PREFIX = "Basic ";
	public final static String DEFAULT_AVATAR = "https://gw.alipayobjects.com/zos/rmsportal/BiazfanxmamNRoxxVxka.png";
	/**
	 * 解码
	 *
	 * @param header
	 */
	@SneakyThrows
	public static String[] extractAndDecodeHeader(String header) {
		byte[] base64Token = header.substring(6).getBytes(Charsets.UTF_8_NAME);

		byte[] decoded;
		try {
			decoded = Base64.getDecoder().decode(base64Token);
		} catch (IllegalArgumentException var7) {
			throw new BadCredentialsException("Failed to decode basic authentication token");
		}

		String token = new String(decoded, Charsets.UTF_8_NAME);
		int index = token.indexOf(":");
		if (index == -1) {
			throw new BadCredentialsException("Invalid basic authentication token");
		} else {
			return new String[]{token.substring(0, index), token.substring(index + 1)};
		}
	}

	/**
	 * 获取token过期时间(次日凌晨3点)
	 *
	 * @return expire
	 */
	public static int getTokenValiditySecond() {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DAY_OF_YEAR, 1);
		cal.set(Calendar.HOUR_OF_DAY, 3);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.MILLISECOND, 0);
		return (int) (cal.getTimeInMillis() - System.currentTimeMillis()) / 1000;
	}

	/**
	 * 获取refreshToken过期时间
	 * @return expire
	 */
	public static int getRefreshTokenValiditySeconds() {
		return 60 * 60 * 24 * 15;
	}

}