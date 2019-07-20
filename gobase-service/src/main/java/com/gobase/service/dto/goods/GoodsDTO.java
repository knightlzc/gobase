package com.gobase.service.dto.goods;

public class GoodsDTO {

    private String goodsId;

    private String tinyName;

    private String smallImg;
    
    private String description;
    
    private double realPrice;
    
    private int buyNum;

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

    public String getSmallImg() {
        return smallImg;
    }

    public void setSmallImg(String smallImg) {
        this.smallImg = smallImg;
    }

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getRealPrice() {
		return realPrice;
	}

	public void setRealPrice(double realPrice) {
		this.realPrice = realPrice;
	}

	public int getBuyNum() {
		return buyNum;
	}

	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}
}
