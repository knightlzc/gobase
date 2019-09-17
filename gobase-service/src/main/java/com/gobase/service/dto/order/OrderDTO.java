package com.gobase.service.dto.order;

import com.gobase.service.dto.goods.GoodsDTO;

import java.util.Date;
import java.util.List;

public class OrderDTO {

	private String orderId;
    private String shopName;
    private int goodsNum;
    private double totalPrice;
    private String kuaidiNo;
    private String kuaidi;
    /**
	*收货地址id
	*/
	private int addressId;
	/**
	*用户id
	*/
	private int userId;
	
	private String userName;
	/**
	*订单创建时间
	*/
	private String createTime;
	/**
	*用户备注信息
	*/
	private String remark="";
	
	private int status;
	private String statusDesc="";
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
	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getStatusDesc() {
		return statusDesc;
	}
	public void setStatusDesc(String statusDesc) {
		this.statusDesc = statusDesc;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}


}
