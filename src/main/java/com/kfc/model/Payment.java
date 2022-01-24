package com.kfc.model;

import java.sql.Date;
import java.util.Objects;

public class Payment {
	private int transactionId;
	private int user_id;
	private long cardNumber;
	private String cardType;
	private String upiID;
	private Date transactionDate;
	public int getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(int transactionId) {
		this.transactionId = transactionId;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public long getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(long cardNumber) {
		this.cardNumber = cardNumber;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	public String getUpiID() {
		return upiID;
	}
	public void setUpiID(String upiID) {
		this.upiID = upiID;
	}
	public Date getTransactionDate() {
		return transactionDate;
	}
	public void setTransactionDate(Date transactionDate) {
		this.transactionDate = transactionDate;
	}
	public Payment(int transactionId, int user_id, long cardNumber, String cardType, String upiID,
			Date transactionDate) {
		super();
		this.transactionId = transactionId;
		this.user_id = user_id;
		this.cardNumber = cardNumber;
		this.cardType = cardType;
		this.upiID = upiID;
		this.transactionDate = transactionDate;
	}
	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public int hashCode() {
		return Objects.hash(cardNumber, cardType, transactionDate, transactionId, upiID, user_id);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Payment other = (Payment) obj;
		return cardNumber == other.cardNumber && Objects.equals(cardType, other.cardType)
				&& Objects.equals(transactionDate, other.transactionDate) && transactionId == other.transactionId
				&& Objects.equals(upiID, other.upiID) && user_id == other.user_id;
	}
	@Override
	public String toString() {
		return "Payment [transactionId=" + transactionId + ", user_id=" + user_id + ", cardNumber=" + cardNumber
				+ ", cardType=" + cardType + ", upiID=" + upiID + ", transactionDate=" + transactionDate + "]";
	}
	
	
}
