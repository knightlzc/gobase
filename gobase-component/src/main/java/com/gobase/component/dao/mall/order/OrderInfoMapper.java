package com.gobase.component.dao.mall.order;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.gobase.component.bean.mall.order.OrderInfo;
import com.gobase.component.bean.mall.order.OrderInfoExample;
import com.gobase.component.bean.mall.order.OrderDO;
import com.gobase.component.dao.IBaseMapper;
import com.gobase.component.param.order.QueryOrderParam;

public interface OrderInfoMapper extends IBaseMapper<OrderInfoExample, OrderInfo>{
	
	public static final String TABLE = " `order_info` ";
	public static final String JOIN_COLS = " o.`id`,o.`order_id` orderId ,o.`user_id` userId ,o.`region_id` regionId,o.`status` status ,"
			+ "o.`goods_id` goodsId,o.`remark` remark,o.`address_id`,"
			+ "o.`create_time`,o.`kuaidi_name` kuaidiName,o.`kuaidi_order` kuaidiOrder,o.`kuaidi_price` kuaidiPrice,o.`manjian_price`,o.`user_coupons_id`,o.`coupons_price`,o.`coupons_type`,"
			+ "o.`reduce_intr_rate`,o.`deliver_time`,o.`total_price` totalPrice,o.`porder_id` porderId ";
	public static final String SELECT_COLS = " `id`,`order_id`,`user_id`,`region_id`,`status`,`goods_id`,`remark`,`address_id`,`create_time`,`kuaidi_name`,`kuaidi_order`,`kuaidi_price`,`manjian_price`,`user_coupons_id`,`coupons_price`,`coupons_type`,`reduce_intr_rate`,`deliver_time`,`total_price`,`porder_id` ";
 
	@Select("<script>"+
			" select IFNULL(count(*),0) from order_info o "+
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
			" select "+JOIN_COLS+",s.shop_name shopName,g.shop_id shopId from order_info o "+
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