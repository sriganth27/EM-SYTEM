package com.dept.servlet;

import java.io.IOException;

import java.io.OutputStream;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
@WebServlet("/addImage")
public class image2 extends HttpServlet {
  
	public image2() {
		super();
		// TODO Auto-generated constructor stub
	}
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  response.setContentType("image/jpeg");
		  int id = Integer.parseInt(request.getParameter("id"));
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
	}
		 
			
		  try {
			  Connection conn;
			  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems?characterEncoding=utf8","root","srivkp@2003");
			  String sql = "select * from event_details where id ='"+id+"'";
			  PreparedStatement ps;
		      ps = conn.prepareStatement(sql);
		     
		   
		      ResultSet rs = ps.executeQuery();
		   
		      while(rs.next()){
			   byte [] imageData = rs.getBytes("image1");
			     OutputStream os3 = response.getOutputStream(); // output with the help of outputStream 
			 		       
			 		             os3.write(imageData);
			 		             os3.flush();
			 		             os3.close();
			   
		    
		   }
		  } catch (SQLException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		   response.getOutputStream().flush();
		   response.getOutputStream().close();
		  }
		  
		 }

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
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
		 
	        event e = new event(DeptId, deptname, eventcategory, eventdate, eventtopic, rpname, rpdetails, imageData, imageData2, imageData3, description);
	        EventDao dao = new EventDao(DBconnect.getConn());
	        HttpSession session = req.getSession();
	        boolean f = dao.eddEvent(e);
			
			if(f) {
				 session.setAttribute("succMsg", "Register Succesfully");
				 resp.sendRedirect("department/addEvent.jsp");
				}
				else
				{
					session.setAttribute("errorMsg", "Something wrong on the server");
					 resp.sendRedirect("department/addEvent.jsp");
				}
			

			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
