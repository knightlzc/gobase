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

import com.gobase.component.bean.mall.goods.*;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.gobase.component.bean.mall.img.Img;
import com.gobase.component.bean.mall.img.ImgExample;
import com.gobase.component.dao.mall.goods.GoodsMapper;
import com.gobase.component.dao.mall.goods.GoodsParamMapper;
import com.gobase.component.dao.mall.img.ImgMapper;
import com.gobase.component.home.img.ImgHome;
import com.gobase.tools.common.IDCreater;
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
	private ImgMapper imgMapper;
	
	@Autowired
	private ImgHome imgHome;
	
	/**
	 * <br/>Description:分页查询
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
			goodsList.add(goodsDO);
		}
		return goodsList;
	}
	
	public GoodsDO getByGoodsId(String goodsId) {
		GoodsDO goodsDO = new GoodsDO();
		GoodsExample example = new GoodsExample();
		example.createCriteria().andGoodsIdEqualTo(goodsId);
		List<Goods> goodsList = goodsMapper.selectByExample(example);
		if(CollectionUtils.isEmpty(goodsList)){
			return goodsDO;
		}
		Goods goods = goodsList.get(0);
		BeanUtils.copyProperties(goods, goodsDO);

		List<Img> imgs = imgHome.listImg(goods.getGoodsId(),Img.TYPE_GOODS );
		goodsDO.setImgs(imgs);

		GoodsParamExample goodsParamExample = new GoodsParamExample();
		goodsParamExample.createCriteria().andGoodsIdEqualTo(goods.getGoodsId());
		List<GoodsParam> paramList = goodsParamMapper.selectByExample(goodsParamExample);
		goodsDO.setParamList(paramList);
		return goodsDO;
	}
	
	@Transactional
	public String save(GoodsDO goodsDO) {
		Goods goods = null;
		if(StringUtils.isBlank(goodsDO.getGoodsId())) {
			goods = new Goods();
			BeanUtils.copyProperties(goodsDO, goods);
			goods.setGoodsId(IDCreater.generate("GBSG"));
			goods.setAuditStatus(Goods.AUDIT_STATUS_AUDITING);
			goodsMapper.insertSelective(goods);
		} else {
			GoodsExample example = new GoodsExample();
			example.createCriteria().andGoodsIdEqualTo(goodsDO.getGoodsId());
			goods = goodsMapper.selectByExample(example).get(0);
			BeanUtils.copyProperties(goodsDO, goods);
			goodsMapper.updateByExampleSelective(goods, example);
		}
		
		ImgExample imgExample = new ImgExample();
		imgExample.createCriteria().andBizIdEqualTo(goods.getGoodsId()).andBizTypeEqualTo(Img.TYPE_GOODS);
		imgMapper.deleteByExample(imgExample);
		if(!CollectionUtils.isEmpty(goodsDO.getImgs())) {
			for (Img img : goodsDO.getImgs()) {
				img.setBizType(Img.TYPE_GOODS);
				img.setBizId(goods.getGoodsId());
				imgMapper.insert(img);
			}
		}
		return goods.getGoodsId();
	}
	
}
