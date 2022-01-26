package com.kfc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kfc.daoimpl.cartItemDaoImpl;
import com.kfc.model.CartItem;

/**
 * Servlet implementation class OrderStatusServlet
 */
@WebServlet("/OrderStatus")
public class OrderStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderStatusServlet() {
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
		PrintWriter pw = response.getWriter();
		CartItem cart = new CartItem();
		cartItemDaoImpl cartDao = new cartItemDaoImpl();
		List<CartItem> status = cartDao.orderStatus();
//		System.out.println(status);
		HttpSession session = request.getSession();
		session.setAttribute("status", status);
		if (status != null) {
			response.sendRedirect("OrderStatus.jsp");
		} else {
			response.sendRedirect("Update.jsp");
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
