package com.gobase.component.bean.mall.order;

/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:订单商品映射表  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
public class OrderGoodsRef {
	/**
	*
	*/
	private int id;
	
	/**
	 *订单号
	 */
	private String porderId="";

	/**
	*订单号
	*/
	private String orderId="";

	/**
	*商品id
	*/
	private String skuId="";

	/**
	*商品数量
	*/
	private int skuNum;

	/**
	*总价格
	*/
	private double totalPrice;

	/**
	*单价
	*/
	private double perPrice;

	/**
	*满减活动id
	*/
	private int manjianId;

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
	public void setSkuId(String skuId){
		this.skuId=skuId;
	}
	public String getSkuId(){
		return skuId;
	}
	public void setSkuNum(int skuNum){
		this.skuNum=skuNum;
	}
	public int getSkuNum(){
		return skuNum;
	}
	public void setTotalPrice(double totalPrice){
		this.totalPrice=totalPrice;
	}
	public double getTotalPrice(){
		return totalPrice;
	}
	public void setPerPrice(double perPrice){
		this.perPrice=perPrice;
	}
	public double getPerPrice(){
		return perPrice;
	}
	public void setManjianId(int manjianId){
		this.manjianId=manjianId;
	}
	public int getManjianId(){
		return manjianId;
	}
	public String getPorderId() {
		return porderId;
	}
	public void setPorderId(String porderId) {
		this.porderId = porderId;
	}
}