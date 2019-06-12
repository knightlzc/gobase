package com.gobase.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.gobase.service.dto.user.HostUser;
import com.gobase.web.interceptor.host.HostHolder;

/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:登录过滤器  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@Component
public class LoginInterceptor implements HandlerInterceptor {

	private Logger logger = Logger.getLogger(getClass());

	@Autowired
	private HostHolder hostHolder;


	/**
	 * 在整个请求结束之后被调用，也就是在DispatcherServlet 渲染了对应的视图之后执行（主要是用于进行资源清理工作）
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

	/**
	 * 请求处理之后进行调用，但是在视图被渲染之前（Controller方法调用之后）
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
//		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	/**
	 * 在请求处理之前进行调用（Controller方法调用之前）
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HostUser user = hostHolder.getUser();
		if (user != null) {
			return true;
		}
//		boolean validateBoolean = validateTicket(request, response);
//		HandlerMethod handlerMethod = (HandlerMethod) handler;
//		// 获取类上的注解
//		MallLoginRequired isLoginType = handlerMethod.getBean().getClass().getAnnotation(MallLoginRequired.class);
//		// 获取方法上的注解
//		MallLoginRequired isLoginMethod = handlerMethod.getMethodAnnotation(MallLoginRequired.class);
//		if (isLoginType != null || isLoginMethod != null) {
//			if (!validateBoolean) {
//				throw new LoginException("请登录");
//			}
//			user = hostHolder.getUser();
//			if (user == null) {
//				throw new LoginException("请登录");
//			} else if (user.getStatus() == UserDTO.STATUS_DISABLED) {
//				throw new BusinessException("该帐户已被禁用");
//			} else if (user.getStationType() == BannedRecordDTO.BANNED_STATUS) {
//				throw new BusinessException("您的帐户已被封禁");
//			}
//		}
		// 没有注解就不判断
		return true;
	}

	/**
	 * <br/>Description:验票
	 * <p>Author:zcliu/刘子萃</p>
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public boolean validateTicket(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//TODO 验票
		return true;
	}
}
