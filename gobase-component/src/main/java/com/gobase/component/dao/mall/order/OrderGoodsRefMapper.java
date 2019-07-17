package com.gobase.component.dao.mall.order;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.gobase.component.bean.mall.order.OrderGoodsRef;
import com.gobase.component.bean.mall.order.OrderGoodsRefExample;
import com.gobase.component.dao.IBaseMapper;

public interface OrderGoodsRefMapper extends IBaseMapper<OrderGoodsRefExample, OrderGoodsRef>{
	public static final String TABLE = " `order_goods_ref` ";
	
	@Select("<script>"+
    		" update  "+TABLE+" set order_id = #{orderId} where porder_id =  #{porderId} and sku_id =  #{skuId} "+
    		"</script>")
	int updateOrderIdByPorderIdAndSkuId(@Param("skuId")String skuId,@Param("orderId")String orderId,@Param("porderId")String porderId);
}