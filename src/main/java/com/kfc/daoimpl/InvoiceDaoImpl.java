package com.kfc.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.kfc.dao.InvoiceDao;
import com.kfc.model.Invoice;
import com.kfc.util.ConnectionUtil;

public class InvoiceDaoImpl implements InvoiceDao {

	public boolean insert(Invoice insert) {
		PreparedStatement pstmt = null;
		String insertQuery = "insert into invoice_kfc(user_id,total_price,delivery_adress) values(?,?,?)";
		Connection con = ConnectionUtil.getDBConnection();
		try {
			pstmt = con.prepareStatement(insertQuery);
			pstmt.setInt(1, insert.getUserId());
			pstmt.setDouble(2, insert.getTotalPrice());
			pstmt.setString(3, insert.getDeliveryAdress());
			pstmt.executeUpdate();
			return true;

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			ConnectionUtil.close(pstmt, con);
		}

		return false;
	}

	public Invoice showInvoice(Invoice user) {

		Invoice invoice = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String query = "select invoice_id,user_id,total_price,delivery_adress,order_date from invoice_kfc where user_id=? order by(invoice_id) desc";
		Connection con = ConnectionUtil.getDBConnection();
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, user.getUserId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				invoice = new Invoice(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getString(4), rs.getDate(5));
			}
			return invoice;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(pstmt, con, rs);
		}
		return invoice;
	}

}
