package com.gobase.component.dao.mall.shop;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gobase.component.bean.mall.shop.Shop;
import com.gobase.component.bean.mall.shop.ShopExample;
import com.gobase.component.dao.IBaseMapper;

public interface ShopMapper extends IBaseMapper<ShopExample,Shop>{
	/**
	 * x限制查询shop列表 
	 */
	List<Shop> mySearchShops(@Param("shopsdto") Map<String, Object> params);
}