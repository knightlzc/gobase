/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: RoleHome.java
 * @Package com.gobase.component.home.role
 * @date 2019年9月17日 下午5:06:47 
 */
package com.gobase.component.home.role;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gobase.component.bean.mall.role.Role;
import com.gobase.component.bean.mall.role.RoleExample;
import com.gobase.component.dao.mall.role.RoleMapper;
import com.gobase.tools.page.PageUtil;
import com.gobase.tools.response.PageContent;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description: 角色home接口 </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@Service
public class RoleHome {
	
	@Autowired
	private RoleMapper roleMapper;

	public PageContent<Role> page(String search,int pageNum,int pageSize){
		RoleExample example = new RoleExample();
		if(StringUtils.isNotBlank(search)) {
			example.createCriteria().andRoleNameLike("%"+search+"%");
			example.or(example.createCriteria().andRoleCodeLike("%"+search+"%"));
		}
		int count = (int) roleMapper.countByExample(example);
		if(count <= 0) {
			return new PageContent<>(pageNum, pageSize, 0, new ArrayList<Role>());
		}
		example.setOrderByClause(" create_time desc limit "+PageUtil.getStart(pageNum, pageSize)+","+PageUtil.getLimit(pageNum, pageSize));
		List<Role> content = roleMapper.selectByExample(example);
		return new PageContent<>(pageNum, pageSize, count,content);
	}
	
	public List<Role> list(String search){
		RoleExample example = new RoleExample();
		if(StringUtils.isNotBlank(search)) {
			example.createCriteria().andRoleNameLike("%"+search+"%");
			example.or(example.createCriteria().andRoleCodeLike("%"+search+"%"));
		}
		example.setOrderByClause(" create_time desc ");
		List<Role> content = roleMapper.selectByExample(example);
		return content;
	}
}
