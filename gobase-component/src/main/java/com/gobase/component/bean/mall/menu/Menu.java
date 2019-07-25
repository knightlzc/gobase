package com.gobase.component.bean.mall.menu;

import java.util.Date;

public class Menu {
	/**
	*自增id
	*/
	private long id;

	/**
	*菜单名称
	*/
	private String menuName="";

	/**
	*
	*/
	private String menuCode="";

	/**
	*父菜单编码
	*/
	private String pMenuCode="";

	/**
	*
	*/
	private String sysCode="";

	/**
	*菜单url，菜单跳转的url
	*/
	private String menuUrl="";

	/**
	*菜单logo
	*/
	private String menuLogo="";

	/**
	*菜单层级
	*/
	private int level;

	/**
	*排序
	*/
	private int sort;

	/**
	*创建时间
	*/
	private Date createTime;

	/**
	*更新时间
	*/
	private Date updateTime;

	/**
	*加载类型 0请选择 1 load, 2 iframe 
	*/
	private int loadType;

	public void setId(long id){
		this.id=id;
	}
	public long getId(){
		return id;
	}
	public void setMenuName(String menuName){
		this.menuName=menuName;
	}
	public String getMenuName(){
		return menuName;
	}
	public void setMenuCode(String menuCode){
		this.menuCode=menuCode;
	}
	public String getMenuCode(){
		return menuCode;
	}
	public void setPMenuCode(String pMenuCode){
		this.pMenuCode=pMenuCode;
	}
	public String getPMenuCode(){
		return pMenuCode;
	}
	public void setSysCode(String sysCode){
		this.sysCode=sysCode;
	}
	public String getSysCode(){
		return sysCode;
	}
	public void setMenuUrl(String menuUrl){
		this.menuUrl=menuUrl;
	}
	public String getMenuUrl(){
		return menuUrl;
	}
	public void setMenuLogo(String menuLogo){
		this.menuLogo=menuLogo;
	}
	public String getMenuLogo(){
		return menuLogo;
	}
	public void setLevel(int level){
		this.level=level;
	}
	public int getLevel(){
		return level;
	}
	public void setSort(int sort){
		this.sort=sort;
	}
	public int getSort(){
		return sort;
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
	public void setLoadType(int loadType){
		this.loadType=loadType;
	}
	public int getLoadType(){
		return loadType;
	}
}