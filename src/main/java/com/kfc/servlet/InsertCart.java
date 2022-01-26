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
 * Servlet implementation class InsertCart
 */
@WebServlet("/cart")
public class InsertCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertCart() {
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
		double price = (double) session.getAttribute("price");

		int productId = (int) session.getAttribute("productId");

//		System.out.println(productId);
//		int productId=Integer.parseInt(session.getAttribute("productId"));
		int quantity = Integer.parseInt(request.getParameter("Quantity"));

		int userId = (int) session.getAttribute("userId");
		double totalPrice = quantity * price;
		Orders cart = new Orders(0, productId, userId, quantity, totalPrice);
		OrdersDaoImpl orderDao = new OrdersDaoImpl();
		boolean flag = orderDao.insertOrder(cart);
		if (flag == true) {
			response.sendRedirect("showProducts.jsp");
		} else {
			response.sendRedirect("mainPage.jsp");
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
