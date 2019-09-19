package com.gobase.component.home.shop;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.gobase.component.bean.mall.pfuser.PfUser;
import com.gobase.component.bean.mall.pfuser.PfUserExample;
import com.gobase.component.vo.ShopListVo;
import com.gobase.tools.page.PageUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.gobase.component.bean.mall.goods.Goods;
import com.gobase.component.bean.mall.goods.GoodsCategory;
import com.gobase.component.bean.mall.goods.GoodsCategoryDO;
import com.gobase.component.bean.mall.goods.GoodsExample;
import com.gobase.component.bean.mall.goods.GoodsExample.Criteria;
import com.gobase.component.bean.mall.shop.Shop;
import com.gobase.component.bean.mall.shop.ShopDO;
import com.gobase.component.bean.mall.shop.ShopExample;
import com.gobase.component.dao.mall.goods.GoodsCategoryMapper;
import com.gobase.component.dao.mall.goods.GoodsMapper;
import com.gobase.component.dao.mall.shop.ShopMapper;
import com.gobase.component.home.goods.GoodsCategoryHome;
import com.gobase.tools.response.PageContent;

/**
 * <p>Copyright: All Rights Reserved</p>
 * <p>Description: 商店home接口 </p>
 * <p>Author:dxh</p>
 */
@Service
public class ShopHome {

    @Autowired
    private ShopMapper shopMapper;

    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private GoodsCategoryMapper goodsCategoryMapper;

    @Autowired
    private GoodsCategoryHome goodsCategoryHome;
//	@Autowired
//	private OrderMapper orderMapper;

    /**
     * @param params 店铺名称等
     * @description 查询店铺并查询几张热销商品和统计销量
     */
    public PageContent<ShopDO> pageShops(Map<String, Object> params) {
        ArrayList<ShopDO> shopsList = new ArrayList<ShopDO>();
        ShopExample shopExample = new ShopExample();
        shopExample.createCriteria().andIdNotEqualTo(2);
        long count = shopMapper.countByExample(shopExample);
        if (count <= 0) {
            return new PageContent<ShopDO>(1, 10, (int) count, shopsList);
        }
        List<Shop> list = shopMapper.mySearchShops(params);
        if (CollectionUtils.isEmpty(list)) {
            return new PageContent<ShopDO>(1, 10, (int) count, shopsList);
        }
//		OrderExample orderExample = new OrderExample();
//		com.gobase.component.bean.mall.order.OrderExample.Criteria ordercri = orderExample.createCriteria();
        for (Shop shop : list) {
            GoodsExample goodsExample = new GoodsExample();
            Criteria goodscri = goodsExample.createCriteria();
            ShopDO shopDO = new ShopDO();
            BeanUtils.copyProperties(shop, shopDO);
            goodscri.andShopIdEqualTo(shop.getId());
            goodsExample.setOrderByClause("update_time ASC LIMIT 0,4");
            List<Goods> goodsLi = goodsMapper.selectByExample(goodsExample);
            boolean addFlag = false;
            if (!CollectionUtils.isEmpty(goodsLi)) {
                shopDO.setGoodsList(goodsLi);
                //只要有店铺发布的商品有水果类型，则店铺可以出现在水果模块 后续修改次逻辑
                for (Goods goods : goodsLi) {
//					ordercri.andGoodsIdEqualTo(goods.getGoodsId());
//					long ordcount = orderMapper.countByExample(orderExample);
//					shopDO.setSaleCount(ordcount);
                    if (GoodsCategory.CATEGORY_JPSG.equals(goods.getCategory1())) {
                        addFlag = true;
                        break;
                    }
                }
            }
            if (addFlag) {
                shopsList.add(shopDO);
            }
        }

        return new PageContent<ShopDO>((int) params.get("offset"), (int) params.get("limit"), (int) count, shopsList);
    }

    /**
     * @param shopId 店铺ID等
     * @description 通过店铺查询商品类别列表，并返回树
     */
    public List<GoodsCategoryDO> getShopCatrgoryByShopId(Integer shopId) {
        List<GoodsCategoryDO> result = new ArrayList<GoodsCategoryDO>();
        List<GoodsCategory> shopGoodsCategoryLi = goodsCategoryMapper.searchShopGoodsCategory(shopId);
        if (!shopGoodsCategoryLi.isEmpty()) {
            for (GoodsCategory item : shopGoodsCategoryLi) {
                List<GoodsCategory> listByPcodeAndGroupCode = goodsCategoryHome.listByPcodeAndGroupCode(item.getCode(), null);
                GoodsCategoryDO catedo = new GoodsCategoryDO();
                BeanUtils.copyProperties(item, catedo);
                catedo.setSublist(listByPcodeAndGroupCode);
                result.add(catedo);
            }
            return result;
        } else {
            return null;
        }
    }

    public PageContent<ShopListVo> page(String search, int pageNum, int pageSize) {
        if (StringUtils.isNotBlank(search)) {
            search = "%" + search + "%";
        }
        int start = PageUtil.getStart(pageNum, pageSize);
        int limit = PageUtil.getLimit(pageNum, pageSize);
        int count = shopMapper.findPageNum(search, start, limit);
        if (count <= 0) {
            return new PageContent<>(pageNum, pageSize, 0, new ArrayList<>());
        }
        List<ShopListVo> content = shopMapper.findPageList(search, start, limit);
        return new PageContent<>(pageNum, pageSize, count, content);
    }

    public Shop getById(int shopId){
        return shopMapper.selectByPrimaryKey(shopId);
    }
}
