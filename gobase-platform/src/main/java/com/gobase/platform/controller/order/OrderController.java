/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: OrderController.java
 * @Package com.gobase.platform.controller.order
 * @date 2019年9月12日 下午3:48:25 
 */
package com.gobase.platform.controller.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gobase.service.dto.order.OrderDTO;
import com.gobase.service.service.order.OrderService;
import com.gobase.tools.response.PageContent;
import com.gobase.tools.response.ResultResponse;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@Controller
@RequestMapping("order")
public class OrderController {

	@Autowired
    private OrderService orderService;
	
	@RequestMapping("listPage")
	public String listPage(){
		
		return "order/order_list";
	}
	
	@RequestMapping("list")
    public ResultResponse<PageContent<OrderDTO>> listMgrOrders(String search,Integer shopId,Integer userId,Integer status,int pageNum,int pageSize){
    	try {
    		PageContent<OrderDTO> page = orderService.pageMgrOrders(search, shopId, userId, status, pageNum, pageSize);
    		return ResultResponse.success(page, "");
		} catch (Exception e) {
			e.printStackTrace();
			return ResultResponse.fail("查询列表失败", "");
		}
    }
}
