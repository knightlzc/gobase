package com.gobase.component.home.goods;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gobase.component.bean.mall.goods.GoodsCategory;
import com.gobase.component.bean.mall.goods.GoodsCategoryExample;
import com.gobase.component.dao.mall.goods.GoodsCategoryMapper;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description: 商品分类 后台home接口 </p> 
 * <p>Author:dxh</p>
 */
@Service
public class BackstageGoodsCategoryHome {
	
	@Autowired
	private GoodsCategoryMapper<GoodsCategory, GoodsCategoryExample> goodsCategoryMapper;
	/**
	 * @description 添加分類 類別名不能重複 重複不會再添加 
	 * 
	 */
	public Integer addGoodsCategory(GoodsCategory record) {
		GoodsCategoryExample example = new GoodsCategoryExample();
		example.createCriteria().andNameEqualTo(record.getName());
		List<GoodsCategory> selectByExample = goodsCategoryMapper.selectByExample(example);
		return selectByExample.isEmpty()?goodsCategoryMapper.insert(record):0;
	}
	/**
	 * @description 修改分類 類不存在再添加，存在修改選中的字段 
	 * 
	 */
	public Integer updateGoodsCategory(GoodsCategory record) {
		GoodsCategory select = goodsCategoryMapper.selectByPrimaryKey(record.getId());
		if (null ==select) {
			return goodsCategoryMapper.insert(record);
		}else {
			return goodsCategoryMapper.updateByPrimaryKeySelective(record);
		}
	}
	/**
	 * @description 修改前查詢
	 * 
	 */
	public List <GoodsCategory> categoryBeforeUpdate(GoodsCategory record) {
		List <GoodsCategory> res = new ArrayList<GoodsCategory>();
		GoodsCategory select1 = goodsCategoryMapper.selectByPrimaryKey(record.getId());
		if (null!=select1.getPcode()) {
			recursiveQuery(record,res);//遞歸查詢父級目錄
			res.add(0, select1);
		}
		return res;
	}
	/**
	 * 遞歸查詢父類 
	 */
	private List <GoodsCategory> recursiveQuery(GoodsCategory record ,List <GoodsCategory> res) {
		GoodsCategoryExample example = new GoodsCategoryExample();
		example.createCriteria().andCodeEqualTo(record.getPcode());
		record = goodsCategoryMapper.selectByExample(example).get(0);
		res.add(record);
		if(null == record.getPcode()) {
			return res;
		}
		return recursiveQuery(record ,res);
	}
	
	/**
	 * @description 刪除分類 
	 * 
	 */
	public Integer deleteGoodsCategory(GoodsCategory record) {
		return goodsCategoryMapper.deleteByPrimaryKey(record.getId());
	}
}