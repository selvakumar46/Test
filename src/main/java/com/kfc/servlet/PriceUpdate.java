package com.kfc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kfc.daoimpl.ProductDaoImpl;
import com.kfc.model.Products;

/**
 * Servlet implementation class PriceUpdate
 */
public class PriceUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PriceUpdate() {
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
		String productName = request.getParameter("productName1");
		double price = Double.parseDouble(request.getParameter("productNewPrice"));
//		System.out.println(price);
		Products products = new Products(0, productName, null, price, null, null, null);
		ProductDaoImpl productDao = new ProductDaoImpl();
		boolean flag = productDao.updatePrice(products);
		if (flag == true) {
			response.sendRedirect("ShowProductsAdmin.jsp");
		} else {
			response.sendRedirect("StatusUpdate.jsp");
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
