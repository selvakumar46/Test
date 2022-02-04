package com.kfc.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kfc.daoimpl.OrdersDaoImpl;
import com.kfc.model.Orders;
import com.kfc.model.Products;
import com.kfc.model.User;

/**
 * Servlet implementation class InsertCart
 */
@WebServlet("/insertCart")
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
//		response.getWriter().append("hello selva: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		Products products = (Products) session.getAttribute("validateProduct1");
		User currentUser = (User) session.getAttribute("currentUser");
		double price = products.getPrice();
		int productId = products.getProductId();
		int quantity = Integer.parseInt(request.getParameter("Quantity"));
		int userId = currentUser.getUserId();
		double totalPrice = quantity * price;
		Orders cart = new Orders(0, productId, userId, quantity, totalPrice);
		OrdersDaoImpl orderDao = new OrdersDaoImpl();
		boolean flag = orderDao.insertOrder(cart);
		if (flag == true) {
			response.sendRedirect("showProducts");
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
