package com.kfc.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kfc.daoimpl.ProductDaoImpl;
import com.kfc.model.Products;

/**
 * Servlet implementation class TrendingMeals
 */
@WebServlet("/trend")
public class TrendingMeals extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrendingMeals() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		Products product=new Products();
		ProductDaoImpl productDao=new ProductDaoImpl();
		List<Products> trend=productDao.showTrending();
		if (trend!=null) {
			HttpSession session=request.getSession();
			session.setAttribute("trendMeals", trend);
			response.sendRedirect("TrendMeals.jsp");
		}
		else {
			response.sendRedirect("mainPage.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
