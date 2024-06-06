package com.db;
import java.sql.*;
public class DBconnect {

	private static Connection conn;
	public static Connection getConn()
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
            conn =DriverManager.getConnection( "jdbc:mysql://localhost:3306/ems?characterEncoding=utf8","root","srivkp@2003");
            
            
		}
		catch(Exception ae) {
			ae.printStackTrace();
		}
		return conn;
	}
	
}
