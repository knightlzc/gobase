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
		return ResultResponse.success(listByPcodeAndGroupCode, "查询生活空间创意空间所有分类列表成功");
	}
	/**
	 *@description 查询生活空间和创意空间所有分类店铺列表
	 *@param  search 商品名称（null 所有商品）
	 *@param  category1  一级分类  （ 生活空间shkj，创意空间cykj）
	 *@param  category2  二级分类  （ 生活空间shkj:rcyp:ys，创意空间cykj:jiaju:cl）
	 *@param  category3  三级分类  （ 生活空间rcyp:ys，创意空间jiaju:cl）
	 *@param  shopId 店铺Id
	 *@url1 /goods/list/space_goods?category1=shkj&category2=rcyp&category3=ys&pageNum=0&pageSize=10
	 *@url2 /goods/list/space_goods?category1=cykj&category2=jiaju&category3=cl&pageNum=0&pageSize=10
	 *@url3 /goods/list/shop_goods?shopId=1
	 */
	@RequestMapping("/list/space_goods")
	public ResultResponse<PageContent<GoodsDO>> getSpaceGoodsList(String search,String category1,String category2,String category3,Integer cityId,Integer shopId,Integer pageNum,Integer pageSize){
		pageNum = null==pageNum?0:pageNum;
		pageSize = null==pageSize?10:pageSize;
		PageContent<GoodsDO> pageGoods = goodsHome.pageGoods(search, category1, category2, category3, cityId, shopId, pageNum, pageSize);
		return ResultResponse.success(pageGoods, "查询生活空间具体某分类列表/店铺分类列表和商品成功");
	}
	/**
	 *@description 暂时不查询(模块暂时不做)
	 *@param cityId
	 *@param groupCode
	 *@url /goods/list/recommend?cityId=0&groupCode=kj
	 */
	@RequestMapping("/list/recommend")
	public ResultResponse<PageContent<GoodsDO>> getRecommendGoodsList(String cityId,String groupCode){
		PageContent<GoodsDO> pageGoods = new PageContent<GoodsDO>();
		return ResultResponse.success(pageGoods, "查询推荐商品列表成功");
	}
	/**
	 *@param  goodsId (商品goodsId,（后期添加评论列表后,目前查商品相关，不查类别)
	 *@url  /goods/detail?goodsId=GS1409201401009712
	 */
	@RequestMapping("/detail")
	public ResultResponse<GoodsDO> selectGoodsByGoodsId(String goodsId){
		return ResultResponse.success(goodsHome.getByGoodsId(goodsId), "查询商品详情成功");
	}
	
}
