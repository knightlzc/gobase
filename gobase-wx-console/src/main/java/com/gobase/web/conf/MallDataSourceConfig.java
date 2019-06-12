package com.gobase.web.conf;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Company: 人人公司  http://www.renren-inc.com</p> 
 * <p>Description: 多数据源配置 </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@Configuration  
@EnableTransactionManagement
@MapperScan(basePackages = {"com.gobase.component.dao.mall"},sqlSessionFactoryRef = "mallSqlSessionFactory")
public class MallDataSourceConfig {
	
	@Autowired
	@Qualifier("mallDataSource")
    private DataSource mallDataSource;

	@Bean(name="mallSqlSessionFactory")
    public SqlSessionFactory userSqlSessionFactory() throws Exception {
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(mallDataSource); 
        //添加XML目录
        ResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        try {
            bean.setMapperLocations(resolver.getResources("classpath*:com/gobase/component/dao/mall/**/*Mapper.xml"));
            return bean.getObject();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
    
    @Bean
    public SqlSessionTemplate userSqlSessionTemplate(@Qualifier("mallSqlSessionFactory") SqlSessionFactory sqlSessionFactory) throws Exception {
        SqlSessionTemplate template = new SqlSessionTemplate(sqlSessionFactory); // 使用上面配置的Factory
        return template;
    }


}