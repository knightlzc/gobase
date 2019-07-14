package com.gobase.component.cache;

/**
 * 购物车缓存类
 */
public class Cart {

    public Cart() {
    }

    public Cart(int userId, String goodsId, int num) {
        this.userId = userId;
        this.goodsId = goodsId;
        this.num = num;
    }

    private int userId;

    private String goodsId;

    private int num;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }
}
