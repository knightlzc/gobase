package com.gobase.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gobase.component.bean.mall.goods.GoodsDO;
import com.gobase.component.bean.mall.oper.Banner;
import com.gobase.component.home.goods.GoodsHome;
import com.gobase.component.home.oper.BannerHome;
import com.gobase.tools.response.ResultResponse;
/**
 *@description 首页查询接口类 已做（轮播图,生活空间，创意空间，果蔬食品/商家入驻 ）
 *@author DXH
 *@date 2019年6月29日15:41:30
 */
@RequestMapping("index")
@RestController
public class IndexController {
	
	@Autowired
	private BannerHome bannerHome;
	
	@Autowired
	private GoodsHome goodsHome;
	/**
	 *@description 首页轮播图列表
	 */
	@RequestMapping("/banner/list")
	public ResultResponse<List<Banner>> bannerList(){
		List<Banner> listBannerByStatus = bannerHome.listBannerByStatus((byte)0);
		return ResultResponse.success(listBannerByStatus, "查询轮播图成功");
	}
	/**
	 *@description 查询生活空间和创意空间所有分类列表
	 *@param  search 商品名称（null 所有商品）
	 *@param  category1  一级分类  （null所有分类 ， 生活空间1，创意空间2）
	 */
	@RequestMapping("/space/list")
	public ResultResponse<List<GoodsDO>> getSpaceList(String search,String category1){
		List<GoodsDO> listGoods = goodsHome.listGoods(search, category1, null, null, null, null);
		return ResultResponse.success(listGoods, "查询生活空间所有分类列表和商品成功");
	}
	/**
	 *@description 查询果蔬食品/商家入驻列表
	 */
	@RequestMapping("/shop/list")
	public ResultResponse<List<GoodsDO>> getShopList(Integer shopId){
		List<GoodsDO> listGoods = goodsHome.listGoods(null, null, null, null, null, shopId);
		return ResultResponse.success(listGoods,"查询所有商品的商家及商家列表成功,sql需要添加shop列表");
	}
	
}
