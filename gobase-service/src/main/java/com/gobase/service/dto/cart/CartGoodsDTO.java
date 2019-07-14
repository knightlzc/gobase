package com.gobase.service.dto.cart;

public class CartGoodsDTO {
    /**
     *商品id
     */
    private String goodsId="";

    /**
     *商品短名称
     */
    private String tinyName="";

    /**
     *商品长名称
     */
    private String fullName="";

    /**
     *
     */
    private String description="";

    /**
     *商品销售价格
     */
    private double realPrice;

    private String goodsImg = "";

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public String getTinyName() {
        return tinyName;
    }

    public void setTinyName(String tinyName) {
        this.tinyName = tinyName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getRealPrice() {
        return realPrice;
    }

    public void setRealPrice(double realPrice) {
        this.realPrice = realPrice;
    }

    public String getGoodsImg() {
        return goodsImg;
    }

    public void setGoodsImg(String goodsImg) {
        this.goodsImg = goodsImg;
    }
}
