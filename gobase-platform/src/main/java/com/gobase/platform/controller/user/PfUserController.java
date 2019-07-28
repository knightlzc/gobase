/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: PfUserController.java
 * @Package com.gobase.platform.controller.user
 * @date 2019年7月26日 下午6:11:13 
 */
package com.gobase.platform.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gobase.component.bean.mall.pfuser.PfUser;
import com.gobase.component.dao.mall.pfuser.PfUserMapper;
import com.gobase.component.home.pfuser.PfUserHome;
import com.gobase.platform.response.TableResponse;
import com.gobase.platform.utils.ResponseUtil;
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
	

	@RequestMapping("listPage")
	public String listPage(){
		
		return "pfuser/pf_user_list";
	}
	
	@ResponseBody
	@RequestMapping("list")
	public TableResponse<PfUser> list(String search,Integer page,Integer limit){
		try {
			PageContent<PfUser> content = pfUserHome.page(search, page, limit);
			return ResponseUtil.toTableResponse(content);
		} catch (Exception e) {
			e.printStackTrace();
			return TableResponse.fail(500,"查询用户列表异常 "+e.getMessage());
			
		}
	}
}
