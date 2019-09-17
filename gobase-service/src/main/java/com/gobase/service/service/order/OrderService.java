/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: OrderService.java
 * @Package com.gobase.service.service.order
 * @date 2019年7月16日 下午1:45:35 
 */
package com.gobase.service.service.order;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gobase.component.bean.mall.goods.GoodsDO;
import com.gobase.component.bean.mall.order.OrderDO;
import com.gobase.component.bean.mall.order.OrderGoodsRef;
import com.gobase.component.bean.mall.order.OrderInfo;
import com.gobase.component.bean.mall.order.OrderPayment;
import com.gobase.component.bean.mall.user.User;
import com.gobase.component.cache.Cart;
import com.gobase.component.dao.mall.goods.GoodsMapper;
import com.gobase.component.dao.mall.order.OrderGoodsRefMapper;
import com.gobase.component.dao.mall.order.OrderInfoMapper;
import com.gobase.component.dao.mall.order.OrderPaymentMapper;
import com.gobase.component.dao.mall.user.UserMapper;
import com.gobase.component.enums.OrderStatusEnum;
import com.gobase.component.home.goods.GoodsHome;
import com.gobase.component.home.order.OrderHome;
import com.gobase.component.home.user.UserHome;
import com.gobase.component.param.order.QueryOrderParam;
import com.gobase.service.dto.goods.GoodsDTO;
import com.gobase.service.dto.order.OrderDTO;
import com.gobase.service.param.order.OrderParam;
import com.gobase.tools.common.IDCreater;
import com.gobase.tools.compute.PreciseCompute;
import com.gobase.tools.date.DateUtils;
import com.gobase.tools.page.PageUtil;
import com.gobase.tools.response.PageContent;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@Service
public class OrderService {
	
	@Autowired
	private OrderInfoMapper orderMapper;
	
	@Autowired
	private OrderGoodsRefMapper orderGoodsRefMapper;
	
	@Autowired
	private OrderHome orderHome;
	
	@Autowired
	private GoodsHome goodsHome;
	
	@Autowired
	private OrderPaymentMapper orderPaymentMapper;
	
	@Autowired
	private UserHome userHome;

	/**
	 * 
	 * <br/>Description:查询订单列表
	 * <p>Author:zcliu/刘子萃</p>
	 * @param userId
	 * @param status
	 * @param pageNum
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public PageContent<OrderDTO> pageOrders(Integer userId,Integer status,int pageNum,int pageSize) throws Exception{
		QueryOrderParam param = new QueryOrderParam();
		param.setUserId(userId);
		if(status != -999) {
			param.setStatus(status);
		}
		int count = orderMapper.countOrders(param);
		if(count <= 0) {
			return new PageContent<>(pageNum, pageSize, 0, new ArrayList<>());
		}
		List<OrderDO> orderList = orderMapper.pageOrders(param,PageUtil.getStart(pageNum, pageSize),PageUtil.getLimit(pageNum, pageSize));
		List<OrderDTO> content = new ArrayList<>();
		for (OrderDO orderDO : orderList) {
			content.add(toOrderDTO(orderDO));
		}
		return new PageContent<OrderDTO>(pageNum, pageSize,count,content);
	}
	
	public PageContent<OrderDTO> pageMgrOrders(String search,Integer shopId,Integer userId,Integer status,int pageNum,int pageSize) throws Exception{
		QueryOrderParam param = new QueryOrderParam();
		if(null != shopId) {
			param.setShopId(shopId);
		}
		if(null != userId) {
			param.setUserId(userId);
		}
		if(null != status && status != -999) {
			param.setStatus(status);
		}
		int count = orderMapper.countOrders(param);
		if(count <= 0) {
			return new PageContent<>(pageNum, pageSize, 0, new ArrayList<>());
		}
		List<OrderDO> orderList = orderMapper.pageOrders(param,PageUtil.getStart(pageNum, pageSize),PageUtil.getLimit(pageNum, pageSize));
		List<OrderDTO> content = new ArrayList<>();
		for (OrderDO orderDO : orderList) {
			content.add(toOrderDTO(orderDO));
		}
		return new PageContent<OrderDTO>(pageNum, pageSize,count,content);
	}
	
	private OrderDTO toOrderDTO(OrderDO orderDO) throws Exception {
		OrderDTO orderDTO = new OrderDTO();
		BeanUtils.copyProperties(orderDO, orderDTO);
		
		User user = userHome.getUserById(orderDO.getUserId());
		if(null != user) {
			orderDTO.setUserName(user.getName());
		}
		orderDTO.setStatusDesc(OrderStatusEnum.getDescByValue(orderDO.getStatus()));
		orderDTO.setCreateTime(DateUtils.getDateToString(orderDO.getCreateTime(), "yyyy-MM-dd HH:mm:ss"));
		List<GoodsDO> goodsDOList = orderHome.getGoodsList(orderDO.getOrderId());
		if(CollectionUtils.isNotEmpty(goodsDOList)) {
			List<GoodsDTO> goodsDTOList = new ArrayList<>();
			orderDTO.setGoodsList(goodsDTOList);
			for (GoodsDO goodsDO : goodsDOList) {
				goodsDTOList.add(toGoodsDTO(goodsDO));
			}
			orderDTO.setGoodsNum(goodsDTOList.size());
		}
		return orderDTO;
		
	}
	
	public GoodsDTO toGoodsDTO(GoodsDO goodsDO) throws Exception {
		GoodsDTO dto = new GoodsDTO();
		BeanUtils.copyProperties(goodsDO, dto);
		return dto;
	}
	@Transactional
	public String placeOrder(int userId, List<Cart> cartList, OrderParam param) throws Exception {
		if(CollectionUtils.isEmpty(cartList)) {
			throw new Exception("购物车为空");
		}
		String orderId = IDCreater.generate("GO");
		OrderInfo order = new OrderInfo();
		order.setOrderId(orderId);
		order.setUserId(userId);
		double orderAmount = 0.0;
		for (Cart cart : cartList) {
			OrderGoodsRef ref = new OrderGoodsRef();
			ref.setOrderId(orderId);
			ref.setPorderId(orderId);
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
		order.setTotalPrice(orderAmount);
		orderMapper.insert(order);
		
		// TODO 待支付信息
		OrderPayment orderPayment = new OrderPayment();
		orderPayment.setAmount(order.getTotalPrice());
		orderPayment.setStatus(OrderPayment.STATUS_NO_PAY);
		orderPayment.setOrderId(orderId);
		orderPaymentMapper.insert(orderPayment);
		return orderId;
	}

	@Transactional
	public String payOrder(String orderId) throws Exception{
		OrderDO orderDO = orderHome.getOrderDOByOrderId(orderId);
		OrderInfo order = orderHome.getOrderByOrderId(orderId);
		if(null == orderDO){
			return "订单不存在";
		}
		Map<Integer,List<GoodsDO>> shopGoodsMap = new HashMap<>();
		if (CollectionUtils.isEmpty(orderDO.getGoodsList())){
			return "该订单没有商品";
		}
		for (GoodsDO goodsDO : orderDO.getGoodsList()){
			if(null != shopGoodsMap.get(goodsDO.getShopId())){
				List<GoodsDO> list = new ArrayList<>();
				list.add(goodsDO);
				shopGoodsMap.put(goodsDO.getShopId(),list);
			} else {
				shopGoodsMap.get(goodsDO.getShopId()).add(goodsDO);
			}
		}
		//是否需要拆分订单
		if(shopGoodsMap.size()>1) {
			subOrders(order, shopGoodsMap);
		} else {
			order.setStatus(OrderInfo.STATUS_PAYED);
			orderHome.updateOrder(order);
		}
		return null;
	}
	
	/**
	 * <br/>Description:拆分订单
	 * <p>Author:zcliu/刘子萃</p>
	 * @param order
	 * @param shopGoodsMap
	 * @return
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	private String subOrders(OrderInfo order,Map<Integer,List<GoodsDO>> shopGoodsMap) throws Exception {
		for (int shopId : shopGoodsMap.keySet()) {
			String orderId = IDCreater.generate("GOS");
			OrderInfo subOrder = new OrderInfo();
			BeanUtils.copyProperties(order, subOrder);
			subOrder.setOrderId(orderId);
			subOrder.setUserId(order.getUserId());
			subOrder.setPorderId(order.getOrderId());
			subOrder.setStatus(OrderInfo.STATUS_PAYED);
			orderHome.saveOrder(subOrder);
			List<GoodsDO> goodsList = shopGoodsMap.get(shopId);
			for (GoodsDO goodsDO : goodsList) {
				orderHome.resetOrderGoodsOrderId(goodsDO.getGoodsId(), orderId, order.getOrderId());
			}
		}
		order.setStatus(OrderInfo.STATUS_DELETE);
		orderHome.updateOrder(order);
		//TODO pay ment update
		return null;
	}
	public static void main(String[] args) {
		System.out.println(IDCreater.generate("123"));
	}
}
