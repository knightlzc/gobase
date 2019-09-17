/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: RoleController.java
 * @Package com.gobase.platform.controller.role
 * @date 2019年9月17日 下午5:04:53 
 */
package com.gobase.platform.controller.role;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gobase.component.bean.mall.role.Role;
import com.gobase.component.home.role.RoleHome;
import com.gobase.tools.response.PageContent;
import com.gobase.tools.response.ResultResponse;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@Controller
@RequestMapping("role")
public class RoleController {
	
	@Autowired
	private RoleHome roleHome;

	@RequestMapping("listPage")
	public String listPage(){
		return "role/role_list";
	}
	
	@ResponseBody
	@RequestMapping("list")
    public ResultResponse<PageContent<Role>> list(String search,int page,int limit){
    	try {
    		if(limit<=0) {
    			limit = 10;
    		}
    		PageContent<Role> pageContent = roleHome.page(search, page, limit);
    		return ResultResponse.success(pageContent, "");
		} catch (Exception e) {
			e.printStackTrace();
			return ResultResponse.fail("查询列表失败", "");
		}
    }
	
}
