package com.kfc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kfc.daoimpl.cartItemDaoImpl;
import com.kfc.model.CartItem;

/**
 * Servlet implementation class UpdateStatusServlet
 */
@WebServlet("/Orderstatus")
public class UpdateStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateStatusServlet() {
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
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("userId1");
		CartItem cart = new CartItem(0, 0, userId, null, 0, 0, null, null);
		cartItemDaoImpl cartDao = new cartItemDaoImpl();
		boolean flag = cartDao.updateStatus(cart);
		if (flag == true) {
			response.sendRedirect("Update.jsp");

		} else {
			response.sendRedirect("Update.jsp");
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
