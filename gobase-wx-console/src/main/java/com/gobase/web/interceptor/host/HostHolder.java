package com.gobase.web.interceptor.host;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.gobase.service.dto.user.HostUser;
import com.gobase.web.constant.GobaseWXConstant;

/**
 * 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
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
		return null==user?1:user.getUserId();
	}

	public void setUser(HostUser user) {
		if (user != null) {
			request.setAttribute(GobaseWXConstant.WX_USER_REQUEST_ATTR, user);
		}
	}
}
