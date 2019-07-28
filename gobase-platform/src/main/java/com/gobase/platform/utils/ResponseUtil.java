/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: ResponseUtil.java
 * @Package com.gobase.platform.utils
 * @date 2019年7月26日 下午7:17:38 
 */
package com.gobase.platform.utils;

import java.util.ArrayList;

import com.gobase.platform.response.TableResponse;
import com.gobase.tools.response.PageContent;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */

public class ResponseUtil {

	public static <T> TableResponse<T> toTableResponse(PageContent<T> page){
		if(null == page) {
			return TableResponse.suc(0, new ArrayList<>());
		}
		return TableResponse.suc(page.getTotalNum(), page.getContent());
	}
}
