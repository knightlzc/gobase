/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: GoodsCategoryHome.java
 * @Package com.gobase.component.home.goods
 * @date 2019年6月18日 下午4:50:22 
 */
package com.gobase.component.home.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gobase.component.bean.mall.goods.GoodsCategory;
import com.gobase.component.bean.mall.goods.GoodsCategoryExample;
import com.gobase.component.dao.mall.goods.GoodsCategoryMapper;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description: 商品分类 home接口 </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@Service
public class GoodsCategoryHome {

	@Autowired
	private GoodsCategoryMapper<GoodsCategory, GoodsCategoryExample> goodsCategoryMapper;
	
	/**
	 * <br/>Description:查询全部
	 * <p>Author:zcliu/刘子萃</p>
	 * @return
	 */
	public List<GoodsCategory> listAll(){
		GoodsCategoryExample example = new GoodsCategoryExample();
		List<GoodsCategory> list = goodsCategoryMapper.selectByExample(example);
		return list;
	}
	
	/**
	 * <br/>Description:根据父类编码，分组编码查询，为空则忽略
	 * <p>Author:zcliu/刘子萃</p>
	 * @param pcode
	 * @param groupCode
	 * @return
	 */
	public List<GoodsCategory> listByPcodeAndGroupCode(String pcode,String groupCode){
		GoodsCategoryExample example = new GoodsCategoryExample();
		GoodsCategoryExample.Criteria criteria = example.createCriteria();
		if(null != pcode) {
			criteria.andPcodeEqualTo(pcode);
		}
		if(null != groupCode) {
			criteria.andGroupCodeEqualTo(groupCode);
		}
		List<GoodsCategory> list = goodsCategoryMapper.selectByExample(example);
		return list;
	}
	
}
