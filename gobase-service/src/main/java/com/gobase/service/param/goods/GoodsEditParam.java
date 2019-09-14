/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: GoodsParam.java
 * @Package com.gobase.service.param.goods
 * @date 2019年9月14日 下午5:48:18 
 */
package com.gobase.service.param.goods;

import java.util.List;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */

public class GoodsEditParam {

	private String goodsId;
	
	private String tinyName;
	
	private String fullName;
	
	private int totalNum;
	
	private String description;
	
	private double oriPrice;
	
	private double realPrice;
	
	private List<String> imgs;

	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	public String getTinyName() {
		return tinyName;
	}

	public void setTinyName(String tinyName) {
		this.tinyName = tinyName;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public double getOriPrice() {
		return oriPrice;
	}

	public void setOriPrice(double oriPrice) {
		this.oriPrice = oriPrice;
	}

	public double getRealPrice() {
		return realPrice;
	}

	public void setRealPrice(double realPrice) {
		this.realPrice = realPrice;
	}

	public List<String> getImgs() {
		return imgs;
	}

	public void setImgs(List<String> imgs) {
		this.imgs = imgs;
	}

	public int getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
}
