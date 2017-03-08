package org.exfly.models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.exfly.config.Config;

public class DatabaseUtil {
	Config configer = Config.getConfiger();
	protected Connection conn=null;
	
	/**
	 * 链接数据库，但是没有选择任何数据库
	 * @return
	 */
	public Connection getConnectWithoutDB() {
		try {
			Class.forName(configer.getItem("database.driver")).newInstance();
			conn = DriverManager.getConnection(configer.getItem("database.url"), configer.getItem("database.username"), configer.getItem("database.password"));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	/**
	 * @return 连接数据库并选择了相应的表 暂时为无连接池版本
	 */
	public Connection getConect(){
		try {
			Class.forName(configer.getItem("database.driver")).newInstance();
			conn = DriverManager.getConnection(configer.getItem("database.url")+configer.getItem("database.name")+"?useUnicode=true&characterEncoding=UTF-8", configer.getItem("database.username"), configer.getItem("database.password"));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	protected void finalize() throws Throwable {
		if (conn != null) {
			conn.close();
			System.out.print("数据库断开链接");
		}
	}
}
