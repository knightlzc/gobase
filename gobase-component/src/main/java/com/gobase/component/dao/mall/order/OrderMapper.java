package com.gobase.component.dao.mall.order;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.gobase.component.bean.mall.order.Order;
import com.gobase.component.bean.mall.order.OrderDO;
import com.gobase.component.bean.mall.order.OrderExample;
import com.gobase.component.dao.IBaseMapper;
import com.gobase.component.param.order.QueryOrderParam;

public interface OrderMapper extends IBaseMapper<OrderExample, Order>{
	
	public static final String TABLE = " `order` ";
	public static final String JOIN_COLS = " o.`id`,o.`order_id`,o.`user_id`,o.`region_id`,o.`status`,o.`goods_id`,o.`remark`,o.`address_id`,"
			+ "o.`create_time`,o.`kuaidi_name`,o.`kuaidi_order`,o.`kuaidi_price`,o.`manjian_price`,o.`user_coupons_id`,o.`coupons_price`,o.`coupons_type`,"
			+ "o.`reduce_intr_rate`,o.`deliver_time`,o.`totalPrice`,o.`porder_id` ";
	public static final String SELECT_COLS = " `id`,`order_id`,`user_id`,`region_id`,`status`,`goods_id`,`remark`,`address_id`,`create_time`,`kuaidi_name`,`kuaidi_order`,`kuaidi_price`,`manjian_price`,`user_coupons_id`,`coupons_price`,`coupons_type`,`reduce_intr_rate`,`deliver_time`,`totalPrice`,`porder_id` ";
 
	@Select("<script>"+
			" select IFNULL(count(*),0) from order o "+
			" left join goods g on g.goods_id = o.goods_id " +
			" left join shop s on s.id = g.shop_id " +
			" where 1=1 "+
			" <if test='param.shopId != null '> "+
			" and o.userId = #{param.userId} "+
			" </if>"+
			" <if test='param.shopId != null '> "+
			" and o.user_id = #{param.userId} "+
			" </if>"+
			" <if test='param.status != null '> "+
			" and o.status = #{param.status} "+
			" </if>"+
			"</script>")
	int countOrders(@Param("param")QueryOrderParam param );
	
	@Select("<script>"+
			" select "+JOIN_COLS+",s.shop_name,g.shop_id  from order o "+
			" left join goods g on g.goods_id = o.goods_id " +
			" left join shop s on s.id = g.shop_id " +
			" where 1=1 "+
			" <if test='param.shopId != null '> "+
			" and o.userId = #{param.userId} "+
			" </if>"+
			" <if test='param.shopId != null '> "+
			" and o.user_id = #{param.userId} "+
			" </if>"+
			" <if test='param.status != null '> "+
			" and o.status = #{param.status} "+
			" </if>"+
			" <if test='param.status == null '> "+
			" and o.status > -1 "+
			" </if>"+
			" order by o.create_time desc "+
			" <if test='start != null and limit != null '> "+
			" limit #{start},#{limit} "+
	        " </if>"+
			"</script>")
	List<OrderDO> pageOrders(@Param("param")QueryOrderParam param ,@Param("start")Integer start,@Param("limit")Integer limit );
}