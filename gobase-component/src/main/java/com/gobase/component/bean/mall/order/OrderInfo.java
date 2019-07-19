package com.gobase.component.bean.mall.order;

import java.util.Date;
import java.math.BigDecimal;

public class OrderInfo {
	
	/**
	 * 待支付
	 */
	public static int STATUS_NO_PAY = 0;
	
	/**
	 * 已支付（待收货）
	 */
	public static int STATUS_PAYED = 1;
	
	/**
	 * 订单完成（已收货）
	 */
	public static int STATUS_FINISH = 10;
	
	/**
	 * 取消
	 */
	public static int STATUS_CANCEL = 200;
	
	/**
	 * 删除
	 */
	public static int STATUS_DELETE = -1;
	
	/**
	*自增id
	*/
	private int id;

	/**
	*订单号
	*/
	private String orderId="";

	/**
	 * 父订单号
	 */
	private String porderId="";

	/**
	*用户id
	*/
	private int userId;

	/**
	*
	*/
	private int regionId;

	/**
	*订单状态
	*/
	private int status;

	/**
	*商品id
	*/
	private String goodsId="";

	/**
	*用户备注信息
	*/
	private String remark="";

	/**
	*收货地址id
	*/
	private int addressId;

	/**
	*订单创建时间
	*/
	private Date createTime;

	/**
	*快递名称
	*/
	private String kuaidiName="";

	/**
	*快递单号
	*/
	private String kuaidiOrder="";

	/**
	*快递费
	*/
	private double kuaidiPrice;

	/**
	*满减金额
	*/
	private double manjianPrice;

	/**
	*用户使用的优惠券的Id
	*/
	private int userCouponsId;

	/**
	*使用优惠券的价格
	*/
	private double couponsPrice;

	/**
	*优惠券类型
	*/
	private int couponsType;

	/**
	*降息比例
	*/
	private double reduceIntrRate;

	/**
	*发货时间
	*/
	private Date deliverTime;

	/**
	*总价格
	*/
	private double totalPrice;

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
	public void setUserId(int userId){
		this.userId=userId;
	}
	public int getUserId(){
		return userId;
	}
	public void setRegionId(int regionId){
		this.regionId=regionId;
	}
	public int getRegionId(){
		return regionId;
	}
	public void setStatus(int status){
		this.status=status;
	}
	public int getStatus(){
		return status;
	}
	public void setGoodsId(String goodsId){
		this.goodsId=goodsId;
	}
	public String getGoodsId(){
		return goodsId;
	}
	public void setRemark(String remark){
		this.remark=remark;
	}
	public String getRemark(){
		return remark;
	}
	public void setAddressId(int addressId){
		this.addressId=addressId;
	}
	public int getAddressId(){
		return addressId;
	}
	public void setCreateTime(Date createTime){
		this.createTime=createTime;
	}
	public Date getCreateTime(){
		return createTime;
	}
	public void setKuaidiName(String kuaidiName){
		this.kuaidiName=kuaidiName;
	}
	public String getKuaidiName(){
		return kuaidiName;
	}
	public void setKuaidiOrder(String kuaidiOrder){
		this.kuaidiOrder=kuaidiOrder;
	}
	public String getKuaidiOrder(){
		return kuaidiOrder;
	}
	public void setKuaidiPrice(double kuaidiPrice){
		this.kuaidiPrice=kuaidiPrice;
	}
	public double getKuaidiPrice(){
		return kuaidiPrice;
	}
	public void setManjianPrice(double manjianPrice){
		this.manjianPrice=manjianPrice;
	}
	public double getManjianPrice(){
		return manjianPrice;
	}
	public void setUserCouponsId(int userCouponsId){
		this.userCouponsId=userCouponsId;
	}
	public int getUserCouponsId(){
		return userCouponsId;
	}
	public void setCouponsPrice(double couponsPrice){
		this.couponsPrice=couponsPrice;
	}
	public double getCouponsPrice(){
		return couponsPrice;
	}
	public void setCouponsType(int couponsType){
		this.couponsType=couponsType;
	}
	public int getCouponsType(){
		return couponsType;
	}
	public void setReduceIntrRate(double reduceIntrRate){
		this.reduceIntrRate=reduceIntrRate;
	}
	public double getReduceIntrRate(){
		return reduceIntrRate;
	}
	public void setDeliverTime(Date deliverTime){
		this.deliverTime=deliverTime;
	}
	public Date getDeliverTime(){
		return deliverTime;
	}
	public void setTotalPrice(double totalPrice){
		this.totalPrice=totalPrice;
	}
	public double getTotalPrice(){
		return totalPrice;
	}

	public String getPorderId() {
		return porderId;
	}

	public void setPorderId(String porderId) {
		this.porderId = porderId;
	}
}