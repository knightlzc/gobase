/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Company: 人人公司   http://www.renren-inc.com</p> 
 * <p>Author:zicui.liu/刘子萃</p>
 * @Title: CommonUtils.java
 * @Package com.renren.fenqi.carloan.util
 * @date 2015-2-4 上午9:56:30 
 */
package com.gobase.tools.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.StringUtils;
import org.joda.time.DateTime;
import org.joda.time.Years;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Company: 人人公司   http://www.renren-inc.com</p> 
 * <p>Description: 通用工具类 </p> 
 * <p>Author:zicui.liu/刘子萃</p>
 */

public class CommonUtils {

	/**
	 * <br/>Description:根据身份证号码计算年龄（不校验号码真伪）
	 * <p>Author:zicui.liu/刘子萃</p>
	 * @param idNumber
	 * @return
	 */
	public static int getAgeByIdNumber(String idNumber){
	  int leh = idNumber.length();
	  DateTimeFormatter formatter = DateTimeFormat.forPattern("yyyy-MM-dd").withZoneUTC();  
	  if (leh == 18) {
          String dates = idNumber.substring(6, 10) + "-" + idNumber.substring(10, 12) + "-" + idNumber.substring(12, 14);
          int age = Years.yearsBetween(formatter.parseDateTime(dates), new DateTime()).getYears();
          return age;
      }else if(leh == 15) {
          String dates = "19" + idNumber.substring(6, 8) + "-" + idNumber.substring(8, 10) + "-" + idNumber.substring(10, 12);
          int age = Years.yearsBetween(formatter.parseDateTime(dates), new DateTime()).getYears();
          return age;
      }
	  return 0;
	  
	}
	
	/**
	 * <br/>Description:根据图片字符串获取图片列表
	 * <p>Author:zicui.liu/刘子萃</p>
	 * @param imgStr
	 * @return
	 */
	public static List<String> getImgListByStr(String imgStr){
		List<String> list = null;
		try {
			if(StringUtils.isNotBlank(imgStr)){
				String[] urls = imgStr.split(";");
				list = new ArrayList<String>();
				for (String url : urls) {
					list.add(url);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * <br/>Description:字符串改为list
	 * <p>Author:zcliu/刘子萃</p>
	 * @param str
	 * @param remark
	 * @return
	 */
	public static List<String> getListByStr(String str,String remark){
		List<String> list = null;
		try {
			if(StringUtils.isNotBlank(str)){
				String[] urls = str.split(remark);
				list = new ArrayList<String>();
				for (String url : urls) {
					list.add(url);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 正则替换字符串
	 * 
	 * @param targetStr
	 * @param keyList
	 * @param repMap
	 * @return
	 */
	public static String replaceByRegex(String targetStr, List<String> keyList,
			Map<String, String> repMap) {
	    StringBuffer sb = new StringBuffer();
	    String regexStr = "(" + StringUtils.join(keyList, "|") + ")";
	    Pattern pattern = Pattern.compile(regexStr);
	    Matcher matcher = pattern.matcher(targetStr);
	    while(matcher.find()) {
	    	//String tmp = matcher.group(1);
	        matcher.appendReplacement(sb, "");
	    }
	    matcher.appendTail(sb);
		return sb.toString();
	}
	
	/**
	 * 是否为手机号
	 * 
	 * @param phoneNo
	 * @return
	 */
	public static boolean isPhoneNo(String phoneNo){
		if (StringUtils.isEmpty(phoneNo) || phoneNo.length() < 11) {
			return false;
		}
		Pattern phonePattern = Pattern.compile("^([\\*\\+]?86)?(13[0-9]|15[0-9]|176|177|178|147|145|170|18[0-9])[0-9]{8}$");
		if (!phonePattern.matcher(phoneNo).matches()) {
			return false;
		}
		return true;
	}
	
	/**
	 * 判断是否为电话号码
	 * 
	 * @param telesNo
	 * @return
	 */
	public static boolean isTelesNo(String telesNo){
		if(StringUtils.isEmpty(telesNo) || telesNo.length() < 5){
			return false;
		}
		Pattern telesPattern = Pattern.compile("^([08]{1}[0-9]{2,3})?[-:]?[1-9]{1}[0-9]{4,7}$");
		if (!telesPattern.matcher(telesNo).matches()) {
			return false;
		}
		return true;
	}
	
	/**
	 * <br/>Description:随机生成国内ip地址
	 * <p>Author:zcliu/刘子萃</p>
	 * @return
	 */
    public static String getRandomIp(){
         
        //ip范围
        int[][] range = {{607649792,608174079},//36.56.0.0-36.63.255.255
                         {1038614528,1039007743},//61.232.0.0-61.237.255.255
                         {1783627776,1784676351},//106.80.0.0-106.95.255.255
                         {2035023872,2035154943},//121.76.0.0-121.77.255.255
                         {2078801920,2079064063},//123.232.0.0-123.235.255.255
                         {-1950089216,-1948778497},//139.196.0.0-139.215.255.255
                         {-1425539072,-1425014785},//171.8.0.0-171.15.255.255
                         {-1236271104,-1235419137},//182.80.0.0-182.92.255.255
                         {-770113536,-768606209},//210.25.0.0-210.47.255.255
                         {-569376768,-564133889}, //222.16.0.0-222.95.255.255
        };
         
        Random rdint = new Random();
        int index = rdint.nextInt(10);
        String ip = num2ip(range[index][0]+new Random().nextInt(range[index][1]-range[index][0]));
        return ip;
    }
    
    /**
     * <br/>Description:将十进制转换成ip地址
     * <p>Author:zcliu/刘子萃</p>
     * @param ip
     * @return
     */
    public static String num2ip(int ip) {
        int [] b=new int[4] ;
        String x = "";
         
        b[0] = (int)((ip >> 24) & 0xff);
        b[1] = (int)((ip >> 16) & 0xff);
        b[2] = (int)((ip >> 8) & 0xff);
        b[3] = (int)(ip & 0xff);
        x=Integer.toString(b[0])+"."+Integer.toString(b[1])+"."+Integer.toString(b[2])+"."+Integer.toString(b[3]); 
         
        return x; 
     }
    
    /**
     * <br/>Description:byte转为base64编码
     * <p>Author:zcliu/刘子萃</p>
     * @param bytes
     * @return
     */
    public static String byteToBase64Str(byte[] bytes) {
        if (bytes == null || bytes.length <= 0) {
            return null;
        }
        String str = Base64.encodeBase64String(bytes);
        return str;
    }
    
    
    /**
     * <br/>Description:是否是windows
     * <p>Author:zcliu/刘子萃</p>
     * @return
     */
    public static boolean isWindowsOS(){
		boolean boo = false;
		try{
			Properties sp = System.getProperties();
			String osName = sp.getProperty("os.name");
			int osInt = osName.toLowerCase().indexOf("win");

			if(osInt != - 1){
				boo = true;
			}
		}catch(Exception e){
			System.out.println("获取操作系统名称异常。");
		}
		return boo;
	}
    
    /** 
     * 校验 营业执照注册号 
     * @param businesslicense 
     * @return 
     */  
    public static boolean isBusinesslicense(String businesslicense){  
        if ("".equals(businesslicense)||" ".equals(businesslicense)){
            return false;  
        }else if(businesslicense.length()!=15){
            return false;  
        }  
        String businesslicensePrex14 = businesslicense.substring(0,14);// 获取营业执照注册号前14位数字用来计算校验码  
        String businesslicense15 = businesslicense.substring(14,businesslicense.length());// 获取营业执照号的校验码  
        char[] chars = businesslicensePrex14.toCharArray();  
        int[] ints = new int[chars.length];  
        for(int i=0; i<chars.length;i++){  
            ints[i] = Integer.parseInt(String.valueOf(chars[i]));  
        }  
        getYYZZCode(ints);  
        if(businesslicense15.equals(getYYZZCode(ints)+"")){// 比较 填写的营业执照注册号的校验码和计算的校验码是否一致  
            return  true;  
        }  
        return false;  
    }  
	 /** 
     * 获取 营业执照注册号的校验码 
     * @param ints 
     * @return 
     */  
    private static int  getYYZZCode(int[] ints){  
        if (null != ints && ints.length > 1) {  
            int ti = 0;  
            int si = 0;// pi|11+ti  
            int cj = 0;// （si||10==0？10：si||10）*2  
            int pj = 10;// pj=cj|11==0?10:cj|11  
            for (int i=0;i<ints.length;i++) {  
                ti = ints[i];  
                pj = (cj % 11) == 0 ? 10 : (cj % 11);  
                si = pj + ti;  
                cj = (0 == si % 10 ? 10 : si % 10) * 2;  
                if (i == ints.length-1) {  
                    pj = (cj % 11) == 0 ? 10 : (cj % 11);  
                    return pj == 1 ? 1 : 11 - pj;  
                }  
            }  
        }  
        return -1;  
    }
    
    public static void main(String[] args) {
    	DateTimeFormatter formatter = DateTimeFormat.forPattern("yyyy-MM-dd").withZoneUTC();  
		System.out.println(formatter.parseDateTime("1986-05-04"));
		System.out.println(CommonUtils.getAgeByIdNumber("232331198605040024"));
	}
}
