package com.kfc.model;

import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Objects;

public class CartItem implements Serializable{
	private int cartId;
	private int productId;
	private int userId;
	private String productName;
	private int quantity;
	private double totalPrice;
	private String status;
	private LocalDateTime orderDate;
	private Date orderDate1;

	public Date getOrderDate1() {
		return orderDate1;
	}

	public void setOrderDate1(Date orderDate1) {
		this.orderDate1 = orderDate1;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
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

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public LocalDateTime getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(LocalDateTime orderDate) {
		this.orderDate = orderDate;
	}

	public CartItem(int cartId, int productId, int userId, String productName, int quantity, double totalPrice,
			String status, LocalDateTime orderDate) {
		super();
		this.cartId = cartId;
		this.productId = productId;
		this.userId = userId;
		this.productName = productName;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
		this.status = status;
		this.orderDate = orderDate;
	}

	public CartItem(Date date) {
		this.orderDate1 = date;
	}

	public CartItem() {
		super();
	}

	public CartItem(double double1) {
		this.totalPrice = double1;
	}
	@Override
	public int hashCode() {
		return Objects.hash(cartId, orderDate, productId, productName, quantity, status, totalPrice, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CartItem other = (CartItem) obj;
		return cartId == other.cartId && Objects.equals(orderDate, other.orderDate) && productId == other.productId
				&& Objects.equals(productName, other.productName) && quantity == other.quantity
				&& Objects.equals(status, other.status)
				&& Double.doubleToLongBits(totalPrice) == Double.doubleToLongBits(other.totalPrice)
				&& userId == other.userId;
	}

	@Override
	public String toString() {
		return "CartItem [cartId=" + cartId + ", productId=" + productId + ", userId=" + userId + ", productName="
				+ productName + ", quantity=" + quantity + ", totalPrice=" + totalPrice + ", status=" + status
				+ ", orderDate=" + orderDate + "]";
	}

	public double sumOfPrice(Date date, int userId2) {
		this.orderDate1 = date;
		this.userId = userId2;
		return 0;
	}

}
