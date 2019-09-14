/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: UploadController.java
 * @Package com.gobase.web.controller.upload
 * @date 2019年7月20日 下午3:03:51 
 */
package com.gobase.platform.controller.upload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.gobase.platform.controller.upload.response.ImgResponse;
import com.gobase.tools.common.IDCreater;
import com.gobase.tools.config.ConfigUtil;
import com.gobase.tools.date.DateUtils;
import com.gobase.tools.response.ResultResponse;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
@RequestMapping("upload")
@RestController
public class UploadController {
	
	private static String IMG_PREFIX = "https://wx.apricot32.cn/img/" ;
	
	@RequestMapping(value="/img")
	public ResultResponse<ImgResponse> upload(MultipartFile file){
		if(file == null || file.getSize() == 0){
			return ResultResponse.fail("请选择一张图片","100");
		}
		if(file.getSize()>5242880) {
			return ResultResponse.fail("图片大小不得超过5M","100");
		}
		String fileName = file.getOriginalFilename();
		String ext = fileName.substring(fileName.lastIndexOf("."));
		if (!ext.equals(".jpg") && !ext.equals(".png") && !ext.equals(".jpeg") && !ext.equals(".JPG") && !ext.equals(".PNG") && !ext.equals(".JPEG")){
			return ResultResponse.fail("请上传 jpg,png,jpeg,JPG,PNG,JPEG 格式图片","100");
		}
		Date time = new Date();
		String subPath = DateUtils.getDateToString(time, "yyyy/MM/dd/");
		String rootPath = ConfigUtil.getProperty("img.path");
		String fullPath = rootPath+subPath;
		File fileDir = new File(fullPath);
		if (!fileDir.exists()) {
			fileDir.mkdirs();
		}
		String filename = IDCreater.generate("img")+ext;
		try {
			SaveFileFromInputStream(file.getInputStream(), fullPath, filename);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultResponse.fail("上传异常", "100");
		}
		return ResultResponse.success(new ImgResponse(IMG_PREFIX+subPath+filename), "上传成功");
	}
	
	public void SaveFileFromInputStream(InputStream stream,String path,String filename) throws IOException{  
	    FileOutputStream fs=new FileOutputStream( path + "/"+ filename);
	    byte[] buffer =new byte[1024*1024];
	    int bytesum = 0;
	    int byteread = 0; 
	    while ((byteread=stream.read(buffer))!=-1)
	    {
	      bytesum+=byteread;
	      fs.write(buffer,0,byteread);
	      fs.flush();
	    } 
	    fs.close();
	    stream.close();   
	}    

}
