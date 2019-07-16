/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: OrderService.java
 * @Package com.gobase.service.service.order
 * @date 2019年7月16日 下午1:45:35 
 */
package com.gobase.service.service.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gobase.service.param.order.OrderParam;
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
	public String placeOrder(int userId, List<Cart> cartList, OrderParam param) throws Exception {
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
		order.setAddressId(param.getAddressId());
		order.setKuaidiPrice(param.getKuaidiPrice());
		orderMapper.insert(order);
		// TODO 待支付信息
		return orderId;
	}

	public String payOrder(String orderId){
		OrderDO orderDO = orderHome.getOrderDOByOrderId(orderId);

		if(null == orderDO){
			return "订单不存在";
		}
		Map<Integer,List<GoodsDO>> shopGoodsMap = new HashMap<>();
		if (CollectionUtils.isEmpty(orderDO.getGoodsList())){
			return "该订单没有商品";
		}
		//是否需要拆分订单
		boolean subOrder = false;
		for (GoodsDO goodsDO : orderDO.getGoodsList()){
			if(null != shopGoodsMap.get(goodsDO.getShopId())){
				List<GoodsDO> list = new ArrayList<>();
				list.add(goodsDO);
				shopGoodsMap.put(goodsDO.getShopId(),list);
			} else {
				shopGoodsMap.get(goodsDO.getShopId()).add(goodsDO);
			}
		}

		return null;
	}
	
	public static void main(String[] args) {
		System.out.println(IDCreater.generate("123"));
	}
}
