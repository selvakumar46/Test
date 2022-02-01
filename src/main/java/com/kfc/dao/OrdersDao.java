package com.kfc.dao;

import java.util.List;

import com.kfc.model.Orders;

public interface OrdersDao {
	public boolean insertOrder(Orders order);

	public List<Orders> showOrders(Orders order);

	public boolean delOrder(Orders deleteOrders);

	public boolean updateOrder(Orders updateOrders);

	public List<Orders> allCart(Orders order1);

	public boolean delOrderCart(Orders deleteOrder);

	public double sumOfPrice(Orders user);

}
