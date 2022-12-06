package com.FoodieModels;

import java.io.Serializable;

public class Cart extends Product implements Serializable{
private int quantity;
	

	

	public Cart() {
	}


	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
