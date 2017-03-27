package org.exfly.tools;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import org.exfly.models.DBConnector;

import org.exfly.config.Config;

public class InitDatabase {
	
	public void creatDatabase() {
		Config configer = Config.getConfiger();
		Connection conn = new DBConnector().getConnectWithoutDB();
		Statement stmt = null;
		String DB_NAME = configer.getItem("database.name");
		try{
		    stmt = conn.createStatement();
		    
		    String sql = "CREATE DATABASE " + DB_NAME + " default character set utf8 default collate utf8_general_ci;";
		    try{
		    	stmt.executeUpdate(sql);
		    	System.out.println("Create database successful!");
		    } catch(Exception e) {
		    	String dsql = "Drop Database " + DB_NAME;
		    	System.out.println("Drop and Create database!");
		    	stmt.executeUpdate(dsql);
		    	stmt.executeUpdate(sql);
		    	System.out.println("Drop and Create database successful");
		    }
		} catch(Exception e) {
			e.printStackTrace();
		} finally{
			//finally block used to close resources
			try{
				if(stmt!=null)
					stmt.close();
			} catch(SQLException se2) {
				se2.printStackTrace();
			}// nothing we can do
			try{
				if(conn!=null)
					conn.close();
			} catch(SQLException se) {
				se.printStackTrace();
			}//end finally try
		}
	}
	
	public static void main(String[] args) {
		InitDatabase database = new InitDatabase();
		try{
			database.creatDatabase();
			System.out.println("Creat Database over");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}
}
