/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: MenuHome.java
 * @Package com.gobase.component.home.menu
 * @date 2019年7月25日 下午6:54:25 
 */
package com.gobase.component.home.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gobase.component.bean.mall.menu.Menu;
import com.gobase.component.bean.mall.menu.MenuExample;
import com.gobase.component.dao.mall.menu.MenuMapper;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description: 菜单home </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@Service
public class MenuHome {

	@Autowired
	private MenuMapper menuMapper;
	
	/**
	 * <br/>Description:获取系统所有菜单
	 * <p>Author:zcliu/刘子萃</p>
	 * @return
	 */
	public List<Menu> listAll(){
		MenuExample example = new MenuExample();
		return menuMapper.selectByExample(example);
	}
	
}
