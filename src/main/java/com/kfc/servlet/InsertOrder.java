package com.kfc.servlet;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.kfc.daoimpl.InvoiceDaoImpl;
import com.kfc.daoimpl.OrdersDaoImpl;
import com.kfc.daoimpl.ProductDaoImpl;
import com.kfc.daoimpl.CartItemDaoImpl;
import com.kfc.model.CartItem;
import com.kfc.model.Invoice;
import com.kfc.model.Orders;
import com.kfc.model.Products;
import com.kfc.model.User;

/**
 * Servlet implementation class InsertOrder
 */
@WebServlet("/insertOrder")
public class InsertOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertOrder() {
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
		User user = (User) session.getAttribute("currentUser");
		CartItemDaoImpl cartDao = new CartItemDaoImpl();
		ProductDaoImpl productDao = new ProductDaoImpl();
		String address = request.getParameter("address");
		session.setAttribute("address", address);
		int userId = user.getUserId();
		Orders orders = new Orders(0, 0, userId, 0, null);
		OrdersDaoImpl ordDao = new OrdersDaoImpl();
		boolean flag;
		List<Orders> allCart = ordDao.allCart(orders);
		for (int i = 0; i < allCart.size(); i++) {
			Orders gets = allCart.get(i);
			int productId = gets.getProductId();
			Products product = new Products(productId, null, null, 0, null, null);
			Products pro = productDao.validateProduct1(product);
			String productName = pro.getProductName();
			int cartQuantity = gets.getQuantity();
			double totalPrice = gets.getTotalPrice();
			int userId1 = gets.getUserId();
			CartItem carts = new CartItem(0, productId, userId1, productName, cartQuantity, totalPrice, null, null);
			cartDao.insertCart(carts);
			Orders deleteOrder = new Orders(0, productId, userId1, 0, null);
			flag = ordDao.delOrderCart(deleteOrder);
			if (flag == true) {
				int userId2 = user.getUserId();
				String address1 = (String) session.getAttribute("address");
				LocalDate date = LocalDate.now();
				double price = (double) session.getAttribute("totalPrice");
				Date date1 = java.sql.Date.valueOf(date);
				Invoice invoice = new Invoice(0, userId2, price, address1, date1);
				InvoiceDaoImpl invoiceDao = new InvoiceDaoImpl();
				boolean flag1 = invoiceDao.insert(invoice);

				if (flag1 == true) {
					RequestDispatcher rd = request.getRequestDispatcher("orderConfirm.jsp");
					rd.forward(request, response);
				} else {
					response.sendRedirect("cart.jsp");
				}
			} else {
				response.sendRedirect("payment.jsp");
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
