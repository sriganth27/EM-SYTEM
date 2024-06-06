package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DeptDao;
import com.db.DBconnect;
import com.entity.department;
/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/deptregister")
public class DeptRegister extends HttpServlet{
   private static final long serialVersionUID = 1L;

@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	
	try {
		String fullname = req.getParameter("fullname");
		String email = req.getParameter("email");
		String password=req.getParameter("password");
		
		department d = new department(fullname, email, password);
		
		DeptDao dao = new DeptDao(DBconnect.getConn());
		HttpSession session = req.getSession();
		boolean f = dao.DeptRegister(d);
		
		if(f) {
			 session.setAttribute("sucMsg", "Register Succesfully");
			 resp.sendRedirect("admin/addDept.jsp");
			}
			else
			{
				session.setAttribute("errorMsg", "Some thing wrong on the server");
				 resp.sendRedirect("admin/addDept.jsp");
			}
		
		
	} catch (Exception e) {
		// TODO: handle exception
	}
}
	       
	   
		

		}


