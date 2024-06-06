package com.student.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/studentLogout")
public class StudentLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		 {
				HttpSession session= req.getSession();
				session.removeAttribute("studObj");
				session.setAttribute("sucMsg", "Student Logout Succesfully");
				res.sendRedirect("student_login.jsp");
		 }

}
}