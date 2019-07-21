package com.gobase.platform.conf;

import com.gobase.component.constant.DataSourceConstant;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import javax.sql.DataSource;

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