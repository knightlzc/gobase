package com.gobase.platform.controller.goods.response;

import com.gobase.component.bean.mall.goods.GoodsParam;
import com.gobase.component.bean.mall.img.Img;

import java.util.Date;
import java.util.List;

/**
 * 作者：刘子萃
 * 日期：2019-09-20
 */
public class GoodsDetailResponse {

    private int id;

    /**
     *商品id
     */
    private String goodsId="";

    /**
     *商品短名称
     */
    private String tinyName="";

    /**
     *商品长名称
     */
    private String fullName="";

    /**
     *
     */
    private String description="";

    /**
     *商品创建时间
     */
    private Date createTime;

    /**
     *商品添加者
     */
    private String creator="";

    /**
     *下线时间
     */
    private Date offlineTime;

    /**
     *商品上线时间
     */
    private Date onlineTime;

    /**
     *商品大图
     */
    private String bigImg="";

    /**
     *商品小图片
     */
    private String smallImg="";

    /**
     *一级分类
     */
    private String category1="";

    /**
     *二级分类
     */
    private String category2="";

    /**
     *三级分类
     */
    private String category3="";

    /**
     *商品状态 0有效 -1 无效
     */
    private int status;

    /**
     *备注
     */
    private String remark="";

    /**
     *店铺id
     */
    private int shopId;

    private String shopName;

    /**
     *商品销售价格
     */
    private double realPrice;

    /**
     *原价
     */
    private double oriPrice;

    /**
     *库存总量
     */
    private int totalNum;

    /**
     *商品图片
     */
    private List<String> imgs;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public String getTinyName() {
        return tinyName;
    }

    public void setTinyName(String tinyName) {
        this.tinyName = tinyName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public Date getOfflineTime() {
        return offlineTime;
    }

    public void setOfflineTime(Date offlineTime) {
        this.offlineTime = offlineTime;
    }

    public Date getOnlineTime() {
        return onlineTime;
    }

    public void setOnlineTime(Date onlineTime) {
        this.onlineTime = onlineTime;
    }

    public String getBigImg() {
        return bigImg;
    }

    public void setBigImg(String bigImg) {
        this.bigImg = bigImg;
    }

    public String getSmallImg() {
        return smallImg;
    }

    public void setSmallImg(String smallImg) {
        this.smallImg = smallImg;
    }

    public String getCategory1() {
        return category1;
    }

    public void setCategory1(String category1) {
        this.category1 = category1;
    }

    public String getCategory2() {
        return category2;
    }

    public void setCategory2(String category2) {
        this.category2 = category2;
    }

    public String getCategory3() {
        return category3;
    }

    public void setCategory3(String category3) {
        this.category3 = category3;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public int getShopId() {
        return shopId;
    }

    public void setShopId(int shopId) {
        this.shopId = shopId;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public double getRealPrice() {
        return realPrice;
    }

    public void setRealPrice(double realPrice) {
        this.realPrice = realPrice;
    }

    public double getOriPrice() {
        return oriPrice;
    }

    public void setOriPrice(double oriPrice) {
        this.oriPrice = oriPrice;
    }

    public int getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(int totalNum) {
        this.totalNum = totalNum;
    }

    public List<String> getImgs() {
        return imgs;
    }

    public void setImgs(List<String> imgs) {
        this.imgs = imgs;
    }
}
