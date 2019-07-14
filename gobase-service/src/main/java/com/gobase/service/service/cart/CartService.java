package com.gobase.service.service.cart;

import com.gobase.component.bean.mall.goods.GoodsDO;
import com.gobase.component.cache.Cart;
import com.gobase.component.constant.CartCacheConstant;
import com.gobase.component.home.cart.CartHome;
import com.gobase.component.home.goods.GoodsHome;
import com.gobase.service.dto.cart.CartDTO;
import com.gobase.service.dto.cart.CartGoodsDTO;
import com.gobase.tools.compute.PreciseCompute;
import com.gobase.tools.redis.JedisUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * 购物车service
 */
@Service
public class CartService {

    @Autowired
    private CartHome cartHome;

    @Autowired
    private GoodsHome goodsHome;

    public String addCart(int userId,String goodsId,int num){
        return cartHome.addCart(userId, goodsId, num);
    }

    public String clearCart(int userId){
        return cartHome.clearCart(userId);
    }

    public CartDTO getCart(int userId){
        CartDTO cartDTO = new CartDTO();
        ArrayList<Cart> cartList = (ArrayList<Cart>) JedisUtils.getObject(CartCacheConstant.CART_KEY_PREFIX);
        if(CollectionUtils.isEmpty(cartList)){
            return cartDTO;
        }
        List<CartGoodsDTO> list = new ArrayList<>();
        double price = 0.0;
        for (Cart cart : cartList){
            CartGoodsDTO cartGoodsDTO = new CartGoodsDTO();

            GoodsDO goodsDO = goodsHome.getByGoodsId(cartGoodsDTO.getGoodsId());
            price = PreciseCompute.add(price,goodsDO.getRealPrice());
            BeanUtils.copyProperties(goodsDO,cartGoodsDTO);
            if( !CollectionUtils.isEmpty(goodsDO.getImgs()) ) {
                cartGoodsDTO.setGoodsImg(goodsDO.getImgs().get(0).getImgUrl());
            }
            list.add(cartGoodsDTO);
        }
        cartDTO.setTotalPrice(price);
        cartDTO.setGoodsList(list);
        return  cartDTO;
    }
}
