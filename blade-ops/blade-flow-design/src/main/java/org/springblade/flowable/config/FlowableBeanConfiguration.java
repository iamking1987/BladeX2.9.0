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
package org.springblade.flowable.config;

import liquibase.Liquibase;
import liquibase.database.Database;
import liquibase.database.DatabaseConnection;
import liquibase.database.DatabaseFactory;
import liquibase.database.jvm.JdbcConnection;
import liquibase.resource.ClassLoaderResourceAccessor;
import org.flowable.ui.modeler.properties.FlowableModelerAppProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

/**
 * flowable实例配置
 *
 * @author Chill
 */
@Configuration
public class FlowableBeanConfiguration {

	private static final String LIQUIBASE_CHANGELOG_PREFIX = "ACT_DE_";

	@Bean
	public FlowableModelerAppProperties flowableModelerAppProperties() {
		return new FlowableModelerAppProperties();
	}

	@Bean
	public Liquibase liquibase(DataSource dataSource) {
		try {
			DatabaseConnection connection = new JdbcConnection(dataSource.getConnection());
			Database database = DatabaseFactory.getInstance().findCorrectDatabaseImplementation(connection);
			database.setDatabaseChangeLogTableName(LIQUIBASE_CHANGELOG_PREFIX + database.getDatabaseChangeLogTableName());
			database.setDatabaseChangeLogLockTableName(LIQUIBASE_CHANGELOG_PREFIX + database.getDatabaseChangeLogLockTableName());
			Liquibase liquibase = new Liquibase("META-INF/liquibase/flowable-modeler-app-db-changelog.xml", new ClassLoaderResourceAccessor(), database);
			liquibase.update("flowable");
			return liquibase;
		} catch (Exception e) {
			throw new RuntimeException("Error creating liquibase database", e);
		}
	}
}
