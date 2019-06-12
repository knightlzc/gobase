package com.gobase.service.dto.user;
/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:用户载体信息  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
public class HostUser {
	
	private int userId;
	private String phone;
	private int status;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
}
