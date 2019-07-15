/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: GoodsCategoryController.java
 * @Package com.gobase.web.controller.goods
 * @date 2019年7月1日 下午4:19:19 
 */
package com.gobase.web.controller.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gobase.component.bean.mall.goods.GoodsCategory;
import com.gobase.component.home.goods.BackstageGoodsCategoryHome;
import com.gobase.tools.response.ResultResponse;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@RequestMapping("category")
@RestController
public class GoodsCategoryController {
	
	@Autowired
	private BackstageGoodsCategoryHome backstageGoodsCategoryHome;
	/**
	 *@description 添加分類 
	 */
	@RequestMapping("/backstage/add")
	public ResultResponse<Integer> categoryAdd(GoodsCategory record){
		String prompt = "添加分类成功";
		Integer res = backstageGoodsCategoryHome.addGoodsCategory(record);
		if (res == 0) prompt = "添加分类失敗";
		return ResultResponse.success(res, prompt);
	}
	/**
	 *@description 修改分類 
	 */
	@RequestMapping("/backstage/update")
	public ResultResponse<Integer> categoryUpdate(GoodsCategory record){
		String prompt = "修改分类成功";
		Integer res = backstageGoodsCategoryHome.updateGoodsCategory(record);
		if (res == 0) prompt = "修改分类失敗";
		return ResultResponse.success(res, prompt);
	}
	/**
	 *@description 編輯前查詢，包括父類
	 */
	@RequestMapping("/backstage/beforeupdate")
	public ResultResponse<List<GoodsCategory>> categoryBeforeUpdate(GoodsCategory record){
		String prompt = "查詢修改分类成功";
		List<GoodsCategory> beforeUpdate = backstageGoodsCategoryHome.categoryBeforeUpdate(record);
		if (beforeUpdate.isEmpty()) prompt = "查詢修改分类失敗";
		return ResultResponse.success(beforeUpdate, prompt);
	}
	/**
	 *@description 刪除分類 
	 */
	@RequestMapping("/backstage/delete")
	public ResultResponse<Integer> categoryDelete(GoodsCategory record){
		return ResultResponse.success(backstageGoodsCategoryHome.deleteGoodsCategory(record), "刪除分类成功");
	}
}
