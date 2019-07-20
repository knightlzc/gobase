package com.gobase.component.dao.mall.user;

import com.gobase.component.bean.mall.user.UserAddress;
import com.gobase.component.bean.mall.user.UserAddressExample;

import java.util.List;

import com.gobase.component.dao.IBaseMapper;

public interface UserAddressMapper extends IBaseMapper<UserAddressExample, UserAddress> {

    /**
     * 查询所有收件地址
     *
     * @return
     */
    List<UserAddress> selectAll();

    /**
     * 设置默认收件地址
     *
     * @return
     */
    int updateForDefault(int id);

    /**
     * 设置非默认收件地址
     *
     * @return
     */
    int updateForNoDefault();

    /**
     * 软删除
     *
     * @return
     */
    int updateForSoft(int id);

    /**
     * 查询默认地址个数
     *
     * @return
     */
    int countForDefault();
}