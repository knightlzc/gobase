package com.gobase.web.conf;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import com.gobase.component.constant.DataSourceConstant;

@Configuration
//@EnableAutoConfiguration
//@EnableTransactionManagement()
public class DataSourceConfig {
	
	
	@Bean(name = DataSourceConstant.MALL_DATASOURCE)
	@Primary
    @ConfigurationProperties("datasource.mall")
    public DataSource firstDataSource() {
		return mallDataSourceProperties().initializeDataSourceBuilder().build();
    }
	
	@Bean
	@Primary
    @ConfigurationProperties("datasource.mall")
    public DataSourceProperties mallDataSourceProperties() {
        return new DataSourceProperties();
    }
	
	
}