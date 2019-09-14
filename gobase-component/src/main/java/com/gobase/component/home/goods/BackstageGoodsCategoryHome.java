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
	 * @description 修改前查询
	 * 
	 */
	public List <GoodsCategory> categoryBeforeUpdate(GoodsCategory record) {
		List <GoodsCategory> res = new ArrayList<GoodsCategory>();
		GoodsCategory select1 = goodsCategoryMapper.selectByPrimaryKey(record.getId());
		if (null!=select1.getPcode()) {
			recursiveQuery(select1,res);//递归查询父类
			res.add(0, select1);
		}
		return res;
	}
	/**
	 * 递归查询父类
	 */
	private List <GoodsCategory> recursiveQuery(GoodsCategory record ,List <GoodsCategory> res) {
		GoodsCategoryExample example = new GoodsCategoryExample();
		example.createCriteria().andCodeEqualTo(record.getPcode());
		List<GoodsCategory> selectByExample = goodsCategoryMapper.selectByExample(example);
		record = selectByExample.isEmpty()?record:selectByExample.get(0);
		res.add(record);
		if(null == record.getPcode()||"".equals(record.getPcode())) {
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