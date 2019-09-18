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

import com.gobase.component.bean.mall.role.PfUserRoleRef;
import com.gobase.component.bean.mall.role.PfUserRoleRefExample;
import com.gobase.component.dao.mall.role.PfUserRoleRefMapper;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Autowired
	private PfUserRoleRefMapper pfUserRoleRefMapper;

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

	public List<String> getUserRoleCodes(String uid){
		PfUserRoleRefExample example = new PfUserRoleRefExample();
		example.createCriteria().andUidEqualTo(uid);
		List<PfUserRoleRef> refs = pfUserRoleRefMapper.selectByExample(example);
		List<String> roleCodes = new ArrayList<>();
		if(CollectionUtils.isNotEmpty(refs)){
			refs.stream().forEach(ref -> {
				roleCodes.add(ref.getRoleCode());
			});
		}
		return roleCodes;
	}
	
	@Transactional
	public void saveUserRoles(String uid,List<String> roleCodes) {
		PfUserRoleRefExample example = new PfUserRoleRefExample();
		example.createCriteria().andUidEqualTo(uid);
		pfUserRoleRefMapper.deleteByExample(example);
		if(CollectionUtils.isNotEmpty(roleCodes)) {
			roleCodes.forEach(r -> {
				PfUserRoleRef ref = new PfUserRoleRef();
				ref.setUid(uid);
				ref.setRoleCode(r);
				pfUserRoleRefMapper.insertSelective(ref);
			});
		}
	}
}
