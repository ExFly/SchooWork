package org.exfly.models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.exfly.config.Config;

public class Util {
	Config configer = Config.getConfiger();
	protected Connection conn=null;
	public Connection getConnect() {
		try {
			Class.forName(configer.getItem("database.driver")).newInstance();
			conn = DriverManager.getConnection(configer.getItem("database.url"), configer.getItem("database.username"), configer.getItem("database.password"));
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
