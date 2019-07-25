package com.gobase.component.dao.mall.menu;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.gobase.component.bean.mall.goods.Goods;
import com.gobase.component.bean.mall.menu.Menu;
import com.gobase.component.bean.mall.menu.MenuExample;
import com.gobase.component.dao.IBaseMapper;

public interface MenuMapper extends IBaseMapper<MenuExample, Menu>{
	
	public static final String TABLE = " `menu` ";
	public static final String INSERT_COLS = " `id`,`menu_name`,`menu_code`,`p_menu_code`,`sys_code`,`menu_url`,`menu_logo`,`level`,`sort`,`create_time`,`update_time`,`load_type` ";
	public static final String SELECT_COLS = " `id`,`menu_name`,`menu_code`,`p_menu_code`,`sys_code`,`menu_url`,`menu_logo`,`level`,`sort`,`create_time`,`update_time`,`load_type` ";

}