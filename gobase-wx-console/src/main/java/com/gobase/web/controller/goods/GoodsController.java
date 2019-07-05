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

import com.gobase.component.bean.mall.goods.GoodsCategory;
import com.gobase.component.bean.mall.goods.GoodsDO;
import com.gobase.component.home.goods.GoodsCategoryHome;
import com.gobase.component.home.goods.GoodsHome;
import com.gobase.tools.response.PageContent;
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
	private GoodsCategoryHome goodsCategoryHome;
	
	@Autowired
	private GoodsHome goodsHome;
	
	/**
	 *@description 查询生活空间和创意空间所有分类列表
	 *@param  search 商品名称（null 所有商品）
	 *@param  pcode 一级分类  （null所有分类， 生活空间shkj，创意空间cykj）
	 *@param  groupCode 分组编码 
	 *@url	/goods/list/space_category?pcode=shkj&groupCode=kj
	 */
	@RequestMapping("/list/space_category")
	public ResultResponse<List<GoodsCategory>> getSpaceCategoryList(String pcode,String groupCode){
		List<GoodsCategory> listByPcodeAndGroupCode = goodsCategoryHome.listByPcodeAndGroupCode(pcode, groupCode);
		return ResultResponse.success(listByPcodeAndGroupCode, "查询生活空间所有分类列表成功");
	}
	
	/**
	 *@description 查询生活空间和创意空间所有分类列表
	 *@param  search 商品名称（null 所有商品）
	 *@param  category1  一级分类  （ 生活空间shkj，创意空间cykj）
	 *@param  category2  二级分类  （ 生活空间shkj:rcyp:ys，创意空间cykj:jiaju:cl）
	 *@param  category3  三级分类  （ 生活空间rcyp:ys，创意空间jiaju:cl）
	 *@url /goods/list/space_goods?category1=shkj&category2=rcyp&category3=ys
	 */
	@RequestMapping("/list/space_goods")
	public ResultResponse<PageContent<GoodsDO>> getSpaceGoodsList(String search,String category1,String category2,String category3){
		PageContent<GoodsDO> pageGoods = goodsHome.pageGoods(search, category1, category2, category3, null, null, 0, 10);
		return ResultResponse.success(pageGoods, "查询生活空间具体某分类列表和商品成功");
	}
	
}
