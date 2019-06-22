package com.gobase.component.bean.mall.goods;

public class GoodsParam {
	/**
	*
	*/
	private int id;

	/**
	*商品id
	*/
	private String goodsId="";

	/**
	*商品属性名id
	*/
	private String paramKey="";

	/**
	*商品属性值id组合
	*/
	private String paramValue="";

	/**
	*排序
	*/
	private int sort;

	public void setId(int id){
		this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setGoodsId(String goodsId){
		this.goodsId=goodsId;
	}
	public String getGoodsId(){
		return goodsId;
	}
	public void setParamKey(String paramKey){
		this.paramKey=paramKey;
	}
	public String getParamKey(){
		return paramKey;
	}
	public void setParamValue(String paramValue){
		this.paramValue=paramValue;
	}
	public String getParamValue(){
		return paramValue;
	}
	public void setSort(int sort){
		this.sort=sort;
	}
	public int getSort(){
		return sort;
	}
}