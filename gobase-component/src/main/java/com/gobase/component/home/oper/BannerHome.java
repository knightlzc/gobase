package com.gobase.component.home.oper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gobase.component.bean.mall.oper.Banner;
import com.gobase.component.bean.mall.oper.BannerExample;
import com.gobase.component.dao.mall.oper.BannerMapper;
/** 
 * <p>Date: 2019年6月29日17:04:56</p>  
 * <p>Description: 轮播图片数据源 </p> 
 * <p>Author:DXH</p>
 */
@Service
public class BannerHome {
	
	@Autowired
	private BannerMapper bannerMapper;
	/** 
	 * <p>Description: 查询所有图片 </p>  
	 */
	public List<Banner> listBanner(){
		BannerExample example = new BannerExample();
		return bannerMapper.selectByExample(example);
	}
	
	/** 
	 * <p>Description: 根据图片状态查询图片 </p> 
	 * <p>Param: status 图片状态 0 有效 -1 无效</p> 
	 */
	public List<Banner> listBannerByStatus(Byte status){
		BannerExample example = new BannerExample();
		example.createCriteria().andStatusEqualTo(status);
		return bannerMapper.selectByExample(example);
	}
	
	/** 
	 * <p>Description: 添加一条banner信息 如果banner图地址相同，修改</p> 
	 * <p>Param: banner 对象</p> 
	 */
	public Integer addItemBanner(Banner banner) {
		return bannerMapper.insert(banner);
	}
	
	/** 
	 * <p>Description: 修改一条banner信息 </p> 
	 * <p>Param: banner 对象</p> 
	 */
	public Integer updateItemBanner(Banner banner) {
		return bannerMapper.updateByPrimaryKeySelective(banner);
	}
	
	/** 
	 * <p>Description: 通过ID删除一条banner信息 </p> 
	 * <p>Param: banner 对象</p> 
	 */
	public Integer deleteItemBannerById(Integer id) {
		return bannerMapper.deleteByPrimaryKey(id);
	}
	
}
