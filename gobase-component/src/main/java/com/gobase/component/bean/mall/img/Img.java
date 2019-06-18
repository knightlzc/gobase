package com.gobase.component.bean.mall.img;

import java.util.Date;

/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description: 图片 </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
public class Img {
	/**
	*
	*/
	private long id;

	/**
	*业务id
	*/
	private String bizId="";

	/**
	*业务类型 1 商品
	*/
	private int bizType;

	/**
	*
	*/
	private String imgUrl="";

	/**
	*状态 0 有效 -1 删除
	*/
	private int status;

	/**
	*
	*/
	private Date createTime;

	/**
	*
	*/
	private Date updateTime;

	public void setId(long id){
		this.id=id;
	}
	public long getId(){
		return id;
	}
	public void setBizId(String bizId){
		this.bizId=bizId;
	}
	public String getBizId(){
		return bizId;
	}
	public void setBizType(int bizType){
		this.bizType=bizType;
	}
	public int getBizType(){
		return bizType;
	}
	public void setImgUrl(String imgUrl){
		this.imgUrl=imgUrl;
	}
	public String getImgUrl(){
		return imgUrl;
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