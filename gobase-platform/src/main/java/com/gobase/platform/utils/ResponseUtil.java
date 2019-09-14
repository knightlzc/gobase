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
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.BeanUtils;

import com.gobase.component.bean.mall.goods.GoodsCategory;
import com.gobase.component.bean.mall.pfuser.PfUser;
import com.gobase.platform.controller.goods.response.SelectCategoryResponse;
import com.gobase.platform.controller.user.response.PfUserResponse;
import com.gobase.platform.response.TableResponse;
import com.gobase.tools.date.DateUtils;
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
	
	public static PfUserResponse toPfUserResponse(PfUser pfUser) {
		PfUserResponse response = new PfUserResponse();
		if(null == pfUser) {
			return response;
		}
		BeanUtils.copyProperties(pfUser, response);
		response.setRegisterTime(DateUtils.getDateToString(pfUser.getRegisterTime(), "yyyy-MM-dd HH:mm:ss"));
		return response;
	}
	
	public static List<SelectCategoryResponse> toSelectCategoryResponse(List<GoodsCategory> categorys) {
		List<SelectCategoryResponse> responses = new ArrayList<>();
		if(CollectionUtils.isEmpty(categorys)) {
			return responses;
		}
		for (GoodsCategory goodsCategory : categorys) {
			SelectCategoryResponse response = new SelectCategoryResponse();
			BeanUtils.copyProperties(goodsCategory, response);
//			if(response.getCode().equals(selectCode)) {
//				response.setSelected(1);
//			}
			responses.add(response);
		}
		return responses;
	}
}
