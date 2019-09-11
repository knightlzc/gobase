package com.gobase.tools.common;

import java.security.MessageDigest;

public class MD5Util {
    /**
     * MD5方法
     *
     * @param text 明文
     * @param charset 密钥
     * @return 密文
     * @throws Exception
     */
	public static String md5(String text, String charset) throws Exception {
		byte[] bytes = text.getBytes(charset);
		MessageDigest messageDigest = MessageDigest.getInstance("MD5");
		messageDigest.update(bytes);
		bytes = messageDigest.digest();

		StringBuilder sb = new StringBuilder();
		for (byte aByte : bytes) {
			if ((aByte & 0xff) < 0x10) {
				sb.append("0");
			}
			sb.append(Long.toString(aByte & 0xff, 16));
		}

		return sb.toString().toLowerCase();
	}
	public static String md5(String str)  throws Exception{
		if (str == null) {
			return null;
		}
		MessageDigest messageDigest = null;
		messageDigest = MessageDigest.getInstance("MD5");
		messageDigest.reset();
		messageDigest.update(str.getBytes("UTF-8"));
		byte[] byteArray = messageDigest.digest();
		StringBuffer md5StrBuff = new StringBuffer();
		for (int i = 0; i < byteArray.length; i++) {
			if (Integer.toHexString(0xFF & byteArray[i]).length() == 1)
				md5StrBuff.append("0").append(Integer.toHexString(0xFF & byteArray[i]));
			else
				md5StrBuff.append(Integer.toHexString(0xFF & byteArray[i]));
		}
		return md5StrBuff.toString();
	}


	public static void main(String[] args) throws Exception {
		System.out.println(md5("123123131"));
		System.out.println(md5("123123131","UTF-8"));
	}

	/**
	 * MD5验证方法
	 *
	 * @param text 明文
	 * @param charset 字符编码
	 * @param md5 密文
	 * @return true/false
	 * @throws Exception
	 */
	public static boolean verify(String text, String charset, String md5) throws Exception {
		String md5Text = md5(text, charset);
		if(md5Text.equalsIgnoreCase(md5))
		{
			return true;
		}

			return false;
	}
}