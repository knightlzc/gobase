package com.gobase.service.dto.cart;

import com.gobase.component.bean.mall.goods.GoodsDO;

import java.util.List;

public class CartDTO {

    private double totalPrice;

    private int num;

    private List<CartGoodsDTO> goodsList;

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public List<CartGoodsDTO> getGoodsList() {
        return goodsList;
    }

    public void setGoodsList(List<CartGoodsDTO> goodsList) {
        this.goodsList = goodsList;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }
}
