package com.kfc.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class DecreaseQuantity
 */
@WebServlet("/DecreaseQuantity")
public class DecreaseQuantity extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DecreaseQuantity() {
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

		Orders orders = new Orders();
		OrdersDaoImpl orderDao = new OrdersDaoImpl();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		int userId = user.getUserId();
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		orders = new Orders(orderId, 0, userId, 0, null);
		Orders order = orderDao.check(orders);
		int productId = order.getProductId();
		Products product = new Products(productId, null, null, 0, null, null, null, null);
		ProductDaoImpl productsDao = new ProductDaoImpl();
		Products products = productsDao.validateProduct1(product);
		double price = products.getPrice();
		int quantity = order.getQuantity();

		if (quantity > 1) { // check quantity
			int newQuantity = quantity - 1;
			double newPrice = newQuantity * price;
			orders = new Orders(orderId, 0, userId, newQuantity, newPrice);
			orderDao.increase(orders);
			RequestDispatcher rd = request.getRequestDispatcher("ShowCart");
			rd.forward(request, response);

		} else {

			response.sendRedirect("ShowCart");
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
