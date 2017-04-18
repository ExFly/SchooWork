package org.exfly.models.auth;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import org.exfly.models.DBConnector;
import org.exfly.models.DBStaticTools;


public class User {
	protected String id;
	protected String username;
	protected String password;
	protected int permission;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getPermission() {
		return permission;
	}

	public void setPermission(int permission) {
		this.permission = permission;
	}

	public static boolean hasPermission(User user) {
		return isAdmin(user);
	}

	public static boolean hasPermission(String userid) {
		return isAdmin(userid);
	}
	
	public static boolean isAdmin(String userid) {
		return isAdmin(getUserbyID(userid));
	}
	
	public static boolean isAdmin(User user) {
		return _hasPermission(user.permission, 9);
	}
	
	protected static boolean _hasPermission(int permissionUser, int permission) {
		return permissionUser >= permission;
	}
	
	protected static User _getUserbyIDorUsername(String sql, String para){
		User user=null;
		
		PreparedStatement pstmt = null;
		Connection conn = null;
		String result = null;
		try{
			conn = new DBConnector().getConect();
			
			/*验证是否已经存在用户*/
			String querySQL = sql;
			pstmt = conn.prepareStatement(querySQL);
			pstmt.setString(1, para);
			ResultSet rs = pstmt.executeQuery();
			user = new User();
			if(rs.next()){
				user.id = rs.getString("id");
				user.username = rs.getString("username");
				user.password = rs.getString("password");
				user.permission = rs.getInt("permission");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	public static User getUserbyID(String userid) {
		String sql = "select * from users where id=?;";
		return _getUserbyIDorUsername(sql, userid);
	}
	
	public static User getUserbyUsername(String username) {
		String sql = "select * from users where username=?;";
		return _getUserbyIDorUsername(sql, username);
	}
	
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
	
	public static List<User> getUserbyPage(int page, int sizePerPage){
		List<User> usersList = new LinkedList<User>();
		
		PreparedStatement pstmt = null;
		Connection conn = null;
		String result = null;
		User user = null;
		try{
			conn = new DBConnector().getConect();
			
			/*验证是否已经存在用户*/
			String querySQL = "select * from users ORDER BY create_time desc limit ?,?;";
			pstmt = conn.prepareStatement(querySQL);
			pstmt.setInt(1, (page-1)*sizePerPage);
			pstmt.setInt(2, sizePerPage);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				user = new User();
				user.id = rs.getString("id");
				user.username = rs.getString("username");
				user.password = rs.getString("password");
				user.permission = rs.getInt("permission");
				usersList.add(user);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return usersList;
	}
}
