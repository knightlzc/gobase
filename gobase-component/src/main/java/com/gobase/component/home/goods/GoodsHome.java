/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: GoodsHome.java
 * @Package com.gobase.component.home.goods
 * @date 2019年6月18日 下午7:50:36 
 */
package com.gobase.component.home.goods;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.gobase.component.bean.mall.goods.Goods;
import com.gobase.component.bean.mall.goods.GoodsDO;
import com.gobase.component.bean.mall.goods.GoodsParam;
import com.gobase.component.bean.mall.goods.GoodsParamExample;
import com.gobase.component.bean.mall.img.Img;
import com.gobase.component.dao.mall.goods.GoodsMapper;
import com.gobase.component.dao.mall.goods.GoodsParamMapper;
import com.gobase.component.home.img.ImgHome;
import com.gobase.tools.page.PageUtil;
import com.gobase.tools.response.PageContent;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description: 商品home接口 </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@Service
public class GoodsHome {

	@Autowired
	private GoodsMapper goodsMapper;
	@Autowired
	private GoodsParamMapper<GoodsParamExample, GoodsParam> goodsParamMapper;
	
	@Autowired
	private ImgHome imgHome;
	
	/**
	 * <br/>Description:
	 * <p>Author:zcliu/刘子萃</p>
	 * @param search
	 * @param category1
	 * @param category2
	 * @param category3
	 * @param cityId
	 * @param shopId
	 * @return
	 */
	public PageContent<GoodsDO> pageGoods(String search,String category1,String category2,String category3,Integer cityId,Integer shopId,int pageNum,int pageSize){
		List<GoodsDO> goodsList = new ArrayList<>();
		if(pageNum <= 0) {
			pageNum = 1;
		}
		if(pageSize <= 0) {
			pageSize = 10;
		}
		int count = goodsMapper.countSearchGoods(search, category1, category2, category3, cityId, shopId);
		if(count <= 0) {
			return new PageContent<GoodsDO>(pageNum,pageSize,count,goodsList);
		}
		List<Goods> list = goodsMapper.searchGoods(search, category1, category2, category3, cityId, shopId,PageUtil.getStart(pageNum, pageSize), PageUtil.getLimit(pageNum, pageSize));
		if(CollectionUtils.isEmpty(list)) {
			return new PageContent<GoodsDO>(pageNum,pageSize,count,goodsList);
		}
		for (Goods goods : list) {
			GoodsDO goodsDO = new GoodsDO();
			BeanUtils.copyProperties(goods, goodsDO);
			
			List<Img> imgs = imgHome.listImg(goods.getGoodsId(),Img.TYPE_GOODS );
			goodsDO.setImgs(imgs);
			
			GoodsParamExample example = new GoodsParamExample();
			example.createCriteria().andGoodsIdEqualTo(goods.getGoodsId());
			List<GoodsParam> paramList = goodsParamMapper.selectByExample(example);
			goodsDO.setParamList(paramList);
			goodsList.add(goodsDO);
		}
		return new PageContent<GoodsDO>(pageNum,pageSize,count,goodsList);
	}  
	public List<GoodsDO> listGoods(String search,String category1,String category2,String category3,Integer cityId,Integer shopId){
		List<GoodsDO> goodsList = new ArrayList<>();
		List<Goods> list = goodsMapper.searchGoods(search, category1, category2, category3, cityId, shopId, 0, 10);
		if(CollectionUtils.isEmpty(list)) {
			return goodsList;
		}
		for (Goods goods : list) {
			GoodsDO goodsDO = new GoodsDO();
			BeanUtils.copyProperties(goods, goodsDO);
			
			List<Img> imgs = imgHome.listImg(goods.getGoodsId(),Img.TYPE_GOODS );
			goodsDO.setImgs(imgs);
			
			GoodsParamExample example = new GoodsParamExample();
			example.createCriteria().andGoodsIdEqualTo(goods.getGoodsId());
			List<GoodsParam> paramList = goodsParamMapper.selectByExample(example);
			goodsDO.setParamList(paramList);
		}
		return goodsList;
	}  
	
	/**
	 *x 自定义查询商品列表
	 */
	public List<GoodsDO> myListGoods(Map<String, Object> params){
		List<GoodsDO> goodsList = new ArrayList<>();
		List<Goods> list = goodsMapper.mySearchGoods(params);
		if(CollectionUtils.isEmpty(list)) {
			return goodsList;
		}
		for (Goods goods : list) {
			GoodsDO goodsDO = new GoodsDO();
			BeanUtils.copyProperties(goods, goodsDO);
			
			List<Img> imgs = imgHome.listImg(goods.getGoodsId(),Img.TYPE_GOODS );
			goodsDO.setImgs(imgs);
			
			GoodsParamExample example = new GoodsParamExample();
			example.createCriteria().andGoodsIdEqualTo(goods.getGoodsId());
			List<GoodsParam> paramList = goodsParamMapper.selectByExample(example);
			goodsDO.setParamList(paramList);
			goodsList.add(goodsDO);//缺少这句代码
		}
		return goodsList;
	}
}
