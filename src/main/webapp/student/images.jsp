<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@page import="java.util.List"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="java.sql.*"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.entity.*"%>
<%@page import="com.dao.*"%>
<%@page import="com.admin.servlet.*"%>
<%@page import="com.dept.servlet.*"%>
<%@page import="com.student.servlet.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Event_details</title>
<%@include file="../department/allcss.jsp" %>
<style type="text/css">
 * {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

/* Apply padding to the left and right of the images */
img {
    padding-left: 15px;
    padding-right: 5px;
    padding-top: 5px;
    padding-bottom: 15px;
}

/* Apply margin to each image to create space between them */
img:first-child {
    margin-right: 15px;
    margin-top: 15px;
     /* Add space to the right of the first image */
}

img:not(:first-child) {
    margin-left: 15px;
     margin-top: 15px; /* Add space to the left of all images except the first one */
}


  body{
  margin: 0;
    padding: 0;
    height: 100vh; /* Make sure the body covers the entire viewport height */
    
    background-size: cover; /* Ensure the background covers the entire body */
    background-position: center; /* Center the background */
    background-color: #05012c;
  @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');
  } 
.project-container::after,
.project-container::before {
  content: "";
  width: 28.125rem;
  height: 28.125rem;
  border-radius: 20.125rem;

  background: #150364;
  position:absolute;
  z-index: -10;
  filter: blur(200px);
}

.project-container::after {
  top: -3rem;
  left: -5rem;

}
  .project-container::before {
  bottom:0rem;
  right: 0rem;
  background: #6f069c;
}    
  
</style>
</head>
<body class="bg">
				  
<%@include file="navbar.jsp" %>
<%
   Date today = new Date();
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
   String formattedDate = sdf.format(today);
  


%>
       

<br>
 <div class="project-container"  >
		  
<br>
             
	 
			    
			    <%
			    boolean eventsExist = false;
			    try {
			    	String s1 = request.getParameter("Search1");
			    	
					Class.forName("com.mysql.cj.jdbc.Driver");
		            Connection conn =DriverManager.getConnection( "jdbc:mysql://localhost:3306/ems?characterEncoding=utf8","root","srivkp@2003");
		            
		            // Obtain the department name from the session attribute
		            student user = (student) session.getAttribute("studObj");
		            String deptName = user.getFullname();
		            
		            // Modify the query to include department name filtering
		            String sql = "SELECT * FROM event_details WHERE  dept_name LIKE '%" + deptName + "%' ORDER BY id DESC";
		            	
		    		PreparedStatement ps = conn.prepareStatement(sql);
		    		
		    		ResultSet rs = ps.executeQuery();
		    		int serialNumber = 1;
		    		while(rs.next())
		    		{
		    			eventsExist = true;
		    		%>
		    		
		    		    <img src=../addImage?id=<%=rs.getInt("id")%> alt="image not found" width="350px" height="350px">
		    		     
		    			<img src=../addPhoto?id=<%=rs.getInt("id")%> alt="image not found" width="350px" height="350px">
		    	
		    			
		    		<%}
		    	    
				  
		            
				}
				catch(Exception ae) {
					ae.printStackTrace();
				}
			    %>
		


</div>

  

</body>


</html>
