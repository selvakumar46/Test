package com.kfc.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kfc.dao.UserDao;
import com.kfc.model.User;
import com.kfc.util.ConnectionUtil;

public class UserDaoImpl implements UserDao {
	public boolean insertUser(User user) {
		String insertQuery = "insert into user_kfc(user_name,mobile_number,mail_id)values(?,?,?)";
		Connection con = ConnectionUtil.getDBConnection();
		PreparedStatement pst = null;
		try {
			pst = con.prepareStatement(insertQuery);
			pst.setString(1, user.getUserName());
			pst.setLong(2, user.getMobileNumber());
			pst.setString(3, user.getMailId());
			pst.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public User validateUser(User user) {
		User logUser = null;
		ResultSet rs = null;
		var query = "select user_id,user_name,mail_id,mobile_number,role_type from user_kfc where mail_id= ? and mobile_number=?";
		Connection con = ConnectionUtil.getDBConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, user.getMailId());
			pstmt.setLong(2, user.getMobileNumber());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				logUser = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getLong(4), rs.getString(5));
			}
			return logUser;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(pstmt, con, rs);
		}

		return logUser;
	}

	public User updateUser(User user1) {
		User user2 = new User();
		String updateQuery = "update user_kfc set mail_id=? where mobile_number=? ";
		Connection con = ConnectionUtil.getDBConnection();
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(updateQuery);
			pstmt.setString(1, user1.getMailId());
			pstmt.setLong(2, user1.getMobileNumber());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user2;
	}

	public User delUser(User deleteUser) {

		String delQuery = " delete  from user_kfc where user_id=?";
		User user = new User();
		Connection con = ConnectionUtil.getDBConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(delQuery);
			pstmt.setInt(1, deleteUser.getUserId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(pstmt, con);
		}
		return user;
	}

	public boolean insertAdmin(User admin) {
		PreparedStatement pstmt = null;
		String insert = "insert into user_kfc (user_name,mail_id,mobile_number,role_type) values (?,?,?,'Admin')";
		Connection con = ConnectionUtil.getDBConnection();
		try {
			pstmt = con.prepareStatement(insert);
			pstmt.setString(1, admin.getUserName());
			pstmt.setString(2, admin.getMailId());
			pstmt.setLong(3, admin.getMobileNumber());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(pstmt, con);
		}
		return false;
	}

	public User validateUserNum(User user) {
		Connection con = null;
		User logUser = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		con = ConnectionUtil.getDBConnection();
		String query = "select user_id,user_name,mail_id,mobile_number,role_type from user_kfc where  mobile_number=?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setLong(1, user.getMobileNumber());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				logUser = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getLong(4), rs.getString(5));
//				System.out.println(user);

			}
			return logUser;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(pstmt, con, rs);
		}

		return logUser;
	}

	public User validateUserMail(User user) {
		User logUser = null;
		ResultSet rs = null;
		String query = "select user_id,user_name,mail_id,mobile_number,role_type from user_kfc where mail_id=?";
		Connection con = ConnectionUtil.getDBConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, user.getMailId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				logUser = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getLong(4), rs.getString(5));
			}
			return logUser;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(pstmt, con, rs);
		}

		return logUser;
	}

	public List<User> showUser() {
		List<User> allUser = new ArrayList<>();
		User user = null;
		ResultSet rs = null;
		String query = "select user_id,user_name,mail_id,mobile_number,role_type from user_kfc order by user_id";
		Connection con = ConnectionUtil.getDBConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getLong(4), rs.getString(5));
				allUser.add(user);
			}
			return allUser;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return allUser;
	}

	@Override
	public User validateUser(String logMail, Long logNumber) {
		return null;
	}

}
