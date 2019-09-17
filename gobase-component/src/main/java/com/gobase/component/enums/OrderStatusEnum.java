package com.gobase.component.enums;

/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Company: 人人公司  http://www.renren-inc.com</p> 
 * <p>Description: 合同业务类型枚举类 </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
public enum OrderStatusEnum {
	

	
	STATUS_NO_PAY(0,"待支付"),
	STATUS_PAYED(1,"待收货"),
	STATUS_FINISH(10,"已收货"),
	STATUS_CANCEL(200,"订单取消"),
	STATUS_CANCEL_APPLY(201,"申请取消"),
	STATUS_DELETE(-1,"订单删除"),
	;
	
	
	private int code;
	
	private String desc;
	
	OrderStatusEnum(int code, String desc){
		this.code = code;
		this.desc = desc;
	}
	
	public static String getDescByValue(int code) {
		OrderStatusEnum[] enums = OrderStatusEnum.values();
		for (OrderStatusEnum status : enums) {
			if(status.code == code) {
				return status.desc();
			}
		}
		return null;
	}
	
	public int code(){
		return this.code;
	}
	
	public String desc(){
		return this.desc;
	}
}
