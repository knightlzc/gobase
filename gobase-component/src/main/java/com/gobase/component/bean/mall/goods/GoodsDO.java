package com.gobase.component.bean.mall.goods;

import java.util.Date;
import java.util.List;

import com.gobase.component.bean.mall.img.Img;

public class GoodsDO {
	/**
	*
	*/
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

	/**
	*审核状态
	*/
	private int auditStatus;

	/**
	*商品销售价格
	*/
	private double realPrice;

	/**
	*原价
	*/
	private double oriPrice;

	/**
	*
	*/
	private Date updateTime;

	/**
	*库存总量
	*/
	private int totalNum;
	
	/**
	 *购买数量
	 */
	private int buyNum;
	
	
	/**
	 *商品图片
	 */
	private List<Img> imgs;
	
	/**
	 * 参数详情
	 */
	private List<GoodsParam> paramList;

	public void setId(int id){
		this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setGoodsId(String goodsId){
		this.goodsId=goodsId;
	}
	public String getGoodsId(){
		return goodsId;
	}
	public void setTinyName(String tinyName){
		this.tinyName=tinyName;
	}
	public String getTinyName(){
		return tinyName;
	}
	public void setFullName(String fullName){
		this.fullName=fullName;
	}
	public String getFullName(){
		return fullName;
	}
	public void setDescription(String description){
		this.description=description;
	}
	public String getDescription(){
		return description;
	}
	public void setCreateTime(Date createTime){
		this.createTime=createTime;
	}
	public Date getCreateTime(){
		return createTime;
	}
	public void setCreator(String creator){
		this.creator=creator;
	}
	public String getCreator(){
		return creator;
	}
	public void setOfflineTime(Date offlineTime){
		this.offlineTime=offlineTime;
	}
	public Date getOfflineTime(){
		return offlineTime;
	}
	public void setOnlineTime(Date onlineTime){
		this.onlineTime=onlineTime;
	}
	public Date getOnlineTime(){
		return onlineTime;
	}
	public void setBigImg(String bigImg){
		this.bigImg=bigImg;
	}
	public String getBigImg(){
		return bigImg;
	}
	public void setSmallImg(String smallImg){
		this.smallImg=smallImg;
	}
	public String getSmallImg(){
		return smallImg;
	}
	public void setCategory1(String category1){
		this.category1=category1;
	}
	public String getCategory1(){
		return category1;
	}
	public void setCategory2(String category2){
		this.category2=category2;
	}
	public String getCategory2(){
		return category2;
	}
	public void setCategory3(String category3){
		this.category3=category3;
	}
	public String getCategory3(){
		return category3;
	}
	public void setStatus(int status){
		this.status=status;
	}
	public int getStatus(){
		return status;
	}
	public void setRemark(String remark){
		this.remark=remark;
	}
	public String getRemark(){
		return remark;
	}
	public void setShopId(int shopId){
		this.shopId=shopId;
	}
	public int getShopId(){
		return shopId;
	}
	public void setAuditStatus(int auditStatus){
		this.auditStatus=auditStatus;
	}
	public int getAuditStatus(){
		return auditStatus;
	}
	public void setRealPrice(double realPrice){
		this.realPrice=realPrice;
	}
	public double getRealPrice(){
		return realPrice;
	}
	public void setOriPrice(double oriPrice){
		this.oriPrice=oriPrice;
	}
	public double getOriPrice(){
		return oriPrice;
	}
	public void setUpdateTime(Date updateTime){
		this.updateTime=updateTime;
	}
	public Date getUpdateTime(){
		return updateTime;
	}
	public void setTotalNum(int totalNum){
		this.totalNum=totalNum;
	}
	public int getTotalNum(){
		return totalNum;
	}
	public List<Img> getImgs() {
		return imgs;
	}
	public void setImgs(List<Img> imgs) {
		this.imgs = imgs;
	}
	public List<GoodsParam> getParamList() {
		return paramList;
	}
	public void setParamList(List<GoodsParam> paramList) {
		this.paramList = paramList;
	}
	public int getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}
}