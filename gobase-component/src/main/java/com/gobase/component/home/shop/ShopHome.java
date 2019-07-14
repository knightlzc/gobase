package com.gobase.component.home.shop;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.gobase.component.bean.mall.goods.Goods;
import com.gobase.component.bean.mall.goods.GoodsCategory;
import com.gobase.component.bean.mall.goods.GoodsDO;
import com.gobase.component.bean.mall.goods.GoodsExample;
import com.gobase.component.bean.mall.goods.GoodsExample.Criteria;
import com.gobase.component.bean.mall.shop.Shop;
import com.gobase.component.bean.mall.shop.ShopDO;
import com.gobase.component.bean.mall.shop.ShopExample;
import com.gobase.component.dao.mall.goods.GoodsCategoryMapper;
import com.gobase.component.dao.mall.goods.GoodsMapper;
import com.gobase.component.dao.mall.shop.ShopMapper;
import com.gobase.component.home.goods.GoodsHome;
import com.gobase.tools.response.PageContent;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description: 商店home接口 </p> 
 * <p>Author:dxh</p>
 */
@Service
public class ShopHome{
	
	@Autowired
	private ShopMapper shopMapper;
	
	@Autowired
	private GoodsMapper goodsMapper;
	@Autowired
	private GoodsCategoryMapper goodsCategoryMapper;
	
	@Autowired
	private GoodsHome goodsHome;
//	@Autowired
//	private OrderMapper orderMapper;
	/**
	 *@description 查询店铺并查询几张热销商品和统计销量 
	 *@param params 店铺名称等
	 */
	public PageContent<ShopDO> pageShops(Map<String, Object> params){
		ArrayList<ShopDO> shopsList = new ArrayList<ShopDO>();
		long count = shopMapper.countByExample(new ShopExample());
		if (count <=0) {
			return new PageContent<ShopDO>(1,10,(int)count,shopsList);
		}
		List<Shop> list = shopMapper.mySearchShops(params);
		if(CollectionUtils.isEmpty(list)) {
			return new PageContent<ShopDO>(1,10,(int)count,shopsList);
		}
		GoodsExample goodsExample = new GoodsExample();
		Criteria goodscri = goodsExample.createCriteria();
//		OrderExample orderExample = new OrderExample();
//		com.gobase.component.bean.mall.order.OrderExample.Criteria ordercri = orderExample.createCriteria();
		for(Shop shop:list){
			ShopDO shopDO = new ShopDO();
			BeanUtils.copyProperties(shop, shopDO);
			goodscri.andShopIdEqualTo(shop.getId());
			goodsExample.setOrderByClause("update_time ASC LIMIT 0,4");
			List<Goods> goodsLi = goodsMapper.selectByExample(goodsExample);
			if(!CollectionUtils.isEmpty(goodsLi)) {
				shopDO.setGoodsList(goodsLi);
//				for(Goods goods:goodsLi) {
//					ordercri.andGoodsIdEqualTo(goods.getGoodsId());
//					long ordcount = orderMapper.countByExample(orderExample);
//					shopDO.setSaleCount(ordcount);
//				}
			}
			shopsList.add(shopDO);
		}
		
		return new PageContent<ShopDO>((int)params.get("offset"),(int)params.get("limit"),(int)count,shopsList);
	}
	
	public Map<String,Object> getShopCatrgoryByShopId(Integer shopId){
		List<GoodsDO> listGoods = goodsHome.listGoods(null, null, null, null, null, shopId);
		List<GoodsCategory> sublist=null;
		GoodsCategory cate = null;
		if(!listGoods.isEmpty()) {
			 Map<String,Object> categorys = new HashMap<String, Object>(); 
			 for (GoodsDO item :listGoods) {
				 if (null!=item.getCategory2()&null!=item.getCategory3()) {
					 if(categorys.containsKey(item.getCategory2())) {
						 sublist = (ArrayList<GoodsCategory>) categorys.get(item.getCategory2());
						 cate = new GoodsCategory();
						 cate.setCode(item.getCategory3());
						 sublist.add(cate);
					 }else {
						 sublist =new ArrayList<GoodsCategory>();
						 cate = new GoodsCategory();
						 cate.setCode(item.getCategory3());
						 sublist.add(cate);
						 categorys.put(item.getCategory2(), sublist);
					 }
					 
				 }
			 }
			return categorys;
		 }
		return null;
	}
}
