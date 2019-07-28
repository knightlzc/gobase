/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: TableResponse.java
 * @Package com.gobase.platform.response
 * @date 2019年7月26日 下午7:15:44 
 */
package com.gobase.platform.response;

import java.util.ArrayList;
import java.util.List;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description: layui响应类 </p> 
 * <p>Author:zcliu/刘子萃</p>
 * @param <T>
 */

public class TableResponse<T> {
	
	public static final int SUCCESS = 0; // 成功

	private int code;
	
	private String msg;
	
	private int count;
	
	private List<T> data;
	
	public TableResponse() {

	}

	public TableResponse(int code,int count, List<T> data, String msg) {
		this.code = code;
		this.count = count;
		this.data = data;
		this.msg = msg;
	}
	
	public static <T> TableResponse<T> suc(int count,List<T> data) {
		return new TableResponse<T>(SUCCESS,count,data,"");
	}
	
	public static <T> TableResponse<T> fail(int code,String msg) {
		return new TableResponse<T>(code,0,new ArrayList<>(),msg);
	}
	
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}
}
