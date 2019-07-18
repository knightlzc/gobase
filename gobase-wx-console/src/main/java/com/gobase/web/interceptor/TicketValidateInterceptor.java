package com.gobase.web.interceptor;


import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.alibaba.fastjson.JSONObject;
import com.gobase.component.annotation.IgnoreToken;
import com.gobase.component.constant.GoUserConstant;
import com.gobase.service.dto.user.HostUser;
import com.gobase.tools.redis.JedisUtils;
import com.gobase.tools.response.ResultResponse;
import com.gobase.web.interceptor.host.HostHolder;

/**
 * @author mm.sun
 * @date 2019/07/17 7:20
 */

@Component
public class TicketValidateInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private HostHolder hostHolder;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler instanceof HandlerMethod) {
            Method method = ((HandlerMethod) handler).getMethod();
            // 获取方法上的注解
            IgnoreToken ignoreToken = method.getAnnotation(IgnoreToken.class);
            // 如果方法上的注解为空 则获取类的注解
            if (ignoreToken == null) {
                ignoreToken = method.getDeclaringClass().getAnnotation(IgnoreToken.class);
            }
            if (ignoreToken != null) {
                return true;
            }
            String ticket = getTicket(request);
            if (StringUtils.isBlank(ticket)) {
                returnJson(response, JSONObject.toJSONString(ResultResponse.fail("重新登录", GoUserConstant.RE_LOGIN + "")));
                return false;
            }
            HostUser user = (HostUser) JedisUtils.getObject(GoUserConstant.TICKET_HEADER_KEY_PREFIX + ticket);
            if (user == null) {
                returnJson(response, JSONObject.toJSONString(ResultResponse.fail("重新登录", GoUserConstant.RE_LOGIN + "")));
                return false;
            } else {
                hostHolder.setUser(user);
                return true;
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


    private void returnJson(HttpServletResponse response, String json) throws Exception {
        PrintWriter writer = null;
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        try {
            writer = response.getWriter();
            writer.print(json);

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (writer != null)
                writer.close();
        }
    }
}
