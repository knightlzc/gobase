/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: OrderController.java
 * @Package com.gobase.web.controller.order
 * @date 2019年7月1日 下午4:17:04 
 */
package com.gobase.web.controller.order;

import com.gobase.service.dto.order.OrderDTO;
import com.gobase.service.service.order.OrderService;
import com.gobase.tools.response.PageContent;
import com.gobase.tools.response.ResultResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@RequestMapping("order")
@RestController
public class OrderController {

    @Autowired
    private OrderService orderService;

    @RequestMapping("lst")
    public ResultResponse<PageContent<OrderDTO>> listUserOrders(Integer status){
        return null;
    }

}
