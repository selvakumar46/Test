package com.kfc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kfc.daoimpl.ProductDaoImpl;
import com.kfc.model.Products;

/**
 * Servlet implementation class InsertProducts
 */
@WebServlet("/insertMeal")
public class InsertProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertProducts() {
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
		String mealName = request.getParameter("mealName");
		String mealDescription = request.getParameter("mealDescription");
		double mealPrice = Double.parseDouble(request.getParameter("mealPrice"));
		String mealType = request.getParameter("mealType");
		String mealStatus = request.getParameter("mealStatus");
		String mealCatogory = request.getParameter("mealCatogory");
		Products product = new Products(0, mealName, mealDescription, mealPrice, mealType, mealStatus, mealCatogory);
		ProductDaoImpl prorductDao = new ProductDaoImpl();
		boolean flag = prorductDao.insertProducts(product);
		if (flag == true) {
			response.sendRedirect("AdminPage.jsp");
		} else {
			response.sendRedirect("InsertProduct.jsp");
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
