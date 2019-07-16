package com.gobase.component.home.order;

import com.gobase.component.bean.mall.goods.GoodsDO;
import com.gobase.component.bean.mall.order.*;
import com.gobase.component.dao.mall.order.OrderGoodsRefMapper;
import com.gobase.component.home.goods.GoodsHome;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gobase.component.dao.mall.order.OrderMapper;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:订单home类  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@Service
public class OrderHome {

	@Autowired
	private OrderMapper orderMapper;

	@Autowired
	private OrderGoodsRefMapper orderGoodsRefMapper;

	@Autowired
	private GoodsHome goodsHome;
	
	public int saveOrder(Order order) {
		return orderMapper.insert(order);
	}

	public Order getOrderByOrderId(String orderId) {
		OrderExample example = new OrderExample();
		example.createCriteria().andOrderIdEqualTo(orderId);

		List<Order> orders = orderMapper.selectByExample(example);
		if(CollectionUtils.isEmpty(orders)){
			return null;
		}
		return orders.get(0);
	}

	public OrderDO getOrderDOByOrderId(String orderId){
		OrderDO orderDO = new OrderDO();
		OrderExample example = new OrderExample();
		example.createCriteria().andOrderIdEqualTo(orderId);

		List<Order> orders = orderMapper.selectByExample(example);
		if(CollectionUtils.isEmpty(orders)){
			return orderDO;
		}
		Order order = orders.get(0);
		BeanUtils.copyProperties(order,orderDO);

		OrderGoodsRefExample orderGoodsRefExample = new OrderGoodsRefExample();
		orderGoodsRefExample.createCriteria().andOrderIdEqualTo(orderId);

		List<OrderGoodsRef> orderGoodsRefs = orderGoodsRefMapper.selectByExample(orderGoodsRefExample);

		if (CollectionUtils.isEmpty(orderGoodsRefs)){
			return orderDO;
		}

		List<GoodsDO> goodsList = new ArrayList<>();
		for (OrderGoodsRef ref : orderGoodsRefs){
			GoodsDO goodsDO = goodsHome.getByGoodsId(ref.getSkuId());
			goodsList.add(goodsDO);
		}

		orderDO.setGoodsList(goodsList);
		return orderDO;
	}

}
