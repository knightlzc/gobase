package com.gobase.web.interceptor.host;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.gobase.service.dto.user.HostUser;
import com.gobase.web.constant.GobaseWXConstant;

/**
 * @author YanFei
 * @version 创建时间：2018年7月11日 下午12:09:10 用户信息载体
 */
@Component
@Scope("prototype")
public class HostHolder {
	
	@Autowired
	private HttpServletRequest request;

	public HostUser getUser() {
		HostUser user = (HostUser) request.getAttribute(GobaseWXConstant.WX_USER_REQUEST_ATTR);
		return user;
	}
	public int getUserId() {
		HostUser user = (HostUser) request.getAttribute(GobaseWXConstant.WX_USER_REQUEST_ATTR);
		return null==user?0:user.getUserId();
	}

	public void setUser(HostUser user) {
		if (user != null) {
			request.setAttribute(GobaseWXConstant.WX_USER_REQUEST_ATTR, user);
		}
	}
}
