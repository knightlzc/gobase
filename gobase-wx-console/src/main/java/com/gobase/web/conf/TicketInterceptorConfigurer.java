package com.gobase.web.conf;


import com.gobase.web.interceptor.TicketValidateInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

/**
 * @author mm.sun
 * @date 2019/07/17 7:40
 */
@Configuration
public class TicketInterceptorConfigurer extends WebMvcConfigurationSupport {

    @Autowired
    private TicketValidateInterceptor ticketValidateInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 可添加多个，这里选择拦截所有请求地址，进入后判断是否有加注解即可
        registry.addInterceptor(ticketValidateInterceptor).addPathPatterns("/**");
    }

}
