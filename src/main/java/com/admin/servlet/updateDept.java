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

@WebServlet("/updateDept")
public class updateDept extends HttpServlet {
	

	public updateDept() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {
			
			int id= Integer.parseInt(req.getParameter("id"));
			String fullname = req.getParameter("fullname");
			String email = req.getParameter("email");
			String password=req.getParameter("password");
			
			department d = new  department(id, fullname, email, password);
			DeptDao dao = new DeptDao(DBconnect.getConn());
			HttpSession session = req.getSession();
			boolean f = dao.UpdateDept(d);
			
			if(f) {
				 session.setAttribute("sucMsg", "Update Succesfully");
				 resp.sendRedirect("admin/view_department.jsp");
				}
				else
				{
					session.setAttribute("errorMsg", "Some thing wrong on the server");
					 resp.sendRedirect("admin/view_department.jsp");
				}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
		     
}
