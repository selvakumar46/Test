package com.kfc.model;

import java.io.Serializable;
import java.util.Objects;

public class Orders implements Serializable{
	private int orderId;
	private int productId;
	private int userId;
	private int quantity;
	private Double totalPrice;
	private String productName;
	private double price;

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Orders(int orderId, int productId, int userId, int quantity, Double totalPrice) {
		super();
		this.orderId = orderId;
		this.productId = productId;
		this.userId = userId;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "orderId=" + orderId + ", productId=" + productId + ", userId=" + userId + ", quantity=" + quantity
				+ ", totalPrice=" + totalPrice;
	}

	public Orders() {
		super();
	}

	@Override
	public int hashCode() {
		return Objects.hash(orderId, productId, quantity, totalPrice, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Orders other = (Orders) obj;
		return orderId == other.orderId && productId == other.productId && quantity == other.quantity
				&& Objects.equals(totalPrice, other.totalPrice) && userId == other.userId;
	}

	public Orders(int orderId, int productId, int userId, int quantity, Double totalPrice, String productName,
			double price) {
		super();
		this.orderId = orderId;
		this.productId = productId;
		this.userId = userId;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
		this.productName = productName;
		this.price = price;
	}

}
