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
package org.springblade.gateway.filter;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.jsonwebtoken.Claims;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springblade.core.jwt.JwtUtil;
import org.springblade.core.jwt.props.JwtProperties;
import org.springblade.core.launch.constant.TokenConstant;
import org.springblade.gateway.props.AuthProperties;
import org.springblade.gateway.provider.AuthProvider;
import org.springblade.gateway.provider.RequestProvider;
import org.springblade.gateway.provider.ResponseProvider;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.nio.charset.StandardCharsets;

/**
 * 鉴权认证
 *
 * @author Chill
 */
@Slf4j
@Component
@AllArgsConstructor
public class AuthFilter implements GlobalFilter, Ordered {
	private final AuthProperties authProperties;
	private final ObjectMapper objectMapper;
	private final JwtProperties jwtProperties;

	@Override
	public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
		//校验 Token 放行
		String originalRequestUrl = RequestProvider.getOriginalRequestUrl(exchange);
		String path = exchange.getRequest().getURI().getPath();
		if (isSkip(path) || isSkip(originalRequestUrl)) {
			return chain.filter(exchange);
		}
		//校验 Token 合法性
		ServerHttpResponse resp = exchange.getResponse();
		String headerToken = exchange.getRequest().getHeaders().getFirst(AuthProvider.AUTH_KEY);
		String paramToken = exchange.getRequest().getQueryParams().getFirst(AuthProvider.AUTH_KEY);
		if (StringUtils.isBlank(headerToken) && StringUtils.isBlank(paramToken)) {
			return unAuth(resp, "缺失令牌,鉴权失败");
		}
		String auth = StringUtils.isBlank(headerToken) ? paramToken : headerToken;
		String token = JwtUtil.getToken(auth);
		Claims claims = JwtUtil.parseJWT(token);
		if (token == null || claims == null) {
			return unAuth(resp, "请求未授权");
		}
		//判断 Token 状态
		if (jwtProperties.getState()) {
			String tenantId = String.valueOf(claims.get(TokenConstant.TENANT_ID));
			String userId = String.valueOf(claims.get(TokenConstant.USER_ID));
			String accessToken = JwtUtil.getAccessToken(tenantId, userId, token);
			if (!token.equalsIgnoreCase(accessToken)) {
				return unAuth(resp, "令牌已失效");
			}
		}
		return chain.filter(exchange);
	}

	private boolean isSkip(String path) {
		return AuthProvider.getDefaultSkipUrl().stream().map(url -> url.replace(AuthProvider.TARGET, AuthProvider.REPLACEMENT)).anyMatch(path::startsWith)
			|| authProperties.getSkipUrl().stream().map(url -> url.replace(AuthProvider.TARGET, AuthProvider.REPLACEMENT)).anyMatch(path::startsWith);
	}

	private Mono<Void> unAuth(ServerHttpResponse resp, String msg) {
		resp.setStatusCode(HttpStatus.UNAUTHORIZED);
		resp.getHeaders().add("Content-Type", "application/json;charset=UTF-8");
		String result = "";
		try {
			result = objectMapper.writeValueAsString(ResponseProvider.unAuth(msg));
		} catch (JsonProcessingException e) {
			log.error(e.getMessage(), e);
		}
		DataBuffer buffer = resp.bufferFactory().wrap(result.getBytes(StandardCharsets.UTF_8));
		return resp.writeWith(Flux.just(buffer));
	}


	@Override
	public int getOrder() {
		return -100;
	}

}
