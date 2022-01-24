package com.kfc.dao;

import java.time.LocalDate;
import java.util.List;

import com.kfc.model.CartItem;

public interface cartItemDao {
	public boolean insertCart(CartItem carts);

	public boolean updateStatus(CartItem cart);

	public boolean delete();

	public List<CartItem> showUsers();

	public List<CartItem> showInvoice(CartItem carts);
	public double sumOfPrice(LocalDate date) ;

}
