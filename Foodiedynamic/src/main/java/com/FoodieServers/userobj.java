package com.FoodieServers;

public class userobj {
	private int id;
	private String name,address, email, pass, contact;
	public userobj(int id, String contact, String name, String address, String email, String pass) {
		super();
		this.id = id;
		this.contact = contact;
		this.name = name;
		this.address = address;
		this.email = email;
		this.pass = pass;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	@Override
	public String toString() {
		return "userobj [id=" + id + ", contact=" + contact + ", name=" + name + ", address=" + address + ", email="
				+ email + ", pass=" + pass + "]";
	}
	
}
