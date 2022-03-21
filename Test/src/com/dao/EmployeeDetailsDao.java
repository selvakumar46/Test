package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.EmployeeDetails;
import com.util.ConnectionUtil;

public class EmployeeDetailsDao {

	public static boolean insert(EmployeeDetails empDetail) {
		boolean flag = false ;
//		System.out.println("empId: " + empDetail.empId());
//		System.out.println("employee name:" + empDetail.empName());
//		System.out.println("employee number" + empDetail.empNo());
//		System.out.println("Employee mailId" + empDetail.emailId());
		Connection connection = ConnectionUtil.getDBConnection();
		String query = "insert into test_db (Emp_id,Emp_name,Emp_num,Email_id) values (?,?,?,?)";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, empDetail.empId());
			pstmt.setString(2, empDetail.empName());
			pstmt.setLong(3, empDetail.empNo());
			pstmt.setString(4, empDetail.emailId());
			pstmt.executeUpdate();
			flag=true;
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return flag;
	}

	public static ArrayList<EmployeeDetails> view() {
		ArrayList<EmployeeDetails> listOfEmployee = new ArrayList<>();
		EmployeeDetails empDetails = null;
		Connection connection = ConnectionUtil.getDBConnection();
		String viewQuery = "select emp_id,emp_name,emp_num,email_id from test_db";
		try {
			PreparedStatement pstmt = connection.prepareStatement(viewQuery);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				empDetails = new EmployeeDetails(rs.getInt("emp_id"), rs.getString("emp_name"), rs.getLong("emp_num"),
						rs.getString("email_id"));
				listOfEmployee.add(empDetails);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return listOfEmployee;
	}

	public static boolean update(EmployeeDetails employee) {
		EmployeeDetails empDetails = null;
		System.out.println("employeeId" + employee.empId());
		System.out.println("new mailId" + employee.emailId());
		Connection connection = ConnectionUtil.getDBConnection();
		String update = "update test_db set email_id=? where emp_id=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(update);
			pstmt.setString(1, employee.emailId());
			pstmt.setInt(2, employee.empId());
			int i = pstmt.executeUpdate();
			System.out.println(i);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return true;
	}

	public static boolean delete(EmployeeDetails employee) {
		System.out.println("Employee Id :" + employee.empId());
		Connection connection = ConnectionUtil.getDBConnection();
		String delete = "delete test_db where  emp_id=?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(delete);
			pstmt.setInt(1, employee.empId());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return true;

	}
}
