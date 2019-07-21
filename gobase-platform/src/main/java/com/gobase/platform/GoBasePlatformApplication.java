package com.gobase.platform;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.data.mongo.MongoDataAutoConfiguration;
import org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication(exclude = { MongoAutoConfiguration.class, MongoDataAutoConfiguration.class})
//@EnableAutoConfiguration
@ComponentScan(basePackages = {"com.gobase"})
public class GoBasePlatformApplication extends SpringBootServletInitializer{
	@Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(GoBasePlatformApplication.class);
    }
	
	public static void main(String[] args) {
		try {
			SpringApplication.run(GoBasePlatformApplication.class, args);
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}
}
