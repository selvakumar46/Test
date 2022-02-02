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
import com.kfc.model.User;

/**
 * Servlet implementation class IncreaseQuantity
 */
@WebServlet("/IncreaseQuantity")
public class IncreaseQuantity extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IncreaseQuantity() {
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
		{

			OrdersDaoImpl orderDao = new OrdersDaoImpl();
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("currentUser");
			int userId = user.getUserId();
			int productId = Integer.parseInt(request.getParameter("pId"));
			Orders orders = new Orders(productId, 0, userId, 0, null);
			Orders order = orderDao.check(orders);
			System.out.println(order);
			int quantity = order.getQuantity();

			if (quantity > 0 && !(quantity > 9)) {// check quantity
				orders.setQuantity(quantity + 1);
				orderDao.increase(order);
				response.sendRedirect("ShowCart");

			} else {

				response.sendRedirect("ShowCart");
			}
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
