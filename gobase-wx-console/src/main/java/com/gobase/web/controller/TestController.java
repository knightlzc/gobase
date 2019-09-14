/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Company: 人人公司  http://www.renren-inc.com </p> 
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: IndexController.java
 * @Package com.renren.auto.web.controller
 * @date 2018年6月25日 下午12:02:02 
 */
package com.gobase.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gobase.component.bean.mall.goods.Goods;
import com.gobase.component.bean.mall.goods.GoodsCategory;
import com.gobase.component.bean.mall.goods.GoodsCategoryExample;
import com.gobase.component.bean.mall.goods.GoodsExample;
import com.gobase.component.dao.mall.goods.GoodsCategoryMapper;
import com.gobase.component.dao.mall.goods.GoodsMapper;
import com.gobase.tools.response.ResultResponse;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@RequestMapping("test")
@RestController
public class TestController {
	
	@Autowired
	private GoodsCategoryMapper goodsCategoryMapper;
	@Autowired
	private GoodsMapper goodsMapper;
	
	/**
	 * <br/>Description:
	 * <p>Author:zcliu/刘子萃</p>
	 * @return
	 */
	@RequestMapping("/category/list")
	public ResultResponse<List<GoodsCategory>> testVideo() {
		GoodsCategoryExample example = new GoodsCategoryExample();
		example.createCriteria().andPcodeEqualTo("");
		List<GoodsCategory> list = goodsCategoryMapper.selectByExample(example);
		return ResultResponse.success(list, "查询分类成功");
	}
	@RequestMapping("/goods/list")
	public ResultResponse<List<Goods>> testVideo(String search) {
		List<Goods> list =  goodsMapper.searchGoods(search,null, null, null, null, null, null, 0, 10);
		return ResultResponse.success(list, "查询列表成功");
	}
	
    
    public static void main(String[] args) {
    	for (int i = 0; i < 1000; i++) {
//			JedisClient.getInstance().rightPop(UserConstant.USER_ID_POOL_CACHE);
		}
	}
	
	
}
