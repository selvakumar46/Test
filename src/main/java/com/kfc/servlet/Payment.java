package com.kfc.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kfc.daoimpl.PaymentDaoImpl;
import com.kfc.model.User;

/**
 * Servlet implementation class payment
 */
@WebServlet("/payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	public Payment() {
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
		User user = (User) session.getAttribute("currentUser");
		int userId = user.getUserId();
		long cardNumber = Long.parseLong(request.getParameter("cardNumber"));
		String cardType = request.getParameter("cardType");
		com.kfc.model.Payment payment = new com.kfc.model.Payment(userId, userId, cardNumber, cardType, cardType, null);
		PaymentDaoImpl payDao = new PaymentDaoImpl();
		boolean flag = payDao.card(payment);

		if (flag == true) {
			RequestDispatcher rd = request.getRequestDispatcher("confirmOrder.jsp");
			rd.forward(request, response);

		} else {
			response.sendRedirect("payment.jsp");
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
