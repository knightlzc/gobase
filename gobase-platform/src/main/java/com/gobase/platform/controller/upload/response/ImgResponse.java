/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: ImgResponse.java
 * @Package com.gobase.web.controller.upload.response
 * @date 2019年7月20日 下午3:05:01 
 */
package com.gobase.platform.controller.upload.response;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */

public class ImgResponse {
	
	public ImgResponse() {}
	
	public ImgResponse(String url) {
		this.url = url;
	}

	private String url;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}
