/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: GoodsController.java
 * @Package com.gobase.platform.controller.goods
 * @date 2019年9月14日 下午1:43:27 
 */
package com.gobase.platform.controller.goods;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.gobase.component.bean.mall.goods.GoodsCategory;
import com.gobase.component.bean.mall.goods.GoodsDO;
import com.gobase.component.bean.mall.pfuser.PfUser;
import com.gobase.component.home.goods.GoodsCategoryHome;
import com.gobase.component.home.goods.GoodsHome;
import com.gobase.platform.controller.user.response.PfUserResponse;
import com.gobase.platform.utils.ResponseUtil;
import com.gobase.service.dto.goods.GoodsDTO;
import com.gobase.service.param.goods.GoodsEditParam;
import com.gobase.service.service.goods.GoodsService;
import com.gobase.tools.response.PageContent;
import com.gobase.tools.response.ResultResponse;

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
	
	@Autowired
	private GoodsCategoryHome goodsCategoryHome;
	
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping("listPage")
	public String listPage(){
		
		return "goods/goods_list";
	}
	
	@RequestMapping("auditListPage")
	public String auditListPage(){
		
		return "goods/audit_list";
	}
	
	@ResponseBody
	@RequestMapping("list")
	public ResultResponse<PageContent<GoodsDO>> list(String goodsId,String search,Integer shopId,Integer page,Integer limit){
		try {
			PageContent<GoodsDO> pageResult = goodsHome.pageGoods(search,goodsId, null, null, null, null, shopId, page, limit);
			return ResultResponse.success(new PageContent<>(pageResult.getPageNum(), pageResult.getPageSize(), 0, pageResult.getContent()), "查询成功");
		} catch (Exception e) {
			e.printStackTrace();
			return ResultResponse.fail("500","查询商品列表异常 "+e.getMessage());
			
		}
	}
	@RequestMapping("editPage")
	public String addPage(Model model,String goodsId){
		List<GoodsCategory> categoryList1 = goodsCategoryHome.listByPcodeAndGroupCode("", null);
		if(CollectionUtils.isNotEmpty(categoryList1)) {
			model.addAttribute("categoryList1", ResponseUtil.toSelectCategoryResponse(categoryList1));
		}
		if(StringUtils.isNotBlank(goodsId)) {
			GoodsDO goods = goodsHome.getByGoodsId(goodsId);
			if(null != goods) {
				model.addAttribute("goods", goods);
				List<GoodsCategory> categoryList2 = goodsCategoryHome.listByPcodeAndGroupCode(goods.getCategory1(), null);
				if(CollectionUtils.isNotEmpty(categoryList2)) {
					model.addAttribute("categoryList2", ResponseUtil.toSelectCategoryResponse(categoryList2));
				}
				List<GoodsCategory> categoryList3 = goodsCategoryHome.listByPcodeAndGroupCode(goods.getCategory2(), null);
				if(CollectionUtils.isNotEmpty(categoryList3)) {
					model.addAttribute("categoryList3", ResponseUtil.toSelectCategoryResponse(categoryList3));
				}
			}
		}
		return "goods/goods_edit";
	}
	
	@ResponseBody
	@RequestMapping("save")
	public ResultResponse<String> save(String jsonData){
		try {
			GoodsEditParam param = JSONObject.parseObject(jsonData, GoodsEditParam.class);
			String goodsId = goodsService.save(param);
			return ResultResponse.success(goodsId+"", "发布商品成功");
		} catch (Exception e) {
			e.printStackTrace();
			return ResultResponse.fail("500","发布商品异常 "+e.getMessage());
			
		}
	}
}
