package com.gobase.web.controller.cart;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPObject;
import com.alibaba.fastjson.TypeReference;
import com.gobase.component.cache.Cart;
import com.gobase.service.dto.cart.CartDTO;
import com.gobase.service.param.order.OrderParam;
import com.gobase.service.service.cart.CartService;
import com.gobase.service.service.order.OrderService;
import com.gobase.tools.response.ResultResponse;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequestMapping("cart")
@RestController
public class CartController {



    @Autowired
    private CartService cartService;
    @Autowired
    private OrderService orderService;

    @RequestMapping("add")
    public ResultResponse<String> addCart(String goodsId,int num){
        try {
            cartService.addCart(0,goodsId,num);
            return ResultResponse.success("","");
        } catch (Exception e){
            e.printStackTrace();
            return ResultResponse.fail(e.getMessage(),"添加购物车异常");
        }
    }

    @RequestMapping("clearAll")
    public ResultResponse<String> clearCart(){
        try {
            cartService.clearCart(0);
            return ResultResponse.success("","");
        } catch (Exception e){
            e.printStackTrace();
            return ResultResponse.fail(e.getMessage(),"清空购物车异常");
        }
    }

    @RequestMapping("list")
    public ResultResponse<CartDTO> list(){
        try {
            CartDTO cart = cartService.getCart(0);
            return ResultResponse.success(cart,"");
        } catch (Exception e){
            e.printStackTrace();
            return ResultResponse.fail(e.getMessage(),"查询购物车异常");
        }
    }

    @RequestMapping("settlement")
    public ResultResponse<String> settlement(String cartList,int addressId,double kuaidiPrice){
        try {
            List<Cart> carts = JSONObject.parseObject(cartList,new TypeReference<List<Cart>>(){});
            if(CollectionUtils.isEmpty(carts)){
                return ResultResponse.fail("购物车空空如也","fail");
            }
            OrderParam orderParam = new OrderParam();
            orderParam.setAddressId(addressId);
            orderParam.setKuaidiPrice(kuaidiPrice);
            String orderId = orderService.placeOrder(0,carts,orderParam);
            return ResultResponse.success(orderId,"");
        } catch (Exception e){
            e.printStackTrace();
            return ResultResponse.fail(e.getMessage(),"结算异常");
        }
    }
}
