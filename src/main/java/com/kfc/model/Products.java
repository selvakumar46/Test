package com.kfc.model;

import java.io.Serializable;
import java.util.Objects;

public class Products implements Serializable{
	private int productId;
	private String productName;
	private String description;
	private double price;
	private String productType;
	private String productStatus;
	private String productCatogory;
	private String productImg;

	public String getProductCatogory() {
		return productCatogory;
	}

	public String getProductImg() {
		return productImg;
	}

	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}

	public void setProductCatogory(String productCatogory) {
		this.productCatogory = productCatogory;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}

	public Products(int productId, String productName, String description, double price, String productType,
			String productStatus, String productCatogory) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.description = description;
		this.price = price;
		this.productType = productType;
		this.productStatus = productStatus;
		this.productCatogory = productCatogory;
	}

	public Products(int productId, String productName, String description, double price, String productType,
			String productStatus) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.description = description;
		this.price = price;
		this.productType = productType;
		this.productStatus = productStatus;
	}

	public Products(int productId, String productName, String description, double price, String productType,
			String productStatus, String productCatogory, String productImg) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.description = description;
		this.price = price;
		this.productType = productType;
		this.productStatus = productStatus;
		this.productCatogory = productCatogory;
		this.productImg = productImg;
	}

	public Products() {
		super();
	}

	@Override
	public String toString() {
		return "productId=" + productId + ", productName=" + productName + ", description=" + description + ", price="
				+ price + ", productType=" + productType + ", productStatus=" + productStatus;
	}

	@Override
	public int hashCode() {
		return Objects.hash(description, price, productCatogory, productId, productImg, productName, productStatus,
				productType);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Products other = (Products) obj;
		return Objects.equals(description, other.description)
				&& Double.doubleToLongBits(price) == Double.doubleToLongBits(other.price)
				&& Objects.equals(productCatogory, other.productCatogory) && productId == other.productId
				&& Objects.equals(productImg, other.productImg) && Objects.equals(productName, other.productName)
				&& Objects.equals(productStatus, other.productStatus) && Objects.equals(productType, other.productType);
	}

}
