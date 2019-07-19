package com.gobase.component.home.order;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.gobase.component.bean.mall.goods.GoodsDO;
import com.gobase.component.bean.mall.order.OrderDO;
import com.gobase.component.bean.mall.order.OrderGoodsRef;
import com.gobase.component.bean.mall.order.OrderGoodsRefExample;
import com.gobase.component.bean.mall.order.OrderInfo;
import com.gobase.component.bean.mall.order.OrderInfoExample;
import com.gobase.component.dao.mall.order.OrderGoodsRefMapper;
import com.gobase.component.dao.mall.order.OrderInfoMapper;
import com.gobase.component.home.goods.GoodsHome;

/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:订单home类  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@Service
public class OrderHome {

	@Autowired
	private OrderInfoMapper orderMapper;

	@Autowired
	private OrderGoodsRefMapper orderGoodsRefMapper;

	@Autowired
	private GoodsHome goodsHome;
	
	public int saveOrder(OrderInfo order) {
		return orderMapper.insert(order);
	}

	public OrderInfo getOrderByOrderId(String orderId) {
		OrderInfoExample example = new OrderInfoExample();
		example.createCriteria().andOrderIdEqualTo(orderId);

		List<OrderInfo> orders = orderMapper.selectByExample(example);
		if(CollectionUtils.isEmpty(orders)){
			return null;
		}
		return orders.get(0);
	}

	public OrderDO getOrderDOByOrderId(String orderId){
		OrderDO orderDO = new OrderDO();
		OrderInfoExample example = new OrderInfoExample();
		example.createCriteria().andOrderIdEqualTo(orderId);

		List<OrderInfo> orders = orderMapper.selectByExample(example);
		if(CollectionUtils.isEmpty(orders)){
			return orderDO;
		}
		OrderInfo order = orders.get(0);
		BeanUtils.copyProperties(order,orderDO);
		List<GoodsDO> goodsList = getGoodsList(orderId);
		orderDO.setGoodsList(goodsList);
		return orderDO;
	}
	
	public List<GoodsDO> getGoodsList(String orderId){
		List<GoodsDO> goodsList = new ArrayList<>();
		OrderGoodsRefExample orderGoodsRefExample = new OrderGoodsRefExample();
		orderGoodsRefExample.createCriteria().andOrderIdEqualTo(orderId);
		List<OrderGoodsRef> orderGoodsRefs = orderGoodsRefMapper.selectByExample(orderGoodsRefExample);
		if (CollectionUtils.isEmpty(orderGoodsRefs)){
			return goodsList;
		}
		for (OrderGoodsRef ref : orderGoodsRefs){
			GoodsDO goodsDO = goodsHome.getByGoodsId(ref.getSkuId());
			goodsList.add(goodsDO);
		}
		
		return goodsList;
	} 
	
	public int resetOrderGoodsOrderId(String goodsId,String orderId,String porderId) {
		return orderGoodsRefMapper.updateOrderIdByPorderIdAndSkuId(goodsId, orderId, porderId);
	}
	
	public int updateOrder(OrderInfo order) {
		return orderMapper.updateByPrimaryKey(order);
	}

	
}
