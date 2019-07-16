package com.gobase.service.param.order;

public class OrderParam {

    private double kuaidiPrice;

    private int addressId;

    private String porderId;

    public double getKuaidiPrice() {
        return kuaidiPrice;
    }

    public void setKuaidiPrice(double kuaidiPrice) {
        this.kuaidiPrice = kuaidiPrice;
    }

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public String getPorderId() {
        return porderId;
    }

    public void setPorderId(String porderId) {
        this.porderId = porderId;
    }
}
