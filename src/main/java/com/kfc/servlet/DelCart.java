package com.kfc.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kfc.daoimpl.OrdersDaoImpl;
import com.kfc.daoimpl.ProductDaoImpl;
import com.kfc.model.Orders;
import com.kfc.model.Products;
import com.kfc.model.User;

/**
 * Servlet implementation class DelCart
 */
@WebServlet("/delCart")
public class DelCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DelCart() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		int userId = user.getUserId();
		String productName = request.getParameter("productName");
		ProductDaoImpl productDao = new ProductDaoImpl();
		Products product = new Products(0, productName, null, 0, null, null, null, null);
		Products meal = productDao.validateProduct(product);
		int productId = meal.getProductId();
		Orders order = new Orders(0, productId, userId, 0, null);
		OrdersDaoImpl orderDao = new OrdersDaoImpl();
		boolean flag = orderDao.delOrderCart(order);
		if (flag == true) {

			response.sendRedirect("ShowCart");

		} else {
			response.sendRedirect("mainPage.jsp");
		}
	}
}
