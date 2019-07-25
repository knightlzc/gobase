/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: MenuService.java
 * @Package com.gobase.service.service.menu
 * @date 2019年7月25日 下午7:01:59 
 */
package com.gobase.service.service.menu;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gobase.component.bean.mall.menu.Menu;
import com.gobase.component.constant.SystemConstant;
import com.gobase.component.home.menu.MenuHome;
import com.gobase.service.dto.menu.MenuDTO;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@Service
public class MenuService {

	@Autowired
	private MenuHome menuHome;
	
	private List<MenuDTO> listPfUserMenus(String uid) {
		List<Menu> menuList = menuHome.listBySysCode(SystemConstant.SYS_CODE_PF);
		if(CollectionUtils.isEmpty(menuList)) {
			return new ArrayList<MenuDTO>();
		}
		return null;
		
	}
	
	
}
