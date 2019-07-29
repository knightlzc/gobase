/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: PfUserResponse.java
 * @Package com.gobase.platform.controller.user.response
 * @date 2019年7月29日 下午7:25:53 
 */
package com.gobase.platform.controller.user.response;

import java.util.Date;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */

public class PfUserResponse {

	/**
	*自增id，主键，唯一标识一个用户
	*/
	private int id;
	
	private String uid;

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
	private String registerTime;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}
	
}
