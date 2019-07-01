package com.gobase.web.controller.material;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gobase.component.bean.mall.oper.Banner;
import com.gobase.component.home.oper.BannerHome;
import com.gobase.tools.response.ResultResponse;

@RequestMapping("material")
@RestController
public class MaterialController {
	
	@Autowired
	private BannerHome bannerHome;
	
	/**
	 *@description 首页轮播图列表
	 */
	@RequestMapping("/list/banner")
	public ResultResponse<List<Banner>> bannerList(){
		List<Banner> listBannerByStatus = bannerHome.listBannerByStatus((byte)0);
		return ResultResponse.success(listBannerByStatus, "查询轮播图成功");
	}
}
