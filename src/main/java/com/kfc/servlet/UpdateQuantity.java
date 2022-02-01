package com.kfc.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kfc.daoimpl.ProductDaoImpl;
import com.kfc.model.Products;
import com.kfc.model.User;

/**
 * Servlet implementation class UpdateQuantity
 */
@WebServlet("/UpdateQuantity")
public class UpdateQuantity extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateQuantity() {
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
		HttpSession session = request.getSession();
//		User user=(User)session.getAttribute("currentUser");
		String pName = request.getParameter("pname");
		ProductDaoImpl productDao = new ProductDaoImpl();
		Products product = new Products(0, pName, null, 0, null, null, null, null);
		Products meal = productDao.validateProduct(product);
//		int userId=user.getUserId();
		if (meal != null) {
			request.setAttribute("meals", meal);
			session.setAttribute("meals", meal);
			RequestDispatcher rd = request.getRequestDispatcher("updateCart.jsp");
			rd.forward(request, response);
		}
	}
}
