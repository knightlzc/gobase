/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: UserHome.java
 * @Package com.gobase.component.home.user
 * @date 2019年9月17日 下午3:43:19 
 */
package com.gobase.component.home.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gobase.component.bean.mall.user.User;
import com.gobase.component.bean.mall.user.UserExample;
import com.gobase.component.dao.mall.user.UserMapper;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description: 用户home接口 </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@Service
public class UserHome {

	@Autowired
	private UserMapper userMapper;
	
	public User getUserById(int userId) {
		return userMapper.selectByPrimaryKey(userId);
	}
}
