package com.gobase.component.bean.mall.role;

import java.util.Date;

public class RoleMenuRef {
	/**
	*自增id
	*/
	private long id;

	/**
	*角色编码
	*/
	private String roleCode="";

	/**
	*菜单编码
	*/
	private String menuCode="";

	/**
	*系统编码
	*/
	private String sysCode="";

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
	public void setRoleCode(String roleCode){
		this.roleCode=roleCode;
	}
	public String getRoleCode(){
		return roleCode;
	}
	public void setMenuCode(String menuCode){
		this.menuCode=menuCode;
	}
	public String getMenuCode(){
		return menuCode;
	}
	public void setSysCode(String sysCode){
		this.sysCode=sysCode;
	}
	public String getSysCode(){
		return sysCode;
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