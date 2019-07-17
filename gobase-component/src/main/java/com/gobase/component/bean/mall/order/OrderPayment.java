package com.gobase.component.bean.mall.order;

import java.math.BigDecimal;
import java.util.Date;

public class OrderPayment {
	
	/**
	 * 支付成功
	 */
	public static int STATUS_NO_PAY = 0;
	
	/**
	 * 支付中
	 */
	public static int STATUS_PAYING = 1;
	
	/**
	 * 支付成功
	 */
	public static int STATUS_SUC = 10;
	
	/**
	 * 取消支付
	 */
	public static int STATUS_CANCEL = 20;
	
	/**
	 * 支付失败
	 */
	public static int STATUS_FAIL = 21;
	/**
	*
	*/
	private int id;

	/**
	*订单号
	*/
	private String orderId="";

	/**
	*支付编号
	*/
	private String payId="";

	/**
	*微信支付编号
	*/
	private String wxPayId="";

	/**
	*支付金额
	*/
	private double amount;

	/**
	*
	*/
	private Date createTime;

	/**
	*状态 0 待支付 1 支付中 10 支付完成 20 取消支付 21 支付失败 
	*/
	private int status;

	/**
	*
	*/
	private Date updateTime;

	public void setId(int id){
		this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setOrderId(String orderId){
		this.orderId=orderId;
	}
	public String getOrderId(){
		return orderId;
	}
	public void setPayId(String payId){
		this.payId=payId;
	}
	public String getPayId(){
		return payId;
	}
	public void setWxPayId(String wxPayId){
		this.wxPayId=wxPayId;
	}
	public String getWxPayId(){
		return wxPayId;
	}
	public void setAmount(double amount){
		this.amount=amount;
	}
	public double getAmount(){
		return amount;
	}
	public void setCreateTime(Date createTime){
		this.createTime=createTime;
	}
	public Date getCreateTime(){
		return createTime;
	}
	public void setStatus(int status){
		this.status=status;
	}
	public int getStatus(){
		return status;
	}
	public void setUpdateTime(Date updateTime){
		this.updateTime=updateTime;
	}
	public Date getUpdateTime(){
		return updateTime;
	}
}