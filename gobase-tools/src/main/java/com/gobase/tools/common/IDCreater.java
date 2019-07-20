package com.gobase.tools.common;

import java.net.InetAddress;
import java.text.DecimalFormat;
import java.text.FieldPosition;
import java.text.Format;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
public class IDCreater {

	private static final Logger logger = LoggerFactory.getLogger(IDCreater.class);

	/** The FieldPosition. */
	private static final FieldPosition HELPER_POSITION = new FieldPosition(0);

	/** This Format for format the data to special format. */
	private final static Format dateFormat = new SimpleDateFormat("yyMMddHHmm");

	/** This Format for format the number to special format. */
	private final static NumberFormat numberFormat = new DecimalFormat("0000");

	/** This int is the sequence number ,the default value is 0. */
	private static int seq = 0;

	private static final int MAX = 9999;

	private static String ipPart = "000";

	static {
		/**
		 * 获取本地IP后缀作为生成的ID的一部分。如本地IP是192.168.0.122,则为122。如果不满3位，前面补0<br/>
		 * 如果获取异常，则使用000
		 */
		try {
			InetAddress address = InetAddress.getLocalHost();
			String hostAddress = address.getHostAddress();
			System.out.println(hostAddress);
			ipPart = hostAddress.substring(hostAddress.lastIndexOf(".") + 1);
			if (ipPart.length() > 3) {
				ipPart = ipPart.substring(0, 3);
			}
			for (int i = ipPart.length(); i < 3; i++) {
				ipPart = "0" + ipPart;
			}
		} catch (Exception e) {
			logger.error("获取本地IP前缀错误！", e);
		}
	}

	/**
	 * 时间格式生成序列
	 * 
	 * @return String
	 */
	public static synchronized String generate(final String prefix) {

		Calendar rightNow = Calendar.getInstance();

		StringBuffer sb = new StringBuffer();
		
		numberFormat.format(seq, sb, HELPER_POSITION);
		
		dateFormat.format(rightNow.getTime(), sb, HELPER_POSITION);

		if (seq == MAX) {
			seq = 0;
		} else {
			seq++;
		}

//		logger.debug("THE SQUENCE IS :{}", prefix + ipPart + sb.toString());

		return prefix + ipPart + sb.toString();
	}

	public static void main(String[] args) {
		for (int i = 0; i < 10; i++) {
			System.out.println(IDCreater.generate(""));
		}

		Date date = new Date(1520265600L * 1000);
		System.out.println(date);
	}
}
