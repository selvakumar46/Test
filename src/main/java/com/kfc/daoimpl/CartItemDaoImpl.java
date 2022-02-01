package com.kfc.daoimpl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.kfc.dao.cartItemDao;
import com.kfc.model.CartItem;
import com.kfc.model.User;
import com.kfc.util.ConnectionUtil;

public class CartItemDaoImpl implements cartItemDao {

	public boolean insertCart(CartItem carts) {
		String insert = "insert into cart_items (product_id,user_id,product_name,quantity,total_price)values (?,?,?,?,?)";
		Connection con = ConnectionUtil.getDBConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(insert);
			pstmt.setInt(1, carts.getProductId());
			pstmt.setInt(2, carts.getUserId());
			pstmt.setString(3, carts.getProductName());
			pstmt.setInt(4, carts.getQuantity());
			pstmt.setDouble(5, carts.getTotalPrice());
			pstmt.executeUpdate();

			return true;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	public List<CartItem> showUsers(User user) {
		List<CartItem> cartItem = new ArrayList<>();
		String show = "select cart_id,product_id,user_id,product_name,quantity,total_price,status,order_date from cart_items where status='Ordered'and user_id=?";
		Connection con = ConnectionUtil.getDBConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(show);
			pstmt.setInt(1, user.getUserId());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				CartItem cartItems = new CartItem(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4),
						rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getDate(8));
				cartItem.add(cartItems);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cartItem;

	}

	public boolean delete1(CartItem cart) {
		String delete = "delete from cart_items where cart_id=?";
		Connection con = ConnectionUtil.getDBConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(delete);
			pstmt.setInt(1, cart.getCartId());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	public boolean updateStatus(CartItem cart) {
		String update = "update  cart_items  set status='Delevered' where cart_id=? ";
		Connection con = ConnectionUtil.getDBConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(update);

			pstmt.setInt(1, cart.getCartId());

			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;

	}

	public List<CartItem> showInvoice(CartItem carts) {
		List<CartItem> invoice = new ArrayList<CartItem>();
		CartItem cart = null;
		String show = "select cart_id,product_id,user_id,product_name,quantity,total_price,status,order_date from cart_items where user_id=? and status='Ordered' order by(order_date) desc";
		Connection con = ConnectionUtil.getDBConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(show);
			pstmt.setInt(1, carts.getUserId());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				cart = new CartItem(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getDouble(6), rs.getString(7), rs.getDate(8));
				invoice.add(cart);

			}
			return invoice;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return invoice;
	}

	public double sumOfPrice1(LocalDate date, int userId2) {
		double invoiceBill = 0;
		String query = "select sum(total_price ) as totalPrice from cart_items where to_char(order_date,'yyyy-MM-dd')='"
				+ date + "' and user_id= " + userId2 + "";
		Connection con = ConnectionUtil.getDBConnection();
		try {
			CallableStatement pstmt = con.prepareCall(query);
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

	public List<CartItem> orderStatus() {
		List<CartItem> allCart = new ArrayList<CartItem>();
		CartItem cart = null;
		String query = "select cart_id,product_id,user_id,product_name,quantity,total_price,status,order_date from cart_items where status='Ordered' order by cart_id";
		Connection con = ConnectionUtil.getDBConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				cart = new CartItem(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getDouble(6), rs.getString(7), rs.getDate(8));
				allCart.add(cart);

			}
			return allCart;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return allCart;
	}

	public List<CartItem> showInvoiceDelevered(CartItem carts) {
		List<CartItem> invoice = new ArrayList<CartItem>();
		CartItem cart = null;
		String show = "select cart_id,product_id,user_id,product_name,quantity,total_price,status,order_date from cart_items where user_id=? and status='Delevered' order by(order_date) desc";

		Connection con = ConnectionUtil.getDBConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(show);
			pstmt.setInt(1, carts.getUserId());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				cart = new CartItem(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getDouble(6), rs.getString(7), rs.getDate(8));
				invoice.add(cart);
			}
			return invoice;
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return invoice;
	}
	@Override
	public List<CartItem> showUsers() {
		return null;
	}

	public double sumOfPrice(LocalDate date, int userId2) {

		return 0;
	}

	@Override
	public double sumOfPrice(LocalDate date) {
		return 0;
	}

	@Override
	public boolean delete() {
		return false;
	}

}
