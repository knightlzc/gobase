package com.gobase.component.home.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gobase.component.bean.mall.order.Order;
import com.gobase.component.dao.mall.order.OrderMapper;

/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:订单home类  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@Service
public class OrderHome {

	@Autowired
	private OrderMapper orderMapper;
	
	public int saveOrder(Order order) {
		return orderMapper.insert(order);
	}
}
