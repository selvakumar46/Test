package com.kfc.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kfc.daoimpl.CartItemDaoImpl;
import com.kfc.model.CartItem;

/**
 * Servlet implementation class OrderStatusUpdate
 */
@WebServlet("/OrderStatusUpdate")
public class OrderStatusUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderStatusUpdate() {
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
		int cartId = Integer.parseInt(request.getParameter("cartId"));
		CartItem cart = new CartItem(cartId, 0, 0, null, 0, 0, null, null);
		CartItemDaoImpl cartDao = new CartItemDaoImpl();
		boolean flag = cartDao.updateStatus(cart);
		RequestDispatcher rd = request.getRequestDispatcher("OrderStatus");
		rd.forward(request, response);
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
