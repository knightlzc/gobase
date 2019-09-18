/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: PfUserController.java
 * @Package com.gobase.platform.controller.user
 * @date 2019年7月26日 下午6:11:13 
 */
package com.gobase.platform.controller.user;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gobase.component.bean.mall.pfuser.PfUser;
import com.gobase.component.dao.mall.pfuser.PfUserMapper;
import com.gobase.component.home.pfuser.PfUserHome;
import com.gobase.component.home.role.RoleHome;
import com.gobase.platform.controller.user.response.PfUserResponse;
import com.gobase.platform.response.TableResponse;
import com.gobase.platform.utils.ResponseUtil;
import com.gobase.service.service.pfuser.PfuserService;
import com.gobase.tools.common.CommonUtils;
import com.gobase.tools.response.PageContent;
import com.gobase.tools.response.ResultResponse;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@Controller
@RequestMapping("pfuser")
public class PfUserController {
	
	@Autowired
	private PfUserHome pfUserHome;
	
	@Autowired
	private PfuserService pfUserService;
	
	@Autowired
	private RoleHome roleHome;
	

	@RequestMapping("listPage")
	public String listPage(){
		
		return "pfuser/pf_user_list";
	}
	@RequestMapping("addPage")
	public String addPage(){
		
		return "pfuser/pf_user_add";
	}
	
//	@ResponseBody
//	@RequestMapping("list")
//	public TableResponse<PfUser> list(String search,Integer page,Integer limit){
//		try {
//			PageContent<PfUser> content = pfUserHome.page(search, page, limit);
//			return ResponseUtil.toTableResponse(content);
//		} catch (Exception e) {
//			e.printStackTrace();
//			return TableResponse.fail(500,"查询用户列表异常 "+e.getMessage());
//			
//		}
//	}
	@ResponseBody
	@RequestMapping("list")
	public ResultResponse<PageContent<PfUserResponse>> list(String search,Integer page,Integer limit){
		try {
			PageContent<PfUser> pageResult = pfUserHome.page(search, page, limit);
			if(CollectionUtils.isEmpty(pageResult.getContent())) {
				return ResultResponse.success(new PageContent<>(page, limit, 0, new ArrayList<>()), "查询成功");
			}
			List<PfUserResponse> responses = new ArrayList<>();
			for (PfUser pfUser : pageResult.getContent()) {
				responses.add(ResponseUtil.toPfUserResponse(pfUser));
			}
			return ResultResponse.success(new PageContent<>(pageResult.getPageNum(), pageResult.getPageSize(), pageResult.getTotalNum(), responses), "查询成功");
		} catch (Exception e) {
			e.printStackTrace();
			return ResultResponse.fail("查询用户列表异常 "+e.getMessage(),"500");
			
		}
	}
	
	@ResponseBody
	@RequestMapping("add")
	public ResultResponse<String> add(String name,String nickName,Integer shopId){
		try {
			int userId = pfUserService.savePfUser(name, nickName, shopId, null);
			return ResultResponse.success(userId+"", "添加成功");
		} catch (Exception e) {
			e.printStackTrace();
			return ResultResponse.fail("添加用户列表异常 "+e.getMessage(),"500");
			
		}
	}
	
	@RequestMapping("configRolePage")
	public String configRolePage(Model model,int userId){
		PfUser user = pfUserHome.getById(userId);
		model.addAttribute("user",user);

		return "pfuser/config_role_page";
	}
	
	@ResponseBody
	@RequestMapping("saveUserRoles")
	public ResultResponse<String> saveUserRoles(String uid,String roleCodes){
		try {
			List<String> roleCodesList =CommonUtils.getListByStr(roleCodes, ";");
//			if(CollectionUtils.isEmpty(roleCodesList)) {
//				return ResultResponse.fail("请选择至少一个角色", "500");
//			}
			roleHome.saveUserRoles(uid, roleCodesList);
			return ResultResponse.success(uid,"保存成功");
		} catch (Exception e) {
			e.printStackTrace();
			return ResultResponse.fail("保存用户角色异常 "+e.getMessage(),"500");
			
		}
	}
}
