package com.gobase.component.dao.mall.user;

import com.gobase.component.bean.mall.user.User;
import com.gobase.component.bean.mall.user.UserExample;

import com.gobase.component.dao.IBaseMapper;

public interface UserMapper extends IBaseMapper<UserExample, User> {

    User selectByOpenId(String openId);
}