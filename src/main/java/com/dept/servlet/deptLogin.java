package com.dept.servlet;

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

@WebServlet("/deptLogin")
public class deptLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
        try {
			
			String email = req.getParameter("email");
			String password=req.getParameter("password");
			
			HttpSession session = req.getSession(); 
		     DeptDao dao = new DeptDao(DBconnect.getConn());
		     department dept=dao.login(email, password);
				if(dept!=null) {
					session.setAttribute("deptObj",  dept);
					
					resp.sendRedirect("department/addEvent.jsp");
				}
				else {
					session.setAttribute("errorrMsg", "Invalid Email & Passsword");
					resp.sendRedirect("department_login.jsp");
				}
		

}
			catch (Exception e) {
				e.printStackTrace();
			
        }
	}
}
        
