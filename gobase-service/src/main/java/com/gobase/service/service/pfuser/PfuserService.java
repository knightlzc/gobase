/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: PfuserService.java
 * @Package com.gobase.service.service.pfuser
 * @date 2019年9月11日 下午4:02:57 
 */
package com.gobase.service.service.pfuser;

import java.util.Date;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gobase.component.bean.mall.pfuser.PfUser;
import com.gobase.component.dao.mall.pfuser.PfUserMapper;
import com.gobase.component.home.pfuser.PfUserHome;
import com.gobase.tools.common.MD5Util;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@Service
public class PfuserService {

	@Autowired
	private PfUserHome pfUserHome;
	
	@Autowired
	private PfUserMapper pfUserMapper;
	
	@Transactional
	public int savePfUser(String name,String nickName,int shopId,String pwd) throws Exception {
		PfUser user = pfUserHome.getByName(nickName);
		if(user == null) {
			user = new PfUser();
			user.setUid(UUID.randomUUID().toString());
		}
		user.setName(name);
		user.setNickName(nickName);
		if(StringUtils.isBlank(pwd)) {
			pwd = "12345678a";
		}
		user.setPassword(MD5Util.md5(pwd));
		user.setPwdUpdateTime(new Date());
		pfUserHome.save(user);
		pfUserHome.saveShop(user.getUid(), shopId);
		return user.getId();
	}
	
	public static void main(String[] args) {
		String uuid = UUID.randomUUID().toString();
		System.out.println(uuid);
		System.out.println(UUID.fromString(uuid));
	}
	
}
