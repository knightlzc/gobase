package com.gobase.tools.common;

import org.apache.commons.httpclient.*;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URLEncoder;
import java.util.*;

/**
 * 使用HttpClient发送http请求
 *
 * @author xile.su@renren-inc.com
 * <p>
 * 2014年9月19日 下午4:05:07
 */
public class HttpClientUtil {

    private static HttpConnectionManager httpManager;

    private static HttpClient httpClient;

    static {
        try {
            httpManager = new MultiThreadedHttpConnectionManager();
            httpManager.getParams().setDefaultMaxConnectionsPerHost(64); // 最大连接数
            httpManager.getParams().setMaxTotalConnections(1024); // 最大活动连接数
            httpManager.getParams().setConnectionTimeout(5 * 1000); // 连接超时时间
            httpManager.getParams().setSoTimeout(5 * 1000);
            httpClient = new HttpClient(httpManager);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 以Get方法请求,会对参数进行utf-8编码,传入时请勿编码,返回内容最大64K,超过此限制会抛异常.
     *
     * @param url
     * @param params
     * @return
     * @throws IOException
     * @throws org.apache.commons.httpclient.HttpException
     */
    public static String requestByGet(String url, Map<String, String> params)
            throws HttpException, IOException {
        return doRequest(url, params, 0);
    }

    public static String requestByGet(String url, Map<String, String> params, Map<String, String> header)
            throws HttpException, IOException {
        return doRequest(url, params, 0, header);
    }

    public static String requestByGet(String url, Map<String, String> params, String charSet)
            throws HttpException, IOException {
        return doRequest(url, params, 0, charSet);
    }

    /**
     * 以post方法请求,会对参数进行utf-8编码,传入时请勿编码,返回内容最大64K,超过此限制会抛异常.
     *
     * @param url
     * @param params
     * @return
     * @throws IOException
     * @throws org.apache.commons.httpclient.HttpException
     */
    public static String requestByPost(String url, Map<String, String> params)
            throws HttpException, IOException {
        return doRequest(url, params, 1);
    }

    public static String requestByPost(String url, Map<String, String> params, Map<String, String> header)
            throws HttpException, IOException {
        return doRequest(url, params, 1, header);
    }

    /**
     * 以get或者post方法发送请求
     *
     * @param url
     * @param params
     * @param methodType http方法类型,0 Get方法,1 Post方法.不支持其他方法,仅方法内部调用没判断是否既不是0也不是1
     * @return
     * @throws IOException
     * @throws org.apache.commons.httpclient.HttpException
     */
    private static String doRequest(String url, Map<String, String> params,
                                    int methodType) throws HttpException, IOException {
        HttpMethod httpMethod = null;
        try {
            httpMethod = getHttpMethod(url, params, methodType);
            int statusCode = httpClient.executeMethod(httpMethod);
            if (statusCode == HttpURLConnection.HTTP_OK) {
                String response = ((HttpMethodBase) httpMethod)
                        .getResponseBodyAsString();
                return response == null ? "" : response;
            }
        } catch (HttpException e) {
            throw e;
        } catch (IOException e) {
            throw e;
        } finally {
            if (httpMethod != null) {
                httpMethod.releaseConnection();
            }
        }
        return null;
    }

    private static String doRequest(String url, Map<String, String> params,
                                    int methodType, Map<String, String> header) throws HttpException, IOException {
        HttpMethod httpMethod = null;
        try {
            httpMethod = getHttpMethod(url, params, methodType);
            Set<String> keys = header.keySet();
            for (String key : keys) {
                httpMethod.addRequestHeader(key, header.get(key));
            }
            int statusCode = httpClient.executeMethod(httpMethod);
            if (statusCode == HttpURLConnection.HTTP_OK) {
                String response = ((HttpMethodBase) httpMethod)
                        .getResponseBodyAsString();
                return response == null ? "" : response;
            }
        } catch (HttpException e) {
            throw e;
        } catch (IOException e) {
            throw e;
        } finally {
            if (httpMethod != null) {
                httpMethod.releaseConnection();
            }
        }
        return null;
    }

    private static String doRequest(String url, Map<String, String> params,
                                    int methodType, String charSet) throws HttpException, IOException {
        HttpMethod httpMethod = null;
        try {
            httpMethod = getHttpMethod(url, params, methodType, charSet);
            int statusCode = httpClient.executeMethod(httpMethod);
            if (statusCode == HttpURLConnection.HTTP_OK) {
                String response = ((HttpMethodBase) httpMethod)
                        .getResponseBodyAsString();
                return response == null ? "" : response;
            }
        } catch (HttpException e) {
            throw e;
        } catch (IOException e) {
            throw e;
        } finally {
            if (httpMethod != null) {
                httpMethod.releaseConnection();
            }
        }
        return null;
    }

    /**
     * 取得HttpMethod
     *
     * @param url
     * @param params
     * @param methodType 0 get方法，1post方法
     * @return
     * @throws UnsupportedEncodingException
     */
    private static HttpMethod getHttpMethod(String url,
                                            Map<String, String> params, int methodType)
            throws UnsupportedEncodingException {
        HttpMethod httpMethod = null;
        if (methodType == 0) {
            String uri = getEncodeGetUrl(url, params);
            httpMethod = new GetMethod(uri);
        } else if (methodType == 1) {
            if (url.contains("?")) {
                Map<String, String> paramsInUrl = getParamsFromUrl(url);
                if (paramsInUrl != null && paramsInUrl.size() > 0) {
                    params.putAll(paramsInUrl);
                }
                url = url.split("\\?")[0];
            }
            httpMethod = new PostMethod(url);
            RequestEntity requestEntity = new StringRequestEntity(
                    getEncodePostBody(params),
                    "application/x-www-form-urlencoded", "UTF-8");
            ((PostMethod) httpMethod).setRequestEntity(requestEntity);
//			((PostMethod) httpMethod).setRequestBody(getEncodePostBodyNew(params));
        } else {
            return null;
        }
        httpMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,
                new DefaultHttpMethodRetryHandler(3, true));
        httpMethod.getParams().setParameter(
                HttpMethodParams.HTTP_CONTENT_CHARSET, "UTF-8");
        return httpMethod;
    }

    private static HttpMethod getHttpMethod(String url,
                                            Map<String, String> params, int methodType, String charSet)
            throws UnsupportedEncodingException {
        HttpMethod httpMethod = null;
        if (methodType == 0) {
            String uri = getEncodeGetUrl(url, params);
            httpMethod = new GetMethod(uri);
        } else if (methodType == 1) {
            if (url.contains("?")) {
                Map<String, String> paramsInUrl = getParamsFromUrl(url);
                if (paramsInUrl != null && paramsInUrl.size() > 0) {
                    params.putAll(paramsInUrl);
                }
                url = url.split("\\?")[0];
            }
            httpMethod = new PostMethod(url);
            RequestEntity requestEntity = new StringRequestEntity(
                    getEncodePostBody(params),
                    "application/x-www-form-urlencoded", "UTF-8");
            ((PostMethod) httpMethod).setRequestEntity(requestEntity);
        } else {
            return null;
        }
        httpMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,
                new DefaultHttpMethodRetryHandler(3, true));
        httpMethod.getParams().setParameter(
                HttpMethodParams.HTTP_CONTENT_CHARSET, charSet);
        return httpMethod;
    }

    /**
     * 获得url的参数
     *
     * @param url =xxx
     * @return
     */
    public static Map<String, String> getParamsFromUrl(String url) {
        String[] urls = url.split("\\?");
        if (urls.length != 2) {
            return null;
        }
        String urlQuery = urls[1];
        Map<String, String> params = null;
        if (StringUtils.isNotBlank(urlQuery)) {
            params = new HashMap<String, String>();
            String[] param = urlQuery.split("[&]+");
            for (String str : param) {
                String[] kv = str.split("[=]+");
                if (kv.length == 2) {
                    params.put(kv[0].trim(), kv[1].trim());
                }
            }
        }
        return params;
    }

    /**
     * 取得get方法的url并按utf-8编码
     *
     * @param url
     * @param params
     * @return
     */
    public static String getEncodeGetUrl(String url, Map<String, String> params) {
        if (url.contains("?")) {
            Map<String, String> paramsInUrl = getParamsFromUrl(url);
            if (paramsInUrl != null && paramsInUrl.size() > 0) {
                if (params == null || params.size() == 0) {
                    params = paramsInUrl;
                } else {
                    params.putAll(paramsInUrl);
                }
            }
            url = url.split("\\?")[0];
        }
        if (params == null || params.size() == 0) {
            return url;
        }
        StringBuffer sb = new StringBuffer();
        sb.append(url).append("?");
        ;
        for (Map.Entry<String, String> param : params.entrySet()) {
            sb.append(param.getKey()).append("=");
            sb.append(encodeUrl(param.getValue())).append("&");
        }
        sb.deleteCharAt(sb.length() - 1);
        return sb.toString();
    }

    /**
     * 取得请求中的所有参数,并按字母升序排列,适用于GET方法和POST方法
     *
     * @param request
     * @return
     */
    @SuppressWarnings("unchecked")
    public static Map<String, String> getParams(HttpServletRequest request) {
        Map<String, String> params = new TreeMap<String, String>();
        Map<String, String[]> paramMap = request.getParameterMap();
        for (Map.Entry<String, String[]> entry : paramMap.entrySet()) {
            try {
                params.put(entry.getKey(), entry.getValue()[0]);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return params;
    }

    /**
     * 取得post方法的参数,并按utf-8编码
     *
     * @param params
     * @return
     */
    private static String getEncodePostBody(Map<String, String> params) {
//		return "";
        if (params == null || params.size() == 0) {
            return "";
        }
        StringBuffer sb = new StringBuffer();
        for (Map.Entry<String, String> param : params.entrySet()) {
            if (param.getValue() != null) {
                sb.append(param.getKey()).append("=");
                sb.append(encodeUrl(param.getValue())).append("&");
            }
        }
        if (sb.length() > 1) {
            sb.deleteCharAt(sb.length() - 1);
        }
        return sb.toString();
    }

    /**
     * 取得post方法的参数,并按utf-8编码
     *
     * @param params
     * @return
     */
    private static NameValuePair[] getEncodePostBodyNew(Map<String, String> params) {
        if (params == null || params.size() == 0) {
            return null;
        }
        List<NameValuePair> formParams = new ArrayList<NameValuePair>();// 创建参数链表
        if ((params != null) && (params.size() > 0)) {
            for (String str : params.keySet()) {
                formParams.add(new NameValuePair(str, (String) params.get(str)));
            }
        }
        NameValuePair[] pairs = new NameValuePair[formParams.size()];
        for (int i = 0; i < formParams.size(); i++) {
            pairs[i] = formParams.get(i);
        }
        return pairs;
    }

    /**
     * 按utf-8编码字符串
     *
     * @param s
     * @return
     */
    public static String encodeUrl(String s) {
        try {
            s = URLEncoder.encode(s, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return s;
    }

}
