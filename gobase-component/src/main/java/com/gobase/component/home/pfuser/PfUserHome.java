/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: PfUserHome.java
 * @Package com.gobase.component.home.pfuser
 * @date 2019年7月26日 下午6:11:42 
 */
package com.gobase.component.home.pfuser;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gobase.component.bean.mall.pfuser.PfUser;
import com.gobase.component.bean.mall.pfuser.PfUserExample;
import com.gobase.component.dao.mall.pfuser.PfUserMapper;
import com.gobase.tools.page.PageUtil;
import com.gobase.tools.response.PageContent;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@Service
public class PfUserHome {

	@Autowired
	private PfUserMapper pfUserMapper;
	
	public List<PfUser>listAll() {
		PfUserExample example = new PfUserExample();
		return pfUserMapper.selectByExample(example);
	}
	
	public PageContent<PfUser> page(String search,int pageNum,int pageSize) {
		PfUserExample example = new PfUserExample();
		PfUserExample.Criteria criteria = example.or();
		if(StringUtils.isNotBlank(search)) {
			criteria.andNameLike(search).andNickNameLike(search);
		}
		int count = (int) pfUserMapper.countByExample(example);
		if(count <= 0) {
			return new PageContent<>(pageNum, pageSize, 0, new ArrayList<PfUser>());
		}
		example.setOrderByClause(" register_time desc limit "+PageUtil.getStart(pageNum, pageSize)+","+PageUtil.getLimit(pageNum, pageSize));
		List<PfUser> content = pfUserMapper.selectByExample(example);
		return new PageContent<>(pageNum, pageSize, count,content);
	}
}
