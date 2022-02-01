package com.kfc.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kfc.daoimpl.OrdersDaoImpl;
import com.kfc.model.Orders;
import com.kfc.model.User;

/**
 * Servlet implementation class ConfirmOrder
 */
@WebServlet("/ConfirmOrder")
public class ConfirmOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ConfirmOrder() {
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
		Orders order1 = new Orders(0, 0, 0, 0, null);
		OrdersDaoImpl ordDao = new OrdersDaoImpl();
		List<Orders> allCart = ordDao.allCart(order1);
		request.setAttribute("allCart", allCart);
		RequestDispatcher rd = request.getRequestDispatcher("confirmOrder.jsp");
		rd.forward(request, response);
	}

}
