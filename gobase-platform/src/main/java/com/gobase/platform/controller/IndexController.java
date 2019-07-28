package com.gobase.platform.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.gobase.service.dto.menu.MenuDTO;
import com.gobase.service.dto.user.HostPfUser;
import com.gobase.service.service.menu.MenuService;


@Controller
public class IndexController {
	
	@Autowired
	private MenuService menuService;
	
    @GetMapping("")
    public String index(Model model){
    	List<MenuDTO> menus = menuService.listPfUserMenus("1");
//    	System.out.println(JSONObject.toJSONString(menus));
    	model.addAttribute("menus", menus);
        return "index";
    }
}
