package com.kfc.daoimpl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.kfc.dao.InvoiceDao;
import com.kfc.model.Invoice;
import com.kfc.util.ConnectionUtil;

public class InvoiceDaoImpl implements InvoiceDao {

	public boolean insert(Invoice insert) {
		String insertQuery = "insert into invoice_kfc(user_id,total_price,delivery_adress) values(?,?,?)";
		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(insertQuery);

			pstmt.setInt(1, insert.getUserId());
			pstmt.setDouble(2, insert.getTotalPrice());
			pstmt.setString(3, insert.getDeliveryAdress());
			int i = pstmt.executeUpdate();
			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	public Invoice showInvoice(Invoice user) {

		Invoice invoice = null;
		String query = "select invoice_id,user_id,total_price,delivery_adress,order_date from invoice_kfc where user_id=? order by(invoice_id) desc";
		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, user.getUserId());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				invoice = new Invoice(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getString(4), rs.getDate(5));
			}
			return invoice;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return invoice;
	}

}
