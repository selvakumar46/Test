package com.kfc.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kfc.daoimpl.CartItemDaoImpl;
import com.kfc.exception.CancelOrderException;
import com.kfc.model.CartItem;

/**
 * Servlet implementation class CancelOrder
 */
@WebServlet("/cancelOrder")
public class CancelOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CancelOrder() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		int cartId = (int) session.getAttribute("cartId");
		CartItemDaoImpl cartDao = new CartItemDaoImpl();
		CartItem cart = new CartItem(cartId, 0, 0, null, 0, 0, null, null);
		boolean flag = cartDao.delete1(cart);
		if (flag == true) {
			try {
				throw new CancelOrderException();
			} catch (CancelOrderException e) {
				session.setAttribute("CancelOrder", "Success");
				String validate = e.getMessage();
				response.sendRedirect(validate);

			}
		} else {
			response.sendRedirect("showOrders.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
