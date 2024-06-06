package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DeptDao;
import com.dao.StudentDao;
import com.db.DBconnect;
import com.entity.department;
import com.entity.student;
/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/stdregister")
public class AddStudent extends HttpServlet{
   private static final long serialVersionUID = 1L;

@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	
	try {
		String fullname = req.getParameter("fullname");
		String email = req.getParameter("email");
		String password=req.getParameter("password");
		
		student d = new student(fullname, email, password);
		
		StudentDao dao = new StudentDao(DBconnect.getConn());
		HttpSession session = req.getSession();
		boolean f = dao.studentRegister(d);
		
		if(f) {
			 session.setAttribute("sucMsg", "Register Succesfully");
			 resp.sendRedirect("admin/addStudent.jsp");
			}
			else
			{
				session.setAttribute("errorMsg", "Some thing wrong on the server");
				 resp.sendRedirect("admin/addStudent.jsp");
			}
		
		
	} catch (Exception e) {
		// TODO: handle exception
	}
}
	       
	   
		

		}


