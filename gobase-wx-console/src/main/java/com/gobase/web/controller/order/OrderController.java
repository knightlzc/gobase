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
import com.gobase.web.interceptor.host.HostHolder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@RequestMapping("order")
@RestController
public class OrderController {
	
	@Autowired
	private HostHolder hostHolder;

    @Autowired
    private OrderService orderService;

    @RequestMapping("list")
    public ResultResponse<PageContent<OrderDTO>> listUserOrders(Integer status,int pageNum,int pageSize){
    	try {
    		PageContent<OrderDTO> page = orderService.pageOrders(hostHolder.getUserId(), status, pageNum, pageSize);
    		return ResultResponse.success(page, "");
		} catch (Exception e) {
			e.printStackTrace();
			return ResultResponse.fail("查询列表失败", "");
		}
    	
    }

}
