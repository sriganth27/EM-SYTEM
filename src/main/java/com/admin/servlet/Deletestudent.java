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
import com.dao.EventDao;
import com.db.DBconnect;
@WebServlet("/deleteStd")
public class Deletestudent  extends HttpServlet{

	public Deletestudent () {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id= Integer.parseInt(req.getParameter("id"));
		 StudentDao dao = new StudentDao(DBconnect.getConn());
		 HttpSession session = req.getSession();
		if(dao.deleteStd(id)) {
			 session.setAttribute("sucMsg", "Delete Succesfully");
			 resp.sendRedirect("admin/viewstudent.jsp");
			}
	    else
			{
				session.setAttribute("errorMsg", "Some thing wrong on the server");
				 resp.sendRedirect("admin/viewstudent.jsp");
			}
	}
 
	
}
