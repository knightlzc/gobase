/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: OrderService.java
 * @Package com.gobase.service.service.order
 * @date 2019年7月16日 下午1:45:35 
 */
package com.gobase.service.service.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gobase.component.bean.mall.goods.Goods;
import com.gobase.component.bean.mall.goods.GoodsDO;
import com.gobase.component.bean.mall.order.Order;
import com.gobase.component.bean.mall.order.OrderDO;
import com.gobase.component.bean.mall.order.OrderGoodsRef;
import com.gobase.component.bean.mall.shop.Shop;
import com.gobase.component.cache.Cart;
import com.gobase.component.dao.mall.goods.GoodsMapper;
import com.gobase.component.dao.mall.order.OrderGoodsRefMapper;
import com.gobase.component.dao.mall.order.OrderMapper;
import com.gobase.component.home.goods.GoodsHome;
import com.gobase.component.home.order.OrderHome;
import com.gobase.tools.common.IDCreater;
import com.gobase.tools.compute.PreciseCompute;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@Service
public class OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private OrderGoodsRefMapper orderGoodsRefMapper;
	
	@Autowired
	private GoodsMapper goodsMapper;
	
	@Autowired
	private OrderHome orderHome;
	
	@Autowired
	private GoodsHome goodsHome;

	@Transactional
	public String placeOrder(int userId,List<Cart> cartList,int addressId,double kuaidiPrice) throws Exception {
		if(CollectionUtils.isEmpty(cartList)) {
			throw new Exception("购物车为空");
		}
		String orderId = IDCreater.generate("GO");
		Order order = new Order();
		order.setOrderId(orderId);
		order.setUserId(userId);
		double orderAmount = 0.0;
		for (Cart cart : cartList) {
			OrderGoodsRef ref = new OrderGoodsRef();
			ref.setOrderId(orderId);
			
			GoodsDO goods = goodsHome.getByGoodsId(cart.getGoodsId());
			ref.setSkuId(goods.getGoodsId());
			ref.setSkuNum(cart.getNum());
			ref.setPerPrice(goods.getRealPrice());
			double totalPrice = PreciseCompute.mul(goods.getRealPrice(), cart.getNum());
			ref.setTotalPrice(totalPrice);
			orderAmount = PreciseCompute.add(orderAmount, totalPrice);
			
			orderGoodsRefMapper.insert(ref);
			
		}
		order.setAddressId(addressId);
		order.setKuaidiPrice(kuaidiPrice);
		orderMapper.insert(order);
		return orderId;
	}
	
	public static void main(String[] args) {
		System.out.println(IDCreater.generate("123"));
	}
}
