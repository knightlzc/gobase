package com.gobase.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.gobase.web.interceptor.host.HostHolder;
import com.gobase.web.interceptor.service.AccessLog4jLogger;

/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@Component
public class AccessLogInterceptor implements HandlerInterceptor{

	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private HostHolder hostHolder;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		try {
			
			AccessLog4jLogger.getInstance().log(request,hostHolder.getUser());
		} catch (Exception e) {
			logger.error("access log exception", e);
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
}
