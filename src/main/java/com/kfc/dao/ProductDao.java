package com.kfc.dao;

import java.util.List;

import com.kfc.model.Products;

public interface ProductDao {

	public List<Products> showProduct();

	public Products validateProduct(String selectProduct);

	public boolean deleteProduct(Products products);

	public boolean updateProduct(Products products);

	public boolean insertProducts(Products productInsert);

	public Products validateProduct1(Products product);

	public List<Products> showTrending();

	public List<Products> showBucket();

	public List<Products> showProductAdmin();

	public boolean updatePrice(Products products);

	public List<Products> serachProduct(String proName);

}
