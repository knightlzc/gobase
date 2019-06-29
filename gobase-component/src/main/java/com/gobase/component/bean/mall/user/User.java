package com.gobase.component.bean.mall.user;

import java.util.Date;

public class User {
	/**
	*
	*/
	private int id;

	/**
	*
	*/
	private String phone="";

	/**
	*
	*/
	private String name="";

	/**
	*微信id
	*/
	private String wxid="";

	/**
	*密码 密文
	*/
	private String pwd="";

	/**
	*头像url
	*/
	private String headUrl="";

	/**
	*
	*/
	private Date createTime;

	/**
	*更新时间
	*/
	private Date updateTime;

	/**
	*用户状态 0：有效；20：封禁 ；-1：删除
	*/
	private int status;

	/**
	*城市id
	*/
	private int regionId;

	public void setId(int id){
		this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setPhone(String phone){
		this.phone=phone;
	}
	public String getPhone(){
		return phone;
	}
	public void setName(String name){
		this.name=name;
	}
	public String getName(){
		return name;
	}
	public void setWxid(String wxid){
		this.wxid=wxid;
	}
	public String getWxid(){
		return wxid;
	}
	public void setPwd(String pwd){
		this.pwd=pwd;
	}
	public String getPwd(){
		return pwd;
	}
	public void setHeadUrl(String headUrl){
		this.headUrl=headUrl;
	}
	public String getHeadUrl(){
		return headUrl;
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
	public void setStatus(int status){
		this.status=status;
	}
	public int getStatus(){
		return status;
	}
	public void setRegionId(int regionId){
		this.regionId=regionId;
	}
	public int getRegionId(){
		return regionId;
	}
}