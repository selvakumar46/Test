package com.kfc.model;

import java.sql.Date;
import java.time.LocalDate;
import java.util.Objects;

public class CartItem {
	private int cartId;
	private int productId;
	private int userId;
	private String productName;
	private int quantity;
	private double totalPrice;
	private String status;
	private Date orderDate;
	private LocalDate orderDate1;
	
	
	public LocalDate getOrderDate1() {
		return orderDate1;
	}
	public void setOrderDate1(LocalDate orderDate1) {
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
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public CartItem(int cartId, int productId, int userId, String productName, int quantity, double totalPrice,
			String status, Date orderDate) {
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
	public CartItem(LocalDate date) {
		// TODO Auto-generated constructor stub
		this.orderDate1=date;
	}
	
	public CartItem() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CartItem(double double1) {
		// TODO Auto-generated constructor stub
		this.totalPrice=double1;
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
	public double sumOfPrice(LocalDate date, int userId2) {
		// TODO Auto-generated method stub
		this.orderDate1=date;
		this.userId=userId2;
		return 0;
	}
	
	

}
