/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: MenuDTO.java
 * @Package com.gobase.service.dto.menu
 * @date 2019年7月25日 下午7:07:00 
 */
package com.gobase.service.dto.menu;

import java.util.List;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */

public class MenuDTO {

	/**
	*自增id
	*/
	private long id;

	/**
	*菜单名称
	*/
	private String menuName="";

	/**
	*
	*/
	private String menuCode="";

	/**
	*父菜单编码
	*/
	private String pMenuCode="";

	/**
	*
	*/
	private String sysCode="";

	/**
	*菜单url，菜单跳转的url
	*/
	private String menuUrl="";

	/**
	*菜单logo
	*/
	private String menuLogo="";

	/**
	*菜单层级
	*/
	private int level;

	/**
	*加载类型 0请选择 1 load, 2 iframe 
	*/
	private int loadType;
	
	private List<MenuDTO> children;

	public List<MenuDTO> getChildren() {
		return children;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuCode() {
		return menuCode;
	}

	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}

	public String getpMenuCode() {
		return pMenuCode;
	}

	public void setpMenuCode(String pMenuCode) {
		this.pMenuCode = pMenuCode;
	}

	public String getSysCode() {
		return sysCode;
	}

	public void setSysCode(String sysCode) {
		this.sysCode = sysCode;
	}

	public String getMenuUrl() {
		return menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}

	public String getMenuLogo() {
		return menuLogo;
	}

	public void setMenuLogo(String menuLogo) {
		this.menuLogo = menuLogo;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getLoadType() {
		return loadType;
	}

	public void setLoadType(int loadType) {
		this.loadType = loadType;
	}

	public void setChildren(List<MenuDTO> children) {
		this.children = children;
	}
	
}
