package com.dept.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.EventDao;
import com.db.DBconnect;
import com.entity.event;
@MultipartConfig
@WebServlet("/update_event")
public class updateEvent extends HttpServlet {
  
	public updateEvent() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id= Integer.parseInt(req.getParameter("id"));
			
			int DeptId = Integer.parseInt(req.getParameter("deptid"));
			String deptname = req.getParameter("deptname");
			String eventcategory = req.getParameter("eventcategory");
		    String eventdate = req.getParameter("edate");
			String eventtopic = req.getParameter("etopic");
			String rpname = req.getParameter("rpname");
			String rpdetails = req.getParameter("rpdetails");
			Part  imagePart = req.getPart("broucher");
		    Part  imagePart2 = req.getPart("photo1");
		    Part  imagePart3 = req.getPart("photo2");
		    String description = req.getParameter("description");
		    byte[] imageData = imagePart.getInputStream().readAllBytes();
		    byte[] imageData2 = imagePart2.getInputStream().readAllBytes();

		    byte[] imageData3 = imagePart3.getInputStream().readAllBytes();


		    System.out.println("succes");
		  
		    // Get the uploaded file
		 
	        event e = new event(id,DeptId, deptname, eventcategory, eventdate, eventtopic, rpname, rpdetails, imageData, imageData2, imageData3, description);
	        EventDao dao = new EventDao(DBconnect.getConn());
	        HttpSession session = req.getSession();
	        boolean f = dao.updateEvent(e);
			
			if(f) {
				 session.setAttribute("sucMsg", "Event Update Succesfully");
				 resp.sendRedirect("department/view_event.jsp");
				}
				else
				{
					session.setAttribute("errorMsg", "Something wrong on the server");
					 resp.sendRedirect("department/view_event.jsp");
				}
			

			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
