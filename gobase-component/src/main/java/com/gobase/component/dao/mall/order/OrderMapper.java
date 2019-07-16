package com.gobase.component.dao.mall.order;

import com.gobase.component.bean.mall.order.Order;
import com.gobase.component.bean.mall.order.OrderExample;
import java.util.List;

import com.gobase.component.dao.IBaseMapper;
import org.apache.ibatis.annotations.Param;

public interface OrderMapper extends IBaseMapper<OrderExample,Order> {

}