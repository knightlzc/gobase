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
	public static final String JOIN_COLS = " m.`id`,m.`menu_name` menuName,m.`menu_code` menuCode,m.`p_menu_code` pMenuCode,m.`sys_code` sysCode," +
			"m.`menu_url` menuUrl,m.`menu_logo` menuLogo,m.`level`,m.`sort` ,m.`create_time`,m.`update_time`,m.`load_type` loadType ";

	@Select("<script>"+
			" select "+JOIN_COLS+" from "+TABLE+ " m " +
			" left join role_menu_ref rm on rm.menu_code = m.menu_code " +
			" left join pf_user_role_ref ur on ur.role_code = rm.role_code "+
			" where ur.uid = #{uid} order by m.sort "+
			"</script>")
	List<Menu> listUserMenus(@Param("uid")String uid);
}