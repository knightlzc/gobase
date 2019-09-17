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
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@ResponseBody
	@RequestMapping("list")
    public ResultResponse<PageContent<OrderDTO>> listMgrOrders(String search,Integer shopId,Integer userId,Integer status,int page,int limit){
    	try {
    		PageContent<OrderDTO> pageContent = orderService.pageMgrOrders(search, shopId, userId, status, page, limit);
    		return ResultResponse.success(pageContent, "");
		} catch (Exception e) {
			e.printStackTrace();
			return ResultResponse.fail("查询列表失败", "");
		}
    }
}
