package org.exfly.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.exfly.models.DatabaseUtil;

public class TestQueryZH {
	public static void main(String[] args) {
		Connection conn = new DatabaseUtil().getConect();
		PreparedStatement pstmt = null;
		try {
		    String SQL = "INSERT INTO Employees(age, first, last) VALUES(18, '三','张');";
		    pstmt = conn.prepareStatement(SQL);
		    pstmt.execute();
		    ResultSet rs = pstmt.executeQuery("select * from Employees;");
		    while(rs.next()) {
		    	System.out.print(rs.getString("last") + " ");
		    	System.out.println(rs.getString("last").equals("张"));
		    }
		    pstmt = conn.prepareStatement("DELETE FROM Employees");
		    pstmt.execute();
		    
		}
		catch (SQLException e) {
	    	e.printStackTrace();
	    }
		finally {
		    try{
		    	pstmt.close();
		    }
		    catch(SQLException e) {
		    	e.printStackTrace();
		    }
		}

	}
}
