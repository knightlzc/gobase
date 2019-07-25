package com.gobase.service.dto.user;
/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:用户载体信息  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
public class HostPfUser {
	
	private int userId;
	private int shopId;
	private String uid;
	private int status;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public int getShopId() {
		return shopId;
	}
	public void setShopId(int shopId) {
		this.shopId = shopId;
	}
	
}
