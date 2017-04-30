package org.exfly.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

public class Filetype {
	String id;
	String type;
	String name;
	
	protected static Filetype _getFiletypebyID(ResultSet rs) throws Exception {
		Filetype filmtype = new Filetype();
		
		filmtype.id = rs.getString("id");
		filmtype.type = rs.getString("type");
		filmtype.name = rs.getString("name");
		return filmtype;
	}
	
	public static List<Filetype> getFiletypeList() {
		List<Filetype> filetypes = new LinkedList<Filetype>();
		
		PreparedStatement pstmt = null;
		Connection conn = null;
		String result = null;
		Filetype filmtype = null;
		
		try{
			conn = new DBConnector().getConect();
			
			/*验证是否已经存在用户*/
			String querySQL = "select * from filmtype_meta;";
			pstmt = conn.prepareStatement(querySQL);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				filmtype = _getFiletypebyID(rs);
				filetypes.add(filmtype);
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filetypes;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	
}
