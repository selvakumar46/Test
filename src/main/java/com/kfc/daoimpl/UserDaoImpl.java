package com.kfc.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kfc.dao.UserDao;
import com.kfc.model.User;
import com.kfc.util.ConnectionUtil;

public class UserDaoImpl implements UserDao {
	public boolean insertUser(User user) {
		User user1 = new User();
		String insertQuery = "insert into user_kfc(user_name,mobile_number,mail_id)values(?,?,?)";
		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
		PreparedStatement pst = null;
		try {
			pst = con.prepareStatement(insertQuery);
//			System.out.println(user.getUserName());
			pst.setString(1, user.getUserName());
			pst.setLong(2, user.getMobileNumber());
			pst.setString(3, user.getMailId());
			pst.executeUpdate();
//			System.out.println(" Registered successfully");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
//			System.out.println("Value not added");

		}
		return false;
	}

	public User validateUser(User user) {
		// TODO Auto-generated method stub
		// String validateQuery="select * from user_kfc where mail_id=
		// "+login.getMailId()+"' and mobile_number="+login.getMobileNumber();
		Connection con = null;
		User logUser = null;
		PreparedStatement pstmt = null;
		con = ConnectionUtil.getDBConnection();
		String query = "select user_id,user_name,mail_id,mobile_number,role_type from user_kfc where mail_id= ? and mobile_number=?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, user.getMailId());
			pstmt.setLong(2, user.getMobileNumber());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				logUser = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getLong(4), rs.getString(5));
			}
			return logUser;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return logUser;
	}

	public User updateUser(User user1) {
		User user2 = new User();
		String updateQuery = "update user_kfc set mail_id=? where mobile_number=? ";
//		System.out.println(user1.getMailId());
//		System.out.println(user1.getMobileNumber());
		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(updateQuery);
			pstmt.setString(1, user1.getMailId());
			pstmt.setLong(2, user1.getMobileNumber());
			int i = pstmt.executeUpdate();
//			System.out.println(i + " Row updated");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user2;

	}

	public User delUser(User deleteUser) {

		String delQuery = " delete  from user_kfc where user_id=?";
		User user = new User();
		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(delQuery);
			pstmt.setInt(1, deleteUser.getUserId());
			int i = pstmt.executeUpdate();
//			System.out.println(i + "user delete Successfully");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;

	}

	public boolean insertAdmin(User admin) {
		String insert = "insert into user_kfc (user_name,mail_id,mobile_number,role_type) values (?,?,?,'Admin')";
		User user = new User();
		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(insert);
			pstmt.setString(1, admin.getUserName());
			pstmt.setString(2, admin.getMailId());
			pstmt.setLong(3, admin.getMobileNumber());
			int i = pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public User validateUserNum(User user) {
		Connection con = null;
		User logUser = null;
		PreparedStatement pstmt = null;
		con = ConnectionUtil.getDBConnection();
		String query = "select user_id,user_name,mail_id,mobile_number,role_type from user_kfc where  mobile_number=?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setLong(1, user.getMobileNumber());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				logUser = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getLong(4), rs.getString(5));
//				System.out.println(user);

			}
			return logUser;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return logUser;
	}

	public User validateUserMail(User user) {
		Connection con = null;
		User logUser = null;
		PreparedStatement pstmt = null;
		con = ConnectionUtil.getDBConnection();
		String query = "select user_id,user_name,mail_id,mobile_number,role_type from user_kfc where mail_id=?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, user.getMailId());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				logUser = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getLong(4), rs.getString(5));
//				System.out.println(logUser);

			}
			return logUser;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return logUser;
	}

	@Override
	public User validateUser(String logMail, Long logNumber) {
		// TODO Auto-generated method stub
		return null;
	}

}
