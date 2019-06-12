package com.gobase.web.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.gobase.web.interceptor.AccessLogInterceptor;
import com.gobase.web.interceptor.LoginInterceptor;


/**
 * @author YanFei
 * @version 创建时间：2018年7月11日 下午2:42:55 类说明
 */
@Configuration
public class IntercetorConfig implements WebMvcConfigurer {

	@Bean
	LoginInterceptor loginInterceptor() {
		return new LoginInterceptor();
	}
	
	@Bean
	AccessLogInterceptor accessLogInterceptor() {
		return new AccessLogInterceptor();
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loginInterceptor()).addPathPatterns("/**").excludePathPatterns("/**/*.html");
		registry.addInterceptor(accessLogInterceptor()).addPathPatterns("/**");
		// 设置拦截路径
		// 设置不拦截路径
		/*interceptorRegistration.excludePathPatterns("swagger-ui.html", "/swagger-resources", "/v2/api-docs",
				"/configuration/**", "login.html", "/store/add", "/login", "/error", "/address/**", "/druid/**");*/
	}
	
//	@Override
//	public void addResourceHandlers(ResourceHandlerRegistry registry){
//	    registry.addResourceHandler("/**/*.html").addResourceLocations("classpath:/static/");
//	}

}
