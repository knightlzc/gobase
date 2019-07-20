package com.gobase.service.dto.order;

import com.gobase.service.dto.goods.GoodsDTO;

import java.util.List;

public class OrderDTO {

	private String orderId;
    private String shopName;
    private int goodsNum;
    private double totalPrice;
    private String kuaidiNo;
    private String kuaidi;
    private List<GoodsDTO> goodsList;
    
    public void setShopName(String shopName) {
        this.shopName = shopName;
    }
    public String getShopName() {
        return shopName;
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
	public List<GoodsDTO> getGoodsList() {
		return goodsList;
	}
	public void setGoodsList(List<GoodsDTO> goodsList) {
		this.goodsList = goodsList;
	}
	public int getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}


}
