package com.gobase.component.bean.mall.goods;

import java.util.List;

public class GoodsCategoryDO {
	/**
	*类别id
	*/
	private int id;

	/**
	*类别编码
	*/
	private String code="";

	/**
	*父类编码
	*/
	private String pcode="";

	/**
	*类名
	*/
	private String name="";

	/**
	*分组编码
	*/
	private String groupCode="";

	/**
	*排序
	*/
	private int sort;
	/**
	 * 子类列表 
	 */
	private List<GoodsCategory> sublist;
	

	public List<GoodsCategory> getSublist() {
		return sublist;
	}
	
	public void setSublist(List<GoodsCategory> sublist) {
		this.sublist = sublist;
	}
	
	public void setId(int id){
		this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setCode(String code){
		this.code=code;
	}
	public String getCode(){
		return code;
	}
	public void setPcode(String pcode){
		this.pcode=pcode;
	}
	public String getPcode(){
		return pcode;
	}
	public void setName(String name){
		this.name=name;
	}
	public String getName(){
		return name;
	}
	public void setGroupCode(String groupCode){
		this.groupCode=groupCode;
	}
	public String getGroupCode(){
		return groupCode;
	}
	public void setSort(int sort){
		this.sort=sort;
	}
	public int getSort(){
		return sort;
	}
}
