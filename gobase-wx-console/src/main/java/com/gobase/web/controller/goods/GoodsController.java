/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: GoodsController.java
 * @Package com.gobase.web.controller.goods
 * @date 2019年7月1日 下午4:16:34 
 */
package com.gobase.web.controller.goods;

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
@RequestMapping("goods")
@RestController
public class GoodsController {
	
	@Autowired
	private GoodsHome goodsHome;
	
	/**
	 *@description 查询生活空间和创意空间所有分类列表
	 *@param  search 商品名称（null 所有商品）
	 *@param  category1  一级分类  （null所有分类 ， 生活空间1，创意空间2）
	 */
	@RequestMapping("/list/space")
	public ResultResponse<List<GoodsDO>> getSpaceList(String search,String category1){
		List<GoodsDO> listGoods = goodsHome.listGoods(search, category1, null, null, null, null);
		return ResultResponse.success(listGoods, "查询生活空间所有分类列表和商品成功");
	}
}
