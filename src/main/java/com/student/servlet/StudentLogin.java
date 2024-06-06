package com.student.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.dao.StudentDao;
import com.db.DBconnect;


import com.entity.student;

@WebServlet("/studentLogin")
public class StudentLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
        try {
			
			String email = req.getParameter("email");
			String password=req.getParameter("password");
			
			HttpSession session = req.getSession(); 
		     StudentDao dao = new StudentDao(DBconnect.getConn());
		     student dept=dao.login(email, password);
				if(dept!=null) {
					
					session.setAttribute("studObj", dept);

					
					resp.sendRedirect("student/index.jsp");
				}
				else {
					session.setAttribute("errorMsg", "Invalid Email & Password");
					resp.sendRedirect("student_login.jsp");
				}
		

}
			catch (Exception e) {
				e.printStackTrace();
			
        }
	}
}
        
