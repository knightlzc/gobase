package com.gobase.web.interceptor;


import com.alibaba.fastjson.JSONObject;
import com.gobase.component.annotation.IgnoreToken;
import com.gobase.component.constant.GoUserConstant;
import org.apache.commons.lang.StringUtils;
import org.springframework.core.annotation.AnnotatedElementUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;

/**
 * @author mm.sun
 * @date 2019/07/17 7:20
 */

@Component
public class TicketValidateInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler instanceof HandlerMethod) {
            Method method = ((HandlerMethod) handler).getMethod();
            //判断该方法/类是否被@IgnoreToken注解修饰
            if (method.isAnnotationPresent(IgnoreToken.class)) {
                return true;
            }
            IgnoreToken ignoreToken = method.getAnnotation(IgnoreToken.class);
            if (ignoreToken != null) {
                return true;
            }
            String ticket = getTicket(request);
            if (StringUtils.isBlank(ticket)) {
                return false;
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        super.afterCompletion(request, response, handler, ex);
    }

    @Override
    public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        super.afterConcurrentHandlingStarted(request, response, handler);
    }

    private String getTicket(HttpServletRequest request) {
        String ticket = request.getHeader(GoUserConstant.Go_USER_REQUEST_ATTR);
        if (StringUtils.isBlank(ticket)) {
            if (request.getCookies() != null && request.getCookies().length > 0) {
                for (Cookie cookie : request.getCookies()) {
                    if (cookie.getName().equals(GoUserConstant.Go_USER_REQUEST_ATTR)) {
                        System.out.println("value: " + cookie.getValue());
                        ticket = cookie.getValue();
                        break;
                    }
                }
            }
        }
        return ticket;
    }

}
