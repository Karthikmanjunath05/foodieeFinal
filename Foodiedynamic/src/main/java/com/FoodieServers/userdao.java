package com.FoodieServers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.FoodieModels.User;

public class userdao {
	private Connection con;
	userobj row;
	public userdao(Connection con) {
		super();
		this.con = con;
	}
		public userobj getAllusers(String quary){
		ResultSet rs;	 
	try {
		
		PreparedStatement pst = con.prepareStatement(quary);
		rs = pst.executeQuery();
		while(rs.next()) {
			row = new userobj(rs.getInt("customerId"),rs.getString("ucontact"),rs.getString("uemail"),rs.getString("uname"),rs.getString("uaddress"),rs.getString("upass"));		
			
		}
		} catch(Exception e){
		e.printStackTrace();
	}
	return row;
		}
		public User userLogin(String email, String password) {
			User user = null;
	        try {
	            String query = "select * from customer where uemail=? and upass=?";
	            PreparedStatement pst = this.con.prepareStatement(query);
	            pst.setString(1, email);
	            pst.setString(2, password);
	            ResultSet rs = pst.executeQuery();
	            if(rs.next()){
	            	user = new User();
	            	user.setId(rs.getInt("customerId"));
	            	user.setName(rs.getString("uname"));
	            	user.setEmail(rs.getString("uemail"));
	            	user.setAddress(rs.getString("uaddress"));
	            	user.setContact(rs.getString("ucontact"));
	            }
	        } catch (SQLException e) {
	            System.out.print(e.getMessage());
	        }
	        return user;
	    }
	}