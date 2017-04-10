package org.exfly.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Movie {
	
	String id;
	String name_en;
	String name_zh;
	String playbill;
	java.time.Clock len_film;
	String productor;
	int score;
	String language;
	String foreshow;
	String summary;
	java.util.Date release;
	String IMDbURI;
	String filmtype;


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
				movie.setScore(rs.getInt("douban_score"));
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
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
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
