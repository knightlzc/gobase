package com.gobase.service.service.shop;

import com.gobase.component.bean.mall.shop.Shop;
import com.gobase.component.bean.mall.shop.ShopAccount;
import com.gobase.component.bean.mall.shop.ShopAccountExample;
import com.gobase.component.bean.mall.shop.ShopExample;
import com.gobase.component.dao.mall.shop.ShopAccountMapper;
import com.gobase.component.dao.mall.shop.ShopMapper;
import com.gobase.component.vo.ShopListVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * @author mm.sun
 * @date 2019/09/14 17:27
 */

@Service
public class ShopAdminService {

    @Autowired
    private ShopMapper shopMapper;
    @Autowired
    private ShopAccountMapper shopAccountMapper;

    @Transactional(rollbackFor = Exception.class)
    public int saveShopInfo(String shopName, String licenseNo, int provinceId, int cityId, String logoUrl) throws Exception {
        ShopExample example = new ShopExample();
        example.createCriteria().andLicenseNoEqualTo(licenseNo);
        List<Shop> shops = shopMapper.selectByExample(example);
        if (shops.size() > 1) {
            throw new Exception("营业执照号已存在");
        }
        Shop shop = new Shop();
        shop.setCityId(cityId);
        shop.setLicenseNo(licenseNo);
        shop.setLogoUrl(logoUrl);
        shop.setProvinceId(new Integer(provinceId));
        shop.setShopName(shopName);
        shop.setStatus(Shop.STATUS_YES);
        int shopId = shopMapper.insertSelective(shop);
        ShopAccount account = new ShopAccount();
        account.setShopId(shopId);
        account.setStatus(Shop.STATUS_YES);
        shopAccountMapper.insertSelective(account);
        return shopId;
    }

    @Transactional(rollbackFor = Exception.class)
    public void delShop(int shopId) throws Exception {
        shopMapper.deleteByPrimaryKey(shopId);
        ShopAccountExample example = new ShopAccountExample();
        example.createCriteria().andShopIdEqualTo(shopId);
        shopAccountMapper.deleteByExample(example);
    }

    @Transactional(rollbackFor = Exception.class)
    public void updateShopInfo(int shopId, String shopName, String licenseNo, int provinceId, int cityId, String logoUrl) throws Exception {
        Shop shop = shopMapper.selectByPrimaryKey(shopId);
        ShopExample example = new ShopExample();
        example.createCriteria().andLicenseNoEqualTo(licenseNo);
        List<Shop> shops = shopMapper.selectByExample(example);
        if (shops.size() > 1) {
            throw new Exception("营业执照号已存在");
        }
        shop.setCityId(cityId);
        shop.setLicenseNo(licenseNo);
        shop.setLogoUrl(logoUrl);
        shop.setProvinceId(new Integer(provinceId));
        shop.setShopName(shopName);
        shop.setStatus(Shop.STATUS_YES);
        shopMapper.updateByPrimaryKeySelective(shop);
    }

    public ShopListVo findShopDetail(int shopId) {
        return shopMapper.findShopDetail(shopId);
    }

}
