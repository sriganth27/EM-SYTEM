package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.entity.department;


@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String email = req.getParameter("email");
			String password=req.getParameter("password");
			
			HttpSession session = req.getSession();
			
			if("admin@gmail.com".equals(email) && "123".equals(password)) {
				session.setAttribute("adminObj",new department());
				//session.setAttribute("sucMsg", new User());

				resp.sendRedirect("admin/view_event.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Invalid Email & Password");
				resp.sendRedirect("admin_login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
