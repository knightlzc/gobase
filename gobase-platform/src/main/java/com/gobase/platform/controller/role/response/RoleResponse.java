package com.gobase.platform.controller.role.response;

import java.util.Date;

/**
 * 作者：刘子萃
 * 日期：2019-09-18
 */
public class RoleResponse {
    /**
     *自增id
     */
    private long id;

    /**
     *角色名称
     */
    private String roleName="";

    /**
     *角色编码
     */
    private String roleCode="";

    /**
     *系统编码 
     */
    private String sysCode="";

    /**
     *创建时间
     */
    private Date createTime;

    /**
     *更新时间
     */
    private Date updateTime;

    /**
     *状态 0 启用 -1 删除
     */
    private int status;

    private boolean checked;

    public void setId(long id){
        this.id=id;
    }
    public long getId(){
        return id;
    }
    public void setRoleName(String roleName){
        this.roleName=roleName;
    }
    public String getRoleName(){
        return roleName;
    }
    public void setRoleCode(String roleCode){
        this.roleCode=roleCode;
    }
    public String getRoleCode(){
        return roleCode;
    }
    public void setSysCode(String sysCode){
        this.sysCode=sysCode;
    }
    public String getSysCode(){
        return sysCode;
    }
    public void setCreateTime(Date createTime){
        this.createTime=createTime;
    }
    public Date getCreateTime(){
        return createTime;
    }
    public void setUpdateTime(Date updateTime){
        this.updateTime=updateTime;
    }
    public Date getUpdateTime(){
        return updateTime;
    }
    public void setStatus(int status){
        this.status=status;
    }
    public int getStatus(){
        return status;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }
}