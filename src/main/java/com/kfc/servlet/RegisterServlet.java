package com.kfc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kfc.daoimpl.UserDaoImpl;
import com.kfc.exception.InvalidUserException;
import com.kfc.exception.UsedMailIdException;
import com.kfc.exception.UsedMobileNumberException;
import com.kfc.model.User;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/s1")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public RegisterServlet() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// dao object
		UserDaoImpl userDao = new UserDaoImpl();
		HttpSession session=request.getSession();
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter pw = response.getWriter();
		String name = request.getParameter("name");
		long mobileNumber = Long.parseLong(request.getParameter("mobileNumber"));
		User user1=new User(0, null, null, mobileNumber, null);
		User usedNum=userDao.validateUserNum(user1);
		
		if(usedNum==null) {
			String mailId = request.getParameter("mailId");
			User user2=new User(0, null, mailId, 0, null);
			User usedMail=userDao.validateUserMail(user2);
//			System.out.println(usedMail);
			if (usedMail==null) {
			User user = new User(0, name, mailId, mobileNumber,null);
			
			boolean flag = userDao.insertUser(user);
//			System.out.println(flag);
			if (flag == true) {
				response.sendRedirect("login.jsp");

			} else {
				pw.write("inavalid Entry");
				response.sendRedirect("Register.jsp");
			}

			}else {
				try {
					throw new UsedMailIdException();
				}catch(UsedMailIdException e) {
					session.setAttribute("UsedMailId", "invalid");
					String validate=e.getMessage();
					response.sendRedirect(validate);
					
				}
			}
		}else {
			try {
				throw new UsedMobileNumberException();
			}catch(UsedMobileNumberException e) {
				session.setAttribute("UsedNumber", "invalid");
				String validate=e.getMessage();
				response.sendRedirect(validate);
				
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
