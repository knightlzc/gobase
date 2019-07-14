package com.gobase.component.dao.mall.goods;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.gobase.component.bean.mall.goods.GoodsCategory;
import com.gobase.component.dao.IBaseMapper;

public interface GoodsCategoryMapper<T, E> extends IBaseMapper<E, T>{
	
	public static final String LEFTTABLE = " `goods_category` ";
	public static final String RIGHTTABLE = " `goods` ";
	public static final String SELECT_COLS =" `id`,`code`,`pcode`,`name`,`group_code`,`sort` ";
	public static final String SELECT_JOIN_COLS =" c.`id`,c.`code`,c.`pcode`,c.`name`,c.`group_code`,c.`sort` ";
	
	@Select("<script>"+
    		" select DISTINCT "+SELECT_JOIN_COLS+" from "+LEFTTABLE+ " AS c LEFT JOIN "+RIGHTTABLE+" AS g ON c.`code` = g.`category2` "+
    		" WHERE 1=1 "+
    		" <if test='shopId != null'> "+
    		" AND g.`shop_id` = #{shopId} "+
    		" </if>"+
    		"</script>")
	List<GoodsCategory> searchShopGoodsCategory(@Param("shopId")Integer shopId);
}