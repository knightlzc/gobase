/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: PayController.java
 * @Package com.gobase.web.controller.pay
 * @date 2019年7月19日 下午8:06:31 
 */
package com.gobase.web.controller.pay;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.gobase.tools.response.ResultResponse;


/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@RequestMapping("pay")
@RestController
public class PayController {
	
	@RequestMapping(value = "/weixinpay", method = RequestMethod.POST)
    public ResultResponse<String> weixinpay(String orderNo, HttpServletRequest request) {
		return null;
	}

}
