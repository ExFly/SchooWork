package org.exfly.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Movie {
	
	String id;
	String name_en;
	String name_zh;
	String playbill;
	java.time.Clock len_film;
	String productor;
	float score;
	String language;
	String foreshow;
	String summary;
	java.util.Date release;
	String IMDbURI;
	String filmtype;

	
	/**
	 * 根据不同电影种类返回电影的列表
	 * @param page
	 * @param sizePerPage
	 * @return
	 */
	public static List<Movie> getMoviesbyType(String type, int page, int sizePerPage) {
		List<Movie> movies = new LinkedList<Movie>();
		
		PreparedStatement pstmt = null;
		Connection conn = null;
		String result = null;
		Movie movie = null;
		try{
			conn = new DBConnector().getConect();
			
			/*验证是否已经存在用户*/
			String querySQL = "select * from movies, filmtype where movies.id=filmtype.movieid AND filmtype.filmtype=? ORDER BY douban_score desc limit ?,?;";
			pstmt = conn.prepareStatement(querySQL);
			pstmt.setString(1, type);
			pstmt.setInt(2, (page-1)*sizePerPage);
			pstmt.setInt(3, sizePerPage);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				movie = new Movie();
				movie.setId(rs.getString("id"));
				movie.setName_en(rs.getString("name_en"));
				movie.setName_zh(rs.getString("name_zh"));
				movie.setPlaybill(rs.getString("playbill"));
//				movie.setLen_film(rs.getTime("len_film"));
				movie.setProductor(rs.getString("producer"));
				movie.setScore(rs.getFloat("douban_score"));
				movie.setLanguage(rs.getString("language"));
				movie.setForeshow(rs.getString("foreshow"));
				movie.setSummary(rs.getString("summary"));
				movie.setIMDbURI(rs.getString("IMDbURI"));
//				movie.setFilmtype(rs.getString("filmtype"));
				movies.add(movie);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return movies;
	}
	
	/*
	 * 页码从1开始
	 * @return 电影的List
	 * */
	public static List<Movie> getMoviesbyPage(int page, int sizePerPage) {
		List<Movie> movies = new LinkedList<Movie>();
		
		PreparedStatement pstmt = null;
		Connection conn = null;
		String result = null;
		Movie movie = null;
		try{
			conn = new DBConnector().getConect();
			
			/*验证是否已经存在用户*/
			String querySQL = "select * from movies ORDER BY douban_score desc limit ?,?;";
			pstmt = conn.prepareStatement(querySQL);
			pstmt.setInt(1, (page-1)*sizePerPage);
			pstmt.setInt(2, sizePerPage);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				movie = new Movie();
				movie.setId(rs.getString("id"));
				movie.setName_en(rs.getString("name_en"));
				movie.setName_zh(rs.getString("name_zh"));
				movie.setPlaybill(rs.getString("playbill"));
//				movie.setLen_film(rs.getTime("len_film"));
				movie.setProductor(rs.getString("producer"));
				movie.setScore(rs.getFloat("douban_score"));
				movie.setLanguage(rs.getString("language"));
				movie.setForeshow(rs.getString("foreshow"));
				movie.setSummary(rs.getString("summary"));
				movie.setIMDbURI(rs.getString("IMDbURI"));
//				movie.setFilmtype(rs.getString("filmtype"));
				movies.add(movie);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return movies;
	}

	public static Movie getMoviebyID(String id) {
		PreparedStatement pstmt = null;
		Connection conn = null;
		String result = null;
		Movie movie = null;
		try{
			conn = new DBConnector().getConect();
			
			/*验证是否已经存在用户*/
			String querySQL = "select * from movies where id=?";
			pstmt = conn.prepareStatement(querySQL);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			movie = new Movie();
			if(rs.next()){
				movie.setId(rs.getString("id"));
				movie.setName_en(rs.getString("name_en"));
				movie.setName_zh(rs.getString("name_zh"));
				movie.setPlaybill(rs.getString("playbill"));
//				movie.setLen_film(rs.getTime("len_film"));
				movie.setProductor(rs.getString("producer"));
				movie.setScore(rs.getFloat("douban_score"));
				movie.setLanguage(rs.getString("language"));
				movie.setForeshow(rs.getString("foreshow"));
				movie.setSummary(rs.getString("summary"));
				movie.setIMDbURI(rs.getString("IMDbURI"));
//				movie.setFilmtype(rs.getString("filmtype"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return movie;
	}
	
	public static void commentMovie(String userid, String movieid, float score, String comment) {
		
		String sql = "";
		PreparedStatement pstmt = null;
		Connection conn = null;
		
		try{
			conn = new DBConnector().getConect();
			
			// TODO: 没有限制重复评分
			String insertSQL = "insert into user_movie_impressions(id,userid,movieid,score,comment,datetime) values (?,?,?,?,?,?);";
			pstmt = conn.prepareStatement(insertSQL);
		    String _id = DBStaticTools.getUUID();
		    pstmt.setString(1, _id);
		    pstmt.setString(2, userid);
		    pstmt.setString(3, movieid);
		    pstmt.setFloat(4, score);
		    pstmt.setString(5, comment);
		    pstmt.setTimestamp(6, new java.sql.Timestamp(System.currentTimeMillis()));
		    
		    pstmt.executeUpdate();
		}
		catch(SQLException e) {
			
			String insertSQL2 = "update user_movie_impressions set score=?,comment=?,datetime=? where userid=?,movieid=?;";
			try {
				pstmt = conn.prepareStatement(insertSQL2);
			    pstmt.setFloat(1, score);
			    pstmt.setString(2, comment);
			    pstmt.setTimestamp(3, new java.sql.Timestamp(System.currentTimeMillis()));
			    pstmt.setString(4, userid);
			    pstmt.setString(5, movieid);
			    pstmt.executeUpdate();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		    
		}
	}
	
	public static void wantedMovie(String userid, String movieid) {
		// TODO: 想看电影　增加判断条件
		// TODO: 没有防止重复评论
		_hadsaw_wanted( userid, movieid, "want");
	}
	
	public static void hadsawMovie(String userid, String movieid) {
		// TODO:　看过电影　增加判断条件
		// TODO: 没有防止重复评论
		_hadsaw_wanted( userid, movieid, "hadsaw");
	}
	
	protected static void _hadsaw_wanted(String userid, String movieid, String type) {
		String sql = "";
		PreparedStatement pstmt = null;
		Connection conn = null;
		
		try{
			conn = new DBConnector().getConect();
			
//			/*验证是否已经存在用户*/
//			String querySQL = "select * from user_movie_impressions where =?;";
//			pstmt = conn.prepareStatement(querySQL);
//			pstmt.setString(1, _username);
//			ResultSet rs = pstmt.executeQuery();
//			if(rs.next()){
//				return;
//			}
			
			/*如果不存在此用户，则可以注册*/
			String insertSQL = "insert into user_movie_impressions(id,userid,movieid,hadsaw_wanted) values (?,?,?,?);";
			pstmt = conn.prepareStatement(insertSQL);
		    String _id = DBStaticTools.getUUID();
		    pstmt.setString(1, _id);
		    pstmt.setString(2, userid);
		    pstmt.setString(3, movieid);
		    pstmt.setString(4, type);
		    pstmt.executeUpdate();
		}
		catch(SQLException e) {
			
			String insertSQL2 = "update user_movie_impressions set hadsaw_wanted=? where userid=?,movieid=?;";
			try {
				pstmt = conn.prepareStatement(insertSQL2);
			    pstmt.setString(1, type);
			    pstmt.setString(2, userid);
			    pstmt.setString(3, movieid);
			    pstmt.executeUpdate();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		    
		}
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName_en() {
		return name_en;
	}
	public void setName_en(String name_en) {
		this.name_en = name_en;
	}
	public String getName_zh() {
		return name_zh;
	}
	public void setName_zh(String name_zh) {
		this.name_zh = name_zh;
	}
	public String getPlaybill() {
		return playbill;
	}
	public void setPlaybill(String playbill) {
		this.playbill = playbill;
	}
	public java.time.Clock getLen_film() {
		return len_film;
	}
	public void setLen_film(java.time.Clock len_film) {
		this.len_film = len_film;
	}
	public String getProductor() {
		return productor;
	}
	public void setProductor(String productor) {
		this.productor = productor;
	}
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String lenguage) {
		this.language = lenguage;
	}
	public String getForeshow() {
		return foreshow;
	}
	public void setForeshow(String foreshow) {
		this.foreshow = foreshow;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public java.util.Date getRelease() {
		return release;
	}
	public void setRelease(java.util.Date release) {
		this.release = release;
	}
	public String getIMDbURI() {
		return IMDbURI;
	}
	public void setIMDbURI(String iMDbURI) {
		IMDbURI = iMDbURI;
	}
	public String getFilmtype() {
		return filmtype;
	}
	public void setFilmtype(String filmtype) {
		this.filmtype = filmtype;
	}
}
