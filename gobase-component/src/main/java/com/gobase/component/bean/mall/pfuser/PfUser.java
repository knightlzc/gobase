package com.gobase.component.bean.mall.pfuser;

import java.util.Date;

public class PfUser {
	
	/**
	*自增id，主键，唯一标识一个用户
	*/
	private int id;

	/**
	*存储用户英文名
	*/
	private String name="";

	/**
	*运营人员密码
	*/
	private String password="";

	/**
	*存储用户中文名
	*/
	private String nickName="";

	/**
	*
	*/
	private Date registerTime;

	/**
	*
	*/
	private Date pwdUpdateTime;

	/**
	*状态
	*/
	private int status;

	/**
	*用户标识
	*/
	private String uid="";

	public void setId(int id){
		this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setName(String name){
		this.name=name;
	}
	public String getName(){
		return name;
	}
	public void setPassword(String password){
		this.password=password;
	}
	public String getPassword(){
		return password;
	}
	public void setNickName(String nickName){
		this.nickName=nickName;
	}
	public String getNickName(){
		return nickName;
	}
	public void setRegisterTime(Date registerTime){
		this.registerTime=registerTime;
	}
	public Date getRegisterTime(){
		return registerTime;
	}
	public void setPwdUpdateTime(Date pwdUpdateTime){
		this.pwdUpdateTime=pwdUpdateTime;
	}
	public Date getPwdUpdateTime(){
		return pwdUpdateTime;
	}
	public void setStatus(int status){
		this.status=status;
	}
	public int getStatus(){
		return status;
	}
	public void setUid(String uid){
		this.uid=uid;
	}
	public String getUid(){
		return uid;
	}
}