package com.gobase.component.dao.mall.role;

import com.gobase.component.bean.mall.role.Role;
import com.gobase.component.bean.mall.role.RoleExample;
import com.gobase.component.dao.IBaseMapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RoleMapper extends IBaseMapper<RoleExample, Role>{
}