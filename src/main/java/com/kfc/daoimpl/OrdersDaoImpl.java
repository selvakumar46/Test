package com.kfc.daoimpl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kfc.dao.OrdersDao;
import com.kfc.model.Orders;
import com.kfc.util.ConnectionUtil;

public class OrdersDaoImpl implements OrdersDao {

	public boolean insertOrder(Orders order) {

		String insertOrder = "insert into order_kfc (product_id,user_id,quantity,total_price) values (?,?,?,?)";
		Connection con = ConnectionUtil.getDBConnection();
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(insertOrder);
			pstmt.setInt(1, order.getProductId());
			pstmt.setInt(2, order.getUserId());
			pstmt.setInt(3, order.getQuantity());
			pstmt.setDouble(4, order.getTotalPrice());
			pstmt.executeUpdate();

			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;

	}

	public List<Orders> showOrders(Orders order) {
		List<Orders> listOfOrders = new ArrayList<Orders>();

		String query = "select pr.product_name,pr.product_price,ord.quantity,ord.total_price,pr.product_id from products_kfc pr inner join order_kfc ord on ord.product_id=pr.product_id where user_id=?";
		Orders orders = null;
		Connection con = ConnectionUtil.getDBConnection();
		CallableStatement cstmt;
		try {
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, order.getUserId());
			ResultSet rs = cstmt.executeQuery();
			while (rs.next()) {
				orders = new Orders(rs.getString(1), rs.getDouble(2), rs.getInt(3), rs.getDouble(4), rs.getInt(5));
				listOfOrders.add(orders);
			}
			return listOfOrders;
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return listOfOrders;
	}

	public boolean delOrder(Orders deleteOrders) {
		Orders orders = new Orders();
		String delQuery = "delete  from order_kfc where user_id=? ";
		Connection con = ConnectionUtil.getDBConnection();
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(delQuery);
			pstmt.setInt(1, deleteOrders.getUserId());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;

	}

	public boolean updateOrder(Orders updateOrders) {
		String update = "update order_kfc set quantity=?, total_price=?  where user_id=? and product_id=?";
		Connection con = ConnectionUtil.getDBConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(update);
			pstmt.setInt(1, updateOrders.getQuantity());
			pstmt.setDouble(2, updateOrders.getTotalPrice());
			pstmt.setInt(3, updateOrders.getUserId());
			pstmt.setInt(4, updateOrders.getProductId());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;

	}

	public List<Orders> allCart(Orders order1) {

		List<Orders> viewAll = new ArrayList<Orders>();
		String query = "select cart_id,product_id,user_id,quantity,total_price from order_kfc where user_id=?";
		Connection con = ConnectionUtil.getDBConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, order1.getUserId());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Orders order = new Orders(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getDouble(5));
				viewAll.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return viewAll;
	}

	public boolean delOrderCart(Orders deleteOrder) {
		String delQuery = "delete  from order_kfc where user_id=? and product_id=? ";
		Connection con = ConnectionUtil.getDBConnection();
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(delQuery);
			pstmt.setInt(1, deleteOrder.getUserId());
			pstmt.setInt(2, deleteOrder.getProductId());
			pstmt.executeUpdate();
			return true;
		}

		catch (SQLException e) {
			e.printStackTrace();
		}
		return false;

	}

	public double sumOfPrice(Orders user) {
		double invoiceBill = 0;
//		System.out.println(date);
		String query = "select sum(total_price) as totalPrice from order_kfc where user_id=?";
		Connection con = ConnectionUtil.getDBConnection();
		try {
			CallableStatement pstmt = con.prepareCall(query);
			pstmt.setInt(1, user.getUserId());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				invoiceBill = rs.getDouble(1);
			}
			return invoiceBill;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return invoiceBill;

	}
}
