/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: ShopController.java
 * @Package com.gobase.web.controller.shop
 * @date 2019年7月1日 下午4:17:35 
 */
package com.gobase.web.controller.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gobase.component.bean.mall.goods.GoodsDO;
import com.gobase.component.home.goods.GoodsHome;
import com.gobase.tools.response.ResultResponse;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@RequestMapping("shop")
@RestController
public class ShopController {
	
	@Autowired
	private GoodsHome goodsHome;
	/**
	 *@description 查询果蔬食品/商家入驻列表
	 */
	@RequestMapping("/list/shop")
	public ResultResponse<List<GoodsDO>> getShopList(Integer shopId){
		List<GoodsDO> listGoods = goodsHome.listGoods(null, null, null, null, null, shopId);
		return ResultResponse.success(listGoods,"查询所有商品的商家及商家列表成功,sql需要添加shop列表");
	}
}
