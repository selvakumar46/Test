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
import com.kfc.model.Invoice;
import com.kfc.model.User;
import com.kfc.util.ConnectionUtil;

public class cartItemDaoImpl implements cartItemDao {

	public boolean insertCart(CartItem carts) {
		String insert = "insert into cart_items (product_id,user_id,product_name,quantity,total_price)values (?,?,?,?,?)";
		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(insert);
			pstmt.setInt(1, carts.getProductId());
			pstmt.setInt(2, carts.getUserId());
			pstmt.setString(3, carts.getProductName());
			pstmt.setInt(4, carts.getQuantity());
			pstmt.setDouble(5, carts.getTotalPrice());
			int i = pstmt.executeUpdate();
//			System.out.println(i + "inserted");

			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public List<CartItem> showUsers(User user) {
		List<CartItem> cartItem = new ArrayList<CartItem>();
		String show = "select cart_id,product_id,user_id,product_name,quantity,total_price,status,order_date from cart_items where status='Ordered'and user_id=?";
		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cartItem;

	}

	public boolean delete1(CartItem cart) {
		String delete = "delete from cart_items where cart_id=?";

		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(delete);
			pstmt.setInt(1, cart.getCartId());
			int i = pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	public boolean updateStatus(CartItem cart) {
		CartItem carts = null;
		String update = "update  cart_items  set status='Delevered' where user_id=? ";
		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(update);

			pstmt.setInt(1, cart.getUserId());

			int i = pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;

	}

	public List<CartItem> showInvoice(CartItem carts) {
		List<CartItem> invoice = new ArrayList<CartItem>();
		CartItem cart = null;
		String show = "select cart_id,product_id,user_id,product_name,quantity,total_price,status,order_date from cart_items where user_id=? and status='Ordered' order by(order_date) desc";
		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(show);
//			System.out.println(carts.getUserId());
			pstmt.setInt(1, carts.getUserId());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
//				System.out.println(rs.getString(4));
				cart = new CartItem(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getDouble(6), rs.getString(7), rs.getDate(8));
				invoice.add(cart);

			}
			return invoice;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return invoice;
	}

	public double sumOfPrice1(LocalDate date, int userId2) {
		double invoiceBill = 0;
//		System.out.println(date);
		String query = "select sum(total_price ) as totalPrice from cart_items where to_char(order_date,'yyyy-MM-dd')='"
				+ date + "' and user_id= " + userId2 + "";
		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
		try {
			CallableStatement pstmt = con.prepareCall(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				invoiceBill = rs.getDouble(1);
//				System.out.println(invoiceBill);
			}
			return invoiceBill;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return invoiceBill;

	}

	public List<CartItem> orderStatus() {
		List<CartItem> allCart = new ArrayList<CartItem>();
		CartItem cart = null;
		String query = "select cart_id,product_id,user_id,product_name,quantity,total_price,status,order_date from cart_items where status='Ordered'";
		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return allCart;
	}

	public List<CartItem> showInvoiceDelevered(CartItem carts) {
		List<CartItem> invoice = new ArrayList<CartItem>();
		CartItem cart = null;
		String show = "select cart_id,product_id,user_id,product_name,quantity,total_price,status,order_date from cart_items where user_id=? and status='Delevered' order by(order_date) desc";
		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(show);
//			System.out.println(carts.getUserId());
			pstmt.setInt(1, carts.getUserId());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
//				System.out.println(rs.getString(4));
				cart = new CartItem(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getDouble(6), rs.getString(7), rs.getDate(8));
				invoice.add(cart);

			}
			return invoice;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return invoice;
	}

	public boolean showBill() {
		CartItem cart = null;
		String bill = "select";
		return false;
	}

	@Override
	public List<CartItem> showUsers() {
		// TODO Auto-generated method stub
		return null;
	}

	public double sumOfPrice(LocalDate date, int userId2) {
		// TODO Auto-generated method stub

		return 0;
	}

	@Override
	public double sumOfPrice(LocalDate date) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean delete() {
		// TODO Auto-generated method stub
		return false;
	}

}
