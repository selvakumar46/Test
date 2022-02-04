package com.kfc.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.kfc.daoimpl.UserDaoImpl;
import com.kfc.model.User;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/newAdmin")
public class NewAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NewAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String name = request.getParameter("adminName");
		long mobileNumber = Long.parseLong(request.getParameter("adminNumber"));
		String mailId = request.getParameter("adminMailId");
		User admin = new User(0, name, mailId, mobileNumber, null);
		UserDaoImpl userDao = new UserDaoImpl();
		boolean flag = userDao.insertAdmin(admin);
		if (flag == true) {
			response.sendRedirect("adminPage.jsp");
		} else {
			response.sendRedirect("newAdmin.jsp");

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
