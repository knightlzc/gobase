package com.gobase.platform.controller.shop;

import com.gobase.component.home.shop.ShopHome;
import com.gobase.component.vo.ShopListVo;
import com.gobase.service.service.shop.ShopAdminService;
import com.gobase.tools.response.PageContent;
import com.gobase.tools.response.ResultResponse;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

/**
 * @author mm.sun
 * @date 2019/09/14 15:24
 */

@RestController
@RequestMapping("shop")
public class ShopAdminController {

    @Autowired
    private ShopHome shopHome;
    @Autowired
    private ShopAdminService shopAdminService;

    @GetMapping("listPage")
    public String listPage() {
        return "shop/shop_list";
    }

    @GetMapping("addPage")
    public String addPage() {
        return "shop/shop_add";
    }

    @GetMapping("list")
    public ResultResponse<PageContent<ShopListVo>> list(String search, Integer page, Integer limit) {
        try {
            PageContent<ShopListVo> pageResult = shopHome.page(search, page, limit);
            if (CollectionUtils.isEmpty(pageResult.getContent())) {
                return ResultResponse.success(new PageContent<>(page, limit, 0, new ArrayList<>()), "查询成功");
            }
            return ResultResponse.success(pageResult, "查询成功");
        } catch (Exception e) {
            e.printStackTrace();
            return ResultResponse.fail("500", "查询商户列表异常 " + e.getMessage());
        }
    }

    @PostMapping("add")
    public ResultResponse<String> add(String shopName, String licenseNo, int provinceId, int cityId, String logoUrl) {
        try {
            int shopId = shopAdminService.saveShopInfo(shopName, licenseNo, provinceId, cityId, logoUrl);
            return ResultResponse.success(shopId + "", "添加成功");
        } catch (Exception e) {
            e.printStackTrace();
            return ResultResponse.fail("500", "添加商户异常 " + e.getMessage());

        }
    }

    @PostMapping("del")
    public ResultResponse<String> del(int shopId) {
        try {
            shopAdminService.delShop(shopId);
            return ResultResponse.success(shopId + "", "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return ResultResponse.fail("500", "删除商户异常 " + e.getMessage());

        }
    }

    @PostMapping("update")
    public ResultResponse<String> update(int shopId, String shopName, String licenseNo, int provinceId, int cityId, String logoUrl) {
        try {
            shopAdminService.updateShopInfo(shopId, shopName, licenseNo, provinceId, cityId, logoUrl);
            return ResultResponse.success(shopId + "", "修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            return ResultResponse.fail("500", "修改商户异常 " + e.getMessage());

        }
    }

    @GetMapping("detail")
    public ResultResponse<ShopListVo> detail(int shopId) {
        try {
            ShopListVo vo = shopAdminService.findShopDetail(shopId);
            return ResultResponse.success(vo, "查询成功");
        } catch (Exception e) {
            e.printStackTrace();
            return ResultResponse.fail("500", "查询商户详情异常 " + e.getMessage());
        }
    }
}
