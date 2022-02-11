package com.kfc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kfc.daoimpl.UserDaoImpl;
import com.kfc.exception.InvalidUserException;
import com.kfc.model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String mailId = request.getParameter("mailId");
		long mobileNumber = Long.parseLong(request.getParameter("mobileNumber"));
		User user = new User(0, null, mailId, mobileNumber, null);
		UserDaoImpl userDao = new UserDaoImpl();
		User currentUser = userDao.validateUser(user);
		try {
			if (currentUser != null) {
				String role = currentUser.getRoleType();
				if (role.equals("User")) {
					request.setAttribute("currentUser", currentUser);
					session.setAttribute("currentUser", currentUser);
					request.setAttribute("userId", currentUser.getUserId());
					RequestDispatcher rd = request.getRequestDispatcher("mainPage.jsp");
					rd.forward(request, response);

				} else if (role.equals("Admin")) {
					request.setAttribute("currentUser1", currentUser);
					session.setAttribute("currentUser", currentUser);
					request.setAttribute("userId", currentUser.getUserId());
					RequestDispatcher rd = request.getRequestDispatcher("adminPage.jsp");
					rd.forward(request, response);
				}
			} else {

				throw new InvalidUserException();
			}

		} catch (InvalidUserException e) {
			request.setAttribute("invalidUser", "invalid");
			String validate=e.getMessage();
			RequestDispatcher rd=request.getRequestDispatcher(validate);
			rd.forward(request, response);
		}
	}

}
