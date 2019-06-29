package com.gobase.web.controller.index;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gobase.component.bean.mall.oper.Banner;
import com.gobase.component.home.oper.BannerHome;
import com.gobase.tools.response.ResultResponse;

/**
 *@description 首页轮播图查询接口类 （先做）
 *@author DXH
 *@date 2019年6月29日15:41:30
 */
@RequestMapping("carouselMap")
@RestController
public class CarouselMapController {
	
	@Autowired
	private BannerHome bannerHome;
	/**
	 *@description 首页轮播图列表
	 */
	@RequestMapping("/banner/list")
	public ResultResponse<List<Banner>> bannerList(){
		List<Banner> listBannerByStatus = bannerHome.listBannerByStatus((byte)0);
		return ResultResponse.success(listBannerByStatus, "查询轮播图成功");
	}
	
}
