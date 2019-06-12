/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: ResultResponse.java
 * @Package com.gobase.tools.response
 * @date 2019年6月12日 下午4:52:00 
 */
package com.gobase.tools.response;

import java.util.HashMap;
import java.util.Objects;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 * @param <T>
 */

public class ResultResponse<T> {

	public static final int SUCCESS = 200; // 成功
	public static final int FAIL = 100; // 失败

	public int result; // result 还有
	public T data;
	public String msg;
	public String code = "0";

	public ResultResponse() {

	}

	public ResultResponse(int result, T data, String msg) {
		this.result = result;
		this.data = data;
		this.msg = msg;
		this.code = "0";
	}

	public ResultResponse(int result, T data, String msg, String code) {
		this.result = result;
		this.data = data;
		this.msg = msg;
		this.code = code;
	}

	/**
	 * 无code细分的返回结果，提供最高灵活性，msg定义好清楚描述。
	 * 
	 * @param data
	 * @param msg
	 * @return
	 */
	public static <T> ResultResponse<T> success(T data, String msg) {
		Objects.requireNonNull(data);
		return new ResultResponse<T>(SUCCESS, data, msg);
	}

	/**
	 * 有code细分的成功返回，不要求code维护位置提供灵活性，msg定义好描述。
	 * 
	 * @param data
	 *            数据，不能为null
	 * @param msg
	 *            返回结果文案描述
	 * @param msgCode
	 *            返回结果码，用于细分成功的返回码
	 * @return
	 */
	public static <T> ResultResponse<T> success(T data, String msg, String msgCode) {
		Objects.requireNonNull(data);
		return new ResultResponse<T>(SUCCESS, data, msg, msgCode);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static <T> ResultResponse<T> fail(String errorMsg, String errorCode) {
		ResultResponse<T> ret = new ResultResponse(FAIL, new HashMap(1), errorMsg, errorCode);
		return ret;
	}


	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public boolean success() {
		return this.result == SUCCESS;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public static void main(String[] args) {
		// 成功

	}
}
