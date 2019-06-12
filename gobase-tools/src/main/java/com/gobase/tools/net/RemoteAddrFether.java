package com.gobase.tools.net;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.regex.Pattern;

/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
public class RemoteAddrFether {

    /**
     * 取客户端的真实IP，考虑了反向代理等因素的干扰
     *
     * @param request
     * @return
     */
    public static String getRemoteAddr(HttpServletRequest request) {
        String ip;
        Enumeration<String> xffs = request.getHeaders("X-Forwarded-For");
        if (xffs.hasMoreElements()) {
            String xff = xffs.nextElement();
            ip = resolveClientIPFromXFF(xff);
            if (isValidIP(ip)) {
                return ip;
            }
        }
        ip = request.getHeader("Proxy-Client-IP");
        if (isValidIP(ip)) {
            return ip;
        }
        ip = request.getHeader("WL-Proxy-Client-IP");
        if (isValidIP(ip)) {
            return ip;
        }
        return request.getRemoteAddr();
    }

    /**
     * 从X-Forwarded-For头部中获取客户端的真实IP。 X-Forwarded-For并不是RFC定义的标准HTTP请求Header
     * ，可以参考http://en.wikipedia.org/wiki/X-Forwarded-For
     *
     * @param xff
     *            X-Forwarded-For头部的值
     * @return 如果能够解析到client IP，则返回表示该IP的字符串，否则返回null
     */
    private static String resolveClientIPFromXFF(String xff) {
        if (xff == null || xff.length() == 0) {
            return null;
        }
        String[] ss = xff.split(",");
        for (int i = ss.length - 1; i >= 0; i--) {// x-forward-for链反向遍历
            String ip = ss[i].trim();
            if (isValidIP(ip)) { // 判断ip是否合法，是否是公司机房ip
                return ip;
            }
        }
        // 如果反向遍历没有找到格式正确的外网IP，那就正向遍历找到第一个格式合法的IP
        for (int i = 0; i < ss.length; i++) {
            String ip = ss[i].trim();
            if (isValidIP(ip)) {
                return ip;
            }
        }
        return null;
    }

    private static final Pattern ipPattern = Pattern
            .compile("([0-9]{1,3}\\.){3}[0-9]{1,3}");

    private static boolean isValidIP(String ip) {
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            return false;
        }
        return ipPattern.matcher(ip).matches();
    }

}

