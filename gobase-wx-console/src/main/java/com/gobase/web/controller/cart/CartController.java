package com.gobase.web.controller.cart;

import com.gobase.service.dto.cart.CartDTO;
import com.gobase.service.service.cart.CartService;
import com.gobase.tools.response.ResultResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("cart")
@RestController
public class CartController {

    @Autowired
    private CartService cartService;

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
}
