package org.exfly.config;

import java.util.MissingResourceException;
import java.util.ResourceBundle;

/**
 * 
 * @author Exborn
 * @discribe 
 * 单例模式  读取配置文件
 * 
 */
public class Config {
	
	static protected Config Config_Instance=null;
	public ResourceBundle rb = null;
	
	private Config() {
		rb = ResourceBundle.getBundle("config");
	}
	
	/**
	 * 
	 * @return
	 */
	static public Config getConfiger() {
		if (Config_Instance == null){
			Config_Instance = new Config();
		}
		return Config_Instance;
	}
	
	/**
	 * 根据名字返回配置项
	 */
	public String getItem(String baseName) {
		String result= null;
		try{
			result = rb.getString(baseName);
		}
		catch(MissingResourceException ex){
			ex.printStackTrace();	
		}
		return result;
	}
}
