package com.gobase.component.home.cart;

import com.gobase.component.cache.Cart;
import com.gobase.component.constant.CartCacheConstant;
import com.gobase.tools.redis.JedisUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * 购物车home接口
 */
@Service
public class CartHome {

    public String addCart(int userId,String goodsId,int num){
        ArrayList<Cart> cartList = (ArrayList<Cart>) JedisUtils.getObject(CartCacheConstant.CART_KEY_PREFIX+userId);
        do {
        	if(CollectionUtils.isEmpty(cartList)){
                cartList =new ArrayList<>();
                cartList.add(new Cart(userId,goodsId,num));
                break;
            }
            for (Cart cart : cartList){
                if (cart.getGoodsId().equals(goodsId)){
                    cart.setNum(cart.getNum()+num);
                    break;
                }
            }

        }while (false);
        JedisUtils.addObject(CartCacheConstant.CART_KEY_PREFIX+userId,cartList);
        return null;
    }
    
    /**
     * <br/>Description:修改购物车
     * <p>Author:zcliu/刘子萃</p>
     * @param userId
     * @param goodsId
     * @param num
     * @return
     */
    public String updateCart(int userId, String goodsId, int num) {
    	ArrayList<Cart> cartList = (ArrayList<Cart>) JedisUtils.getObject(CartCacheConstant.CART_KEY_PREFIX+userId);
    	do {
        	if(CollectionUtils.isEmpty(cartList)){
                cartList =new ArrayList<>();
                cartList.add(new Cart(userId,goodsId,num));
                break;
            }
            for (Cart cart : cartList){
                if (cart.getGoodsId().equals(goodsId)){
                    cart.setNum(num);
                    break;
                }
            }
        }while (false);
        JedisUtils.addObject(CartCacheConstant.CART_KEY_PREFIX+userId,cartList);
        return null;
	}

    public String clearCart(int userId){
        JedisUtils.del(CartCacheConstant.CART_KEY_PREFIX+userId);
        return null;
    }

	
}
