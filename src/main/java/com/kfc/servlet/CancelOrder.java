package com.kfc.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
@WebServlet("/CancelOrder")
public class CancelOrder extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		int cartId = Integer.parseInt(request.getParameter("cartId"));
		CartItemDaoImpl cartDao = new CartItemDaoImpl();
		CartItem cart = new CartItem(cartId, 0, 0, null, 0, 0, null, null);
		boolean flag = cartDao.delete1(cart);
		if (flag == true) {
			try {
				throw new CancelOrderException();
			} catch (CancelOrderException e) {
				request.setAttribute("CancelOrder", "Success");
				String validate = e.getMessage();
				RequestDispatcher rd = request.getRequestDispatcher(validate);
				rd.forward(request, response);

			}
		} else {
			response.sendRedirect("MyOrders");
		}
	}

}
