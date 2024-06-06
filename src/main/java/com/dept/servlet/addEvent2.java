package com.dept.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@MultipartConfig
@WebServlet("/addevent2")
public class addEvent2 extends HttpServlet{
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
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
		    
		    // Get the uploaded file
		       
	        InputStream imageInputStream = imagePart.getInputStream();
	        InputStream imageInputStream2 = imagePart2.getInputStream();
	        InputStream imageInputStream3 = imagePart3.getInputStream();
	        String imageFileName=imagePart.getSubmittedFileName(); 
	        String imageFileName2=imagePart2.getSubmittedFileName(); 
	        String imageFileName3=imagePart3.getSubmittedFileName(); 
	     
	        // Save the image to a temporary location
	        String imagePath = "D:/jee-2021-12-2/EMSFinal/src/main/webapp/img" + imageFileName ;
	        String imagePath2 = "D:/jee-2021-12-2/EMSFinal/src/main/webapp/img" + imageFileName2 ;
	        String imagePath3 = "D:/jee-2021-12-2/EMSFinal/src/main/webapp/img" + imageFileName3;
	        System.out.println("succesfully uploadde"+imagePath);
	        Files.copy(imageInputStream, Paths.get(imagePath));
	        Files.copy(imageInputStream2, Paths.get(imagePath2));
	        Files.copy(imageInputStream3, Paths.get(imagePath3));
	        
	    	//getting database connection (jdbc code)
			Connection connection=null;	
			try 
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection=DriverManager.getConnection( "jdbc:mysql://localhost:3306/ems?characterEncoding=utf8","root","srivkp@2003");	
				String sql = "insert into event_details(dept_id,dept_name,event_category,event_date,event_topic,resource_person_name,resource_person_details,broucher,image1,image2,description) values(?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement ps1 =connection.prepareStatement(sql);
				ps1.setInt(1,DeptId );
				ps1.setString(2, deptname);
				ps1.setString(3, eventcategory);
				ps1.setString(4, eventdate);
				ps1.setString(5, eventtopic);
				ps1.setString(6, rpname);
				ps1.setString(7,  rpdetails );
				ps1.setString(8,imageFileName);
				ps1.setString(9,imageFileName2);
				ps1.setString(10, imageFileName3);
				ps1.setString(11,  description);
				int row=ps1.executeUpdate(); // it returns no of rows affected.
				
				if(row>0)
				{
					System.out.println("Image added into database successfully.");
				}
				
				else
				{
					System.out.println("Failed to upload image.");
				}
				
				
			}
			catch (Exception e)
			{
				System.out.println(e);
			}
			
	         resp.sendRedirect("department/addEvent.jsp");
				}
	    
		

}

