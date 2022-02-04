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
		PreparedStatement pstmt = null;
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
		} finally {
			ConnectionUtil.close(pstmt, con);
		}
		return false;

	}

	public List<Orders> showOrders(Orders order) {
		List<Orders> listOfOrders = new ArrayList<Orders>();

		String query = "select ord.cart_id,pr.product_id,ord.user_id,ord.quantity,ord.total_price,pr.product_name,pr.product_price from products_kfc pr inner join order_kfc ord on ord.product_id=pr.product_id where user_id=?";
		Orders orders = null;
		Connection con = ConnectionUtil.getDBConnection();
		CallableStatement cstmt = null;
		ResultSet rs = null;
		try {
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, order.getUserId());
			rs = cstmt.executeQuery();
			while (rs.next()) {
				orders = new Orders(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getDouble(5),
						rs.getString(6), rs.getDouble(7));
				listOfOrders.add(orders);
			}
			return listOfOrders;
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			ConnectionUtil.close(cstmt, con, rs);
		}

		return listOfOrders;
	}

	public boolean delOrder(Orders deleteOrders) {
		Orders orders = new Orders();
		String delQuery = "delete  from order_kfc where user_id=? ";
		Connection con = ConnectionUtil.getDBConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(delQuery);
			pstmt.setInt(1, deleteOrders.getUserId());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(pstmt, con);
		}
		return false;

	}

	public boolean updateOrder(Orders updateOrders) {
		String update = "update order_kfc set quantity=?, total_price=?  where user_id=? and product_id=?";
		Connection con = ConnectionUtil.getDBConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(update);
			pstmt.setInt(1, updateOrders.getQuantity());
			pstmt.setDouble(2, updateOrders.getTotalPrice());
			pstmt.setInt(3, updateOrders.getUserId());
			pstmt.setInt(4, updateOrders.getProductId());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(pstmt, con);
		}

		return false;

	}

	public List<Orders> allCart(Orders order1) {

		List<Orders> viewAll = new ArrayList<Orders>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String query = "select cart_id,product_id,user_id,quantity,total_price from order_kfc where user_id=?";
		Connection con = ConnectionUtil.getDBConnection();
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, order1.getUserId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Orders order = new Orders(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getDouble(5));
				viewAll.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(pstmt, con, rs);
		}
		return viewAll;
	}

	public boolean delOrderCart(Orders deleteOrder) {
		String delQuery = "delete  from order_kfc where user_id=? and product_id=? ";
		Connection con = ConnectionUtil.getDBConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(delQuery);
			pstmt.setInt(1, deleteOrder.getUserId());
			pstmt.setInt(2, deleteOrder.getProductId());
			pstmt.executeUpdate();
			return true;
		}

		catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(pstmt, con);
		}
		return false;

	}

	public double sumOfPrice(Orders user) {
		double invoiceBill = 0;
//		System.out.println(date);
		String query = "select sum(total_price) as totalPrice from order_kfc where user_id=?";
		Connection con = ConnectionUtil.getDBConnection();
		CallableStatement cstmt = null;
		ResultSet rs = null;
		try {
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, user.getUserId());
			rs = cstmt.executeQuery();
			while (rs.next()) {
				invoiceBill = rs.getDouble(1);
			}
			return invoiceBill;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.closeStatement(cstmt, con, rs);
		}

		return invoiceBill;

	}

	public Orders check(Orders stt) {
		Orders order = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection con = ConnectionUtil.getDBConnection();
		String query = "SELECT cart_id,product_id,user_id,quantity,total_price FROM order_kfc where cart_id=? and user_id =?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, stt.getOrderId());
			pstmt.setInt(2, stt.getUserId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				order = new Orders(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getDouble(5));
			}
			return order;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(pstmt, con, rs);
		}
		return order;
	}

	public boolean increase(Orders stt) {
		Connection con = null;
		PreparedStatement pstmt = null;
		con = ConnectionUtil.getDBConnection();
		String query = "  update  order_kfc set quantity=?,total_price=? where cart_id=? and user_id=?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, stt.getQuantity());
			pstmt.setDouble(2, stt.getTotalPrice());
			pstmt.setInt(3, stt.getOrderId());
			pstmt.setInt(4, stt.getUserId());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			ConnectionUtil.close(pstmt, con);
		}
		return false;
	}

}
