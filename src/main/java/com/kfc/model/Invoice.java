package com.kfc.model;

import java.sql.Date;
import java.time.LocalDate;
import java.util.Objects;

public class Invoice {
	private int invoiceId;

	private int userId;
	private double totalPrice;
	private String deliveryAdress;
	
	private Date orderDate;

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getInvoiceId() {
		return invoiceId;
	}

	public void setInvoiceId(int invoiceId) {
		this.invoiceId = invoiceId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getDeliveryAdress() {
		return deliveryAdress;
	}

	public void setDeliveryAdress(String deliveryAdress) {
		this.deliveryAdress = deliveryAdress;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	

	public Invoice(int invoiceId, int userId,double totalPrice, String deliveryAdress,  Date orderDate) {
		super();
		this.invoiceId = invoiceId;
		this.userId = userId;
		this.totalPrice = totalPrice;
		this.deliveryAdress = deliveryAdress;
		
		this.orderDate = orderDate;
	}

	@Override
	public int hashCode() {
		return Objects.hash(deliveryAdress, invoiceId, orderDate, totalPrice, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Invoice other = (Invoice) obj;
		return Objects.equals(deliveryAdress, other.deliveryAdress) && invoiceId == other.invoiceId
				&& Objects.equals(orderDate, other.orderDate)
				&& Double.doubleToLongBits(totalPrice) == Double.doubleToLongBits(other.totalPrice)
				&& userId == other.userId;
	}

	@Override
	public String toString() {
		return "Invoice [invoiceId=" + invoiceId + ", userId=" + userId + ", totalPrice=" + totalPrice
				+ ", deliveryAdress=" + deliveryAdress + ", orderDate=" + orderDate + "]";
	}
	

}