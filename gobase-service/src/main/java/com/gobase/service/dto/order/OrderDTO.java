package com.gobase.service.dto.order;

import com.gobase.service.dto.goods.GoodsDTO;

import java.util.List;

public class OrderDTO {

    private String shopName;
    private String goodsNum;
    private String totalPrice;
    private String kuaidiNo;
    private String kuaidi;
    private List<GoodsDTO> goodsList;
    public void setShopName(String shopName) {
        this.shopName = shopName;
    }
    public String getShopName() {
        return shopName;
    }

    public void setGoodsNum(String goodsNum) {
        this.goodsNum = goodsNum;
    }
    public String getGoodsNum() {
        return goodsNum;
    }

    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }
    public String getTotalPrice() {
        return totalPrice;
    }

    public void setKuaidiNo(String kuaidiNo) {
        this.kuaidiNo = kuaidiNo;
    }
    public String getKuaidiNo() {
        return kuaidiNo;
    }

    public void setKuaidi(String kuaidi) {
        this.kuaidi = kuaidi;
    }
    public String getKuaidi() {
        return kuaidi;
    }


}
