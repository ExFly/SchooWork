package org.exfly.ctrls.auth;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import org.exfly.models.DBConnector;
import org.exfly.models.DBStaticTools;;


public class User {
	protected String username;
	protected String password;
	
	/**
	 * 将相应的账号密码存入数据库，并返回id
	 * @return
	 */
	public String signUp(String _username, String _password){
		String u_id = _doSignUp(_username, _password);
		String msg = null;
		if(u_id == null) {
			msg = "用户已经存在";
		}else {
			msg = "注册成功";
		}
		Logger runinglogger = LogManager.getLogger("runing.test");
		runinglogger.debug("user signup: " + u_id + " "+msg);
		
		return u_id;
	}
	
	/**
	 * 
	 * @param username
	 * @param password
	 * @return 用户id
	 */
	public String login(String _username, String _password) {
		String u_id = _doLogin(_username, _password);
		String msg = null;
		if(u_id == null) {
			msg = "登陆失败";
		}else {
			msg = "登陆成功";
		}
		Logger runinglogger = LogManager.getLogger("runing.test");
		runinglogger.debug("user login: " + u_id + " "+msg);
		return u_id;
	}
	
	protected String _doLogin(String _username, String _password) {
		PreparedStatement pstmt = null;
		Connection conn = null;
		String result = null;
		try{
			conn = new DBConnector().getConect();
			
			/*验证是否已经存在用户*/
			String querySQL = "select * from users where username=? and password=?;";
			pstmt = conn.prepareStatement(querySQL);
			pstmt.setString(1, _username);
			pstmt.setString(2, _password);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getString("id");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 
	 * @param _username
	 * @param _password
	 * @return 返回用户id表示注册成功，返回null表示注册失败，可能已经有此用户
	 */
	protected String _doSignUp(String _username, String _password) {
		String result=null;
		PreparedStatement pstmt = null;
		Connection conn = null;
		
		try{
			conn = new DBConnector().getConect();
			
			/*验证是否已经存在用户*/
			String querySQL = "select * from users where username=?;";
			pstmt = conn.prepareStatement(querySQL);
			pstmt.setString(1, _username);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				return null;
			}
			
			/*如果不存在此用户，则可以注册*/
			String insertSQL = "insert into users(id,username,password,create_time,modify_time) values (?,?,?,?,?);";
			pstmt = conn.prepareStatement(insertSQL);
		    String _id = DBStaticTools.getUUID();
		    pstmt.setString(1, _id);
		    pstmt.setString(2, _username);
		    pstmt.setString(3, _password);
		    Timestamp datetime = new java.sql.Timestamp(System.currentTimeMillis());
		    pstmt.setTimestamp(4, datetime);
		    pstmt.setTimestamp(5, datetime);
		    pstmt.executeUpdate();
		    result = _id;
		}
		catch(SQLException e) {
			
			e.printStackTrace();
			String msg = e.getMessage();
			Logger runinglogger = LogManager.getLogger("runing.test");
			
			runinglogger.debug(msg);
		}
		return result;
	}
}
