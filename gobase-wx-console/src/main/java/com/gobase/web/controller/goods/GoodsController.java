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
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

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
	/**
	 *@description 查询生活空间和创意空间所有分类列表
	 * @Param("search")String search,商品名称（null 所有商品）
	 * @Param("category1")String category1, 一级分类  （null所有分类 ， 生活空间 shkj，创意空间cykj）
	 * @Param("category2")String category2,
	 * @Param("category3")Stringcategory3,
	 * @Param("cityId")Integer cityId,
	 * @Param("shopId")Integer shopId,
	 * @Param("start")Integer start,
	 * @Param("limit")Integer limit
	 */
	/*
	 * @RequestMapping("/list/space") public ResultResponse<List<GoodsDO>>
	 * getSpaceList(String search,String category1){ Map<String,Object> params = new
	 * ConcurrentHashMap<String, Object>();//参数处理容器 params.clear();
	 * //params.put("search",search); params.put("category1", category1);
	 * params.put("start", 0); params.put("limit",10); System.out.println(params);
	 * List<GoodsDO> listGoods = goodsHome.myListGoods(params); return
	 * ResultResponse.success(listGoods, "查询生活空间所有分类列表和商品成功"); }
	 */
}
