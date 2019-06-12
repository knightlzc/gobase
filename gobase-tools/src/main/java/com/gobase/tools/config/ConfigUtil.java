package com.gobase.tools.config;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSONObject;

public class ConfigUtil {

	private static final Pattern PATTERN = Pattern.compile("\\$\\{([^\\}]+)\\}");

	private static ConfigUtil configUtil = new ConfigUtil();
	private static Properties prop;

	private static Logger logger = Logger.getLogger(ConfigUtil.class);

	private static Properties getConfig() {
		if (prop == null) {
			synchronized (configUtil) {
				if (prop == null) {
					prop = new Properties();
					String filePath = System.getProperty("configFilePath");
					if (filePath == null) {
						filePath = System.getenv().get("configFilePath");
					}
					if (filePath == null) {
						try {
							prop.load(ConfigUtil.class.getResourceAsStream("/application.properties"));
						} catch (IOException e) {
							logger.error(e.getMessage(), e);
						}
					} else {
						try {
							prop.load(new FileInputStream(filePath));
						} catch (IOException e) {
							logger.error(e.getMessage(), e);
						}
					}
				}
			}
		}
		return prop;
	}

	/**
	 * 将config.properties配置文件所有内容以json返回
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public static String getAllPropertiesJson(){
		Properties properties = getConfig();
		Iterator it=properties.entrySet().iterator();
		JSONObject jsonObj = new JSONObject();
		while(it.hasNext()){
		    Map.Entry entry=(Map.Entry)it.next();
		    String key = (String)entry.getKey();
		    Object value = entry.getValue();
		    jsonObj.put(key, value);
		}
		System.out.println(jsonObj.toJSONString());
		return jsonObj.toJSONString();
	}
	
	/**
	 * 获取配置文件值
	 * @param key
	 * @return
	 */
	public static String getProperty(String key) {
		Properties properties = ConfigUtil.getConfig();
		String value = properties.getProperty(key);
		Matcher matcher = PATTERN.matcher(value);
		StringBuffer buffer = new StringBuffer();
		while (matcher.find()) {
			String matcherKey = matcher.group(1);
			String matchervalue = properties.getProperty(matcherKey);
			if (matchervalue != null) {
				matcher.appendReplacement(buffer, matchervalue);
			}
		}
		matcher.appendTail(buffer);
		return buffer.toString();
	}

}
