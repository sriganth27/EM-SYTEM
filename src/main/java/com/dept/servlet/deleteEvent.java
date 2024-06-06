package com.dept.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dao.EventDao;
import com.db.DBconnect;

@WebServlet("/deleteEvent")
public class deleteEvent extends HttpServlet {

	public deleteEvent() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		 EventDao dao = new EventDao(DBconnect.getConn());
		 HttpSession session = req.getSession();
		if(dao.deleteEvent(id)) {
			session.setAttribute("sucMsg", "Event Delete Succesfully");
			resp.sendRedirect("department/view_event.jsp");
		}
		else {
			session.setAttribute("errorMsg", "Something went wrong");
			resp.sendRedirect("department/view_event.jsp");
		}
		
	}

	
}
