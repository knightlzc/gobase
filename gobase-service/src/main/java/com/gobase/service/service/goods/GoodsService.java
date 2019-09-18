/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: GoodsService.java
 * @Package com.gobase.service.service.goods
 * @date 2019年9月14日 下午5:45:28 
 */
package com.gobase.service.service.goods;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.gobase.component.bean.mall.goods.GoodsDO;
import com.gobase.component.bean.mall.img.Img;
import com.gobase.component.home.goods.GoodsHome;
import com.gobase.component.param.mall.goods.GoodsQueryParam;
import com.gobase.service.param.goods.GoodsEditParam;
import com.gobase.tools.response.PageContent;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@Service
public class GoodsService {

	@Autowired
	private GoodsHome goodsHome;
	
	public String save(GoodsEditParam param) {
		GoodsDO goodsDO = goodsHome.getByGoodsId(param.getGoodsId());
		if(null == goodsDO) {
			goodsDO = new GoodsDO();
			BeanUtils.copyProperties(param, goodsDO);
		}
		List<Img> imgs = new ArrayList<Img>();
		if(! CollectionUtils.isEmpty(param.getImgs())) {
			for (String url : param.getImgs()) {
				Img img = new Img();
				img.setImgUrl(url);
				imgs.add(img);
			}
		} 
		goodsDO.setImgs(imgs);
		return goodsHome.save(goodsDO);
	}
	
	public PageContent<GoodsDO> pageAuditGoods(int pageNum,int pageSize,Integer shopId,Integer cityId){
		GoodsQueryParam param = new GoodsQueryParam();
		if(null != shopId) {
			param.setShopId(shopId);
		}
		if(null != cityId) {
			param.setCityId(cityId);
		}
		return goodsHome.pageByParam(param, pageNum, pageSize);
	}
}
