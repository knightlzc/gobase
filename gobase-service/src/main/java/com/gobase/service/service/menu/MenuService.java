/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: MenuService.java
 * @Package com.gobase.service.service.menu
 * @date 2019年7月25日 下午7:01:59 
 */
package com.gobase.service.service.menu;

import java.util.*;

import com.gobase.component.dao.mall.menu.MenuMapper;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
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

	@Autowired
	private MenuMapper menuMapper;
	
	public List<MenuDTO> listPfUserMenus(String uid) {
		List<Menu> menuList = menuMapper.listUserMenus(uid);
		if(CollectionUtils.isEmpty(menuList)) {
			return new ArrayList<MenuDTO>();
		}
		Map<String,List<Menu>> menuMap = new HashMap<>();

		for (Menu menu : menuList){
			if (StringUtils.isBlank(menu.getPMenuCode())){
				continue;
			}
			if(null == menuMap.get(menu.getPMenuCode())){
				List<Menu> menus = new ArrayList<>();
				menus.add(menu);
				menuMap.put(menu.getPMenuCode(),menus);
			} else {
				menuMap.get(menu.getPMenuCode()).add(menu);
			}
		}
		List<MenuDTO> list = new ArrayList<>();
		for (Menu menu : menuList){
			if(StringUtils.isBlank(menu.getPMenuCode())){
				MenuDTO menuDTO = new MenuDTO();
				BeanUtils.copyProperties(menu,menuDTO);
				buildChild(menuDTO,menuMap);
				list.add(menuDTO);
			} else {
				continue;
			}
		}
		return list;
		
	}

	private void buildChild(MenuDTO menuDTO,Map<String,List<Menu>> menuMap){
		if(null == menuMap.get(menuDTO.getMenuCode())){
			return;
		}
		List<MenuDTO> subList = new ArrayList<>();
		for (Menu menu : menuMap.get(menuDTO.getMenuCode())){
			MenuDTO dto = new MenuDTO();
			BeanUtils.copyProperties(menu,dto);
			subList.add(dto);
			if(null != menuMap.get(dto.getpMenuCode())){
				buildChild(dto,menuMap);
			}
		}
		menuDTO.setChildren(subList);

	}
	
	
}
