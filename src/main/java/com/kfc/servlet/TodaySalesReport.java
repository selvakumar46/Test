package com.kfc.servlet;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kfc.daoimpl.CartItemDaoImpl;
import com.kfc.model.CartItem;

/**
 * Servlet implementation class TodaySalesReport
 */
@WebServlet("/TodaySalesReport")
public class TodaySalesReport extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TodaySalesReport() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CartItem cart = new CartItem();
		CartItemDaoImpl cartDao = new CartItemDaoImpl();
		double price;
		price = cartDao.oneDaySales(cart);
		List<CartItem> list = cartDao.oneDaySales1(cart);
		request.setAttribute("oneDaySales", price);
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("oneDaySales.jsp");
		rd.forward(request, response);

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
