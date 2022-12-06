package com.FoodieServers;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.FoodieModels.*;
public class productdao {
	private Connection con;
	public productdao(Connection con) {
		super();
		this.con = con;
	}
	
	
		public List<productobj> getAllProducts(String quary){
			List<productobj> products = new ArrayList<productobj> () ;
		ResultSet rs;	 
	try {
		
		PreparedStatement pst = con.prepareStatement(quary);
		rs = pst.executeQuery();
		while(rs.next()) {
			productobj row = new productobj(rs.getInt("food_id"),rs.getString("fname"),rs.getString("food_category"),rs.getInt("fprice"),rs.getString("food_image"));		
			products.add(row);
		}
		} catch(Exception e){
		e.printStackTrace();
	}
	return products;
		}
		 public Product getSingleProduct( int id) {
			 Product row = null;
		        try {
		        	String query = "select * from food_items where food_id=? ";	
		        	PreparedStatement pst = this.con.prepareStatement(query);
		            pst.setInt(1, id);
		            ResultSet rs = pst.executeQuery();

		            while (rs.next()) {
		            	row = new Product();
		                row.setId(rs.getInt("food_id"));
		                row.setName(rs.getString("fname"));
		                row.setCategory(rs.getString("food_category"));
		                row.setPrice(rs.getDouble("fprice"));
		                row.setImage(rs.getString("food_image"));
		            }
		        } catch (Exception e) {
		            e.printStackTrace();
		            System.out.println(e.getMessage());
		        }

		        return row;
		    }
		
		public double getTotalCartPrice(ArrayList<Cart> cartList) {
	        double sum = 0;
	        try {
	            if (cartList.size() > 0) {
	                for (Cart item : cartList) {
	                    String query = "select fprice from food_items where food_id=?";
	                    PreparedStatement pst = this.con.prepareStatement(query);
	                    pst.setInt(1, item.getId());
	                    ResultSet rs = pst.executeQuery();
	                    while (rs.next()) {
	                        sum+=rs.getDouble("fprice")*item.getQuantity();
	                    }

	                }
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }
	        return sum;
	    }

	    
	    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
	        List<Cart> book = new ArrayList<>();
	        try {
	            if (cartList.size() > 0) {
	                for (Cart item : cartList) {
	                    String query = "select * from food_items where food_id=?";
	                    PreparedStatement pst = this.con.prepareStatement(query);
	                    pst.setInt(1, item.getId());
	                    ResultSet rs = pst.executeQuery();
	                    while (rs.next()) {
	                        Cart row = new Cart();
	                        row.setId(rs.getInt("food_id"));
	                        row.setName(rs.getString("fname"));
	                        row.setCategory(rs.getString("food_category"));
	                        row.setPrice(rs.getDouble("fprice")*item.getQuantity());
	                        row.setQuantity(item.getQuantity());
	                        row.setImage(rs.getString("food_image"));
	                        book.add(row);
	                    }

	                }
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }
	        return book;
	    }
	}

