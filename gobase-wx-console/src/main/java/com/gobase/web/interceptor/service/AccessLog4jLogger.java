package com.gobase.web.interceptor.service;


import java.net.URLDecoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.gobase.service.dto.user.HostUser;
import com.gobase.tools.net.RemoteAddrFether;

/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description: 访问日志 </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
public class AccessLog4jLogger {

	private static AccessLog4jLogger instance = new AccessLog4jLogger();
	private static Log logger = LogFactory.getLog("mall_access_logger");

	public static AccessLog4jLogger getInstance() {
		return instance;
	}

	public void log(HttpServletRequest request,HostUser user) {
		StringBuffer sb = new StringBuffer();
		if (logger.isInfoEnabled()) {
			String url = "";
			try {
				url = getUrlWithQueryString(request);
			} catch (Exception e) {
			}
			String ip = RemoteAddrFether.getRemoteAddr(request);
			String ref = request.getHeader("Referer") == null ? "" : request.getHeader("Referer");
			String ua = request.getHeader("user-agent") == null ? "" : request.getHeader("user-agent");
			String os = request.getHeader("os") == null ? "" : request.getHeader("os");
			String version = request.getHeader("version") == null ? "" : request.getHeader("version");
			String versionCode = request.getHeader("versionCode") == null ? "" : request.getHeader("versionCode");
			String clientDeviceId = request.getHeader("clientDeviceId") == null ? ""
					: request.getHeader("clientDeviceId");
			String cookie = request.getHeader("Cookie") == null ? "" : request.getHeader("Cookie");
			String channel = request.getHeader("channel") == null ? "" : request.getHeader("channel");
			String imei = request.getHeader("imei") == null ? "" : request.getHeader("imei");
			String mac = request.getHeader("mac") == null ? "" : request.getHeader("mac");
			String androidid = request.getHeader("androidid") == null ? "" : request.getHeader("androidid");
			String idfa = request.getHeader("idfa") == null ? "" : request.getHeader("idfa");
			String appName = request.getHeader("appName") == null ? "" : request.getHeader("appName");
			String systemVersion = request.getHeader("systemVersion") == null ? ""
					: request.getHeader("systemVersion");
			String modelNo = request.getHeader("modelNo") == null ? "" : request.getHeader("modelNo");
			String manufacturer = request.getHeader("manufacturer") == null ? ""
					: request.getHeader("manufacturer");
			String origin = request.getParameter("origin") == null ? "" : request.getParameter("origin");
			String wxOpenId = request.getHeader("wxOpenId") == null ? ""
					: request.getHeader("wxOpenId");
			String pageName = request.getHeader("pageName") == null ? ""
					: request.getHeader("pageName");
			String position = "";
			try {
				position = request.getHeader("position") == null ? ""
						: URLDecoder.decode(request.getHeader("position"), "utf-8");
			} catch (Exception e) {
				e.printStackTrace();
			}
//			sb.append(logTimeStr);
//			sb.append("|");
			// 用户id
			sb.append(null == user?0: user.getUserId());
			sb.append("|");
			sb.append(ip);
			sb.append("|");
			sb.append(url);
			sb.append("|");
			sb.append(ref);
			sb.append("|");
			sb.append(ua);
			sb.append("|");
			sb.append(os);
			sb.append("|");
			sb.append(version);
			sb.append("|");
			sb.append(versionCode);
			sb.append("|");
			sb.append(clientDeviceId);
			sb.append("|");
			sb.append(cookie);
			sb.append("|");
			sb.append(channel);
			sb.append("|");
			sb.append(imei);
			sb.append("|");
			sb.append(mac);
			sb.append("|");
			sb.append(androidid);
			sb.append("|");
			sb.append(idfa);
			sb.append("|");
			sb.append(appName);
			sb.append("|");
			sb.append(systemVersion);
			sb.append("|");
			sb.append(modelNo);
			sb.append("|");
			sb.append(manufacturer);
			sb.append("|");
			sb.append(origin);
			sb.append("|");
			sb.append(wxOpenId);
			sb.append("|");
			sb.append(pageName);
			sb.append("|");
			sb.append(position);
			logger.info(sb.toString());
		}
	}
	
	@SuppressWarnings(value={"unchecked"}) 
	public String getUrlWithQueryString(HttpServletRequest request) {
		StringBuffer url = request.getRequestURL();
		Map<String, String[]> params = request.getParameterMap();  
        String queryString = "";  
        String method=request.getMethod().toLowerCase();
        if(method!=null && method.equals("get")){
            queryString = request.getQueryString();
    		if (queryString != null && queryString.length() > 0) {
    			url.append('?');
    			url.append(queryString);
    		}
        	return url.toString();
        }
        for (String key : params.keySet()) {  
            String[] values = params.get(key);  
            for (int i = 0; i < values.length; i++) {  
                String value = values[i];  
                queryString += key + "=" + value + "&";  
            }  
        }  
        // 去掉最后一个空格  
        if(params.keySet().size() > 0){
            queryString = queryString.substring(0, queryString.length() - 1);  
        }
        if (queryString != null && queryString.length() > 0) {
			url.append('?');
			url.append(queryString);
		}
		return url.toString();
	}
	

}
