/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: GoodsController.java
 * @Package com.gobase.platform.controller.goods
 * @date 2019年9月14日 下午1:43:27 
 */
package com.gobase.platform.controller.goods;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gobase.component.bean.mall.goods.GoodsDO;
import com.gobase.component.home.goods.GoodsHome;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description: 商品 </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@Controller
@RequestMapping("goods")
public class GoodsController {

	@Autowired
	private GoodsHome goodsHome;
	
	@RequestMapping("addPage")
	public String addPage(Model model,String goodsId){
		if(StringUtils.isNotBlank(goodsId)) {
			GoodsDO goods = goodsHome.getByGoodsId(goodsId);
			if(null != goods) {
				model.addAttribute("goods", goods);
			}
		}
		return "goods/goods_edit";
	}
}
