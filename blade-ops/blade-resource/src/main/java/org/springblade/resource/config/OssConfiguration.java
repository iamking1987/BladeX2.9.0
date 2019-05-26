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
package org.springblade.resource.config;

import lombok.AllArgsConstructor;
import org.springblade.core.minio.rule.BladeMinioRule;
import org.springblade.core.oss.rule.OssRule;
import org.springblade.resource.builder.OssBuilder;
import org.springblade.resource.mapper.OssMapper;
import org.springblade.resource.props.OssProperties;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Oss配置类
 *
 * @author Chill
 */
@Configuration
@AllArgsConstructor
@EnableConfigurationProperties(OssProperties.class)
public class OssConfiguration {

	private OssProperties ossProperties;

	private OssMapper ossMapper;

	@Bean
	@ConditionalOnMissingBean(OssRule.class)
	public OssRule ossRule() {
		return new BladeMinioRule(true);
	}

	@Bean
	@ConditionalOnBean(OssRule.class)
	public OssBuilder ossStorage(OssRule ossRule) {
		return new OssBuilder(ossProperties, ossMapper, ossRule);
	}

}
