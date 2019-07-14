/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: ShopController.java
 * @Package com.gobase.web.controller.shop
 * @date 2019年7月1日 下午4:17:35 
 */
package com.gobase.web.controller.shop;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gobase.component.bean.mall.shop.ShopDO;
import com.gobase.component.home.shop.ShopHome;
import com.gobase.tools.page.PageUtil;
import com.gobase.tools.response.PageContent;
import com.gobase.tools.response.ResultResponse;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 * @param <GoodsCategory>
 */
@RequestMapping("shop")
@RestController
public class ShopController {
	
	@Autowired
	private ShopHome shopHome;
	
	
	/**
	 *@description 查询店铺并查询几张热销商品和统计销量 
	 *@param shopName 店铺名称
	 *@param licenseNo
	 *@param provinceId
	 *@param cityId
	 *@param pfUserId
	 *@param status
	 *@param pageNum
	 *@param pageSize
	 *@url shop/list/shop?pageNum=0&pageSize=10
	 */
	@RequestMapping("/list/shop")
	public ResultResponse<PageContent<ShopDO>> getShopList(String shopName,Integer pageNum,Integer pageSize){
		 Map<String,Object> params = new HashMap<String, Object>();//参数处理容器 params.clear();
		 params.put("shopName",shopName);
//		 params.put("licenseNo", null);
//		 params.put("provinceId", null);
//		 params.put("cityId",null);
//		 params.put("pfUserId",null);
//		 params.put("status",null);
		 params.put("offset",PageUtil.getStart(pageNum, pageSize));
		 params.put("limit",PageUtil.getLimit(pageNum, pageSize));
		 System.out.println(params);
		 PageContent<ShopDO> pageShops = shopHome.pageShops(params);
		return ResultResponse.success(pageShops,"查询所有商品的商家及商家列表成功");
	}
	/**
	 *@description 通过店铺id查询店铺商品分类列表 
	 *@param shopId 店铺Id
	 */
	 @RequestMapping("/list/shopcatrgory")
	 @ResponseBody
	 public ResultResponse<Map<String,Object>> getShopCatrgoryByShopId(Integer shopId){
		 Map<String,Object> res = shopHome.getShopCatrgoryByShopId(shopId);
		 return ResultResponse.success(res,"查询店铺id查询店铺商品分类列表");
	 }
	
}
