package com.gobase.component.cache;

import java.io.Serializable;

/**
 * 购物车缓存类
 */
public class Cart implements Serializable{

    /**
	 * <p>Description: </p>
	 * <p>Author:zcliu/刘子萃</p>
	 * @Fields serialVersionUID 
	 */
	private static final long serialVersionUID = 6702590346246863101L;

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
