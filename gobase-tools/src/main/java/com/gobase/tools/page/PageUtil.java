/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Company: 人人公司  http://www.renren-inc.com </p> 
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: PageUtil.java
 * @Package com.renren.auto.video.utils
 * @date 2018年7月6日 下午2:49:21 
 */
package com.gobase.tools.page;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Company: 人人公司  http://www.renren-inc.com</p> 
 * <p>Description: 分页工具类 </p> 
 * <p>Author:zcliu/刘子萃</p>
 */

public class PageUtil {
	
	/**
	 * 默认页码
	 */
	public static int DEF_PAGE_NUM = 1;
	
	/**
	 * 默认每页条数
	 */
	public static int DEF_PAGE_SIZE = 10;
	
	/**
	 * <br/>Description:获取数据库分页start
	 * <p>Author:zcliu/刘子萃</p>
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public static Integer getStart(Integer pageNum,Integer pageSize) {
		if(pageNum == null || pageSize == null) {
			return null;
		}
		if (pageNum <= 0) {
			pageNum = DEF_PAGE_NUM;
		}
		if(pageSize<=0) {
			pageSize = DEF_PAGE_SIZE;
		}
		return (pageNum-1)*pageSize;
		
	}
	
	/**
	 * <br/>Description:获取数据库分页limit
	 * <p>Author:zcliu/刘子萃</p>
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public static Integer getLimit(Integer pageNum,Integer pageSize) {
		if(pageNum == null || pageSize == null) {
			return null;
		}
		if (pageSize <= 0) {
			return DEF_PAGE_SIZE;
		}
		return pageSize;
	}
}
