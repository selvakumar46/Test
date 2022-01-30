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
	public LoginServlet() {
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
//		response.getWriter().append("Served at: ").append(request.getContextPath());
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
					response.sendRedirect("AdminPage.jsp");
				}
			} else {

				throw new InvalidUserException();
			}

		} catch (InvalidUserException e) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Invlid MailId or Password');");
			out.println("location='login.jsp';");
			out.println("</script>");
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
