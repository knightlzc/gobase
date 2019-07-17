package com.gobase.component.bean.mall.user;

/**
 * @author mm.sun
 * @date 2019/7/17 11:38
 */
public class GoUserInfo {

    /**
     *
     */
    private int id;

    /**
     *
     */
    private String phone="";

    /**
     *
     */
    private String name="";

    /**
     *微信id
     */
    private String wxid="";

    /**
     *头像url
     */
    private String headUrl="";

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getWxid() {
        return wxid;
    }

    public void setWxid(String wxid) {
        this.wxid = wxid;
    }

    public String getHeadUrl() {
        return headUrl;
    }

    public void setHeadUrl(String headUrl) {
        this.headUrl = headUrl;
    }
}
