/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: ImgHome.java
 * @Package com.gobase.component.home.img
 * @date 2019年6月22日 上午10:31:38 
 */
package com.gobase.component.home.img;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gobase.component.bean.mall.img.Img;
import com.gobase.component.bean.mall.img.ImgExample;
import com.gobase.component.dao.mall.img.ImgMapper;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@Service
public class ImgHome {

	@Autowired
	private ImgMapper imgMapper;
	
	public List<Img> listImg(String bizId,int bizType){
		ImgExample example = new ImgExample();
		example.createCriteria().andBizIdEqualTo(bizId).andBizTypeEqualTo(bizType);
		return imgMapper.selectByExample(example);
	}
}
