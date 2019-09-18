package com.gobase.component.bean.mall.role;

import java.util.Date;

public class PfUserRoleRef {
	
	/**
	*
	*/
	private long id;

	/**
	*uid
	*/
	private String uid="";

	/**
	*角色编码
	*/
	private String roleCode="";

	/**
	*状�??
	*/
	private int status;

	/**
	*创建时间
	*/
	private Date createTime;

	/**
	*更新时间
	*/
	private Date updateTime;

	public void setId(long id){
		this.id=id;
	}
	public long getId(){
		return id;
	}
	public void setUid(String uid){
		this.uid=uid;
	}
	public String getUid(){
		return uid;
	}
	public void setRoleCode(String roleCode){
		this.roleCode=roleCode;
	}
	public String getRoleCode(){
		return roleCode;
	}
	public void setStatus(int status){
		this.status=status;
	}
	public int getStatus(){
		return status;
	}
	public void setCreateTime(Date createTime){
		this.createTime=createTime;
	}
	public Date getCreateTime(){
		return createTime;
	}
	public void setUpdateTime(Date updateTime){
		this.updateTime=updateTime;
	}
	public Date getUpdateTime(){
		return updateTime;
	}
}