package com.FoodieServers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {
 public static Connection getConnection() throws ClassNotFoundException, SQLException{
	 Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie", "root","1234");
		return con;
 }
}
