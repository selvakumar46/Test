package com.kfc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kfc.daoimpl.OrdersDaoImpl;
import com.kfc.model.Orders;

/**
 * Servlet implementation class CartUpdate
 */
@WebServlet("/upateCart")
public class CartUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartUpdate() {
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
		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("userId");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
//		System.out.println(quantity);
//		System.out.println(userId);
		int productId = (int) session.getAttribute("productId");

//		System.out.println(productId);
		double price = (double) session.getAttribute("price");
//		System.out.println(price);
		double totalPrice = price * quantity;
		OrdersDaoImpl orderDao = new OrdersDaoImpl();
		Orders order = new Orders(0, productId, userId, quantity, totalPrice);
		boolean flag = orderDao.updateOrder(order);
		if (flag == true) {
			response.sendRedirect("mainPage.jsp");
		} else {
			response.sendRedirect("cart.jsp");
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
