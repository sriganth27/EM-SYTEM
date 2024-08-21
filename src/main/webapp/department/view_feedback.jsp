
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
   <%@page import="java.util.List"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.entity.*"%>
<%@page import="com.dao.*"%>
<%@page import="com.admin.servlet.*"%>
<%@page import="com.dept.servlet.*"%>
<%@ page import="java.util.*" %>

<%@page import="java.sql.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feed Back</title>
<%@include file="../department/allcss.jsp" %>
<style type="text/css">
 * {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

.buttons {
    margin: 10%;
    text-align: center;
}
.feed{
 color: #fff;
    letter-spacing: 3px;
    text-transform :capitalize;
    font-family: myFirstFont;
    font-style:inherit;
    text-align: center;

}
.btn-hover {
    width: 200px;
    font-size: 16px;
    font-weight: 600;
    color: #fff;
    cursor: pointer;
    margin: 20px;
    height: 45px;
    text-align:center;
    border: none;
    background-size: 300% 100%;

    border-radius: 50px;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
}

.btn-hover:hover {
    background-position: 100% 0;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
}

.btn-hover:focus {
    outline: none;
}
  .btn-hover.color-7 {
    background-image: linear-gradient(to right, #6253e1, #852D91, #A3A1FF, #F24645);
    box-shadow: 0 4px 15px 0 rgba(126, 52, 161, 0.75);
}
   

.bg{
   background:#fff;
   }
        h1{
   text-transform:capitalize;
      font-size: 35px;
      
color: #fff;
  letter-spacing: 1px;
 font-family:  Calendas Plus;

   }   
   .btn2{
   display : inline-block;
   text-decoration:none;
   border:1px solid #fff;
   padding : 5px 15px;
   position:relative;
  color:#fff;
  background: linear-gradient(to right , #5543ca , #00BCD4);
  
    font-size: 17px;
   font-weight: 600;
   cursor: pointer;
   
   }
   
   
   .btn :hover{
   border:1px solid #f44336;
    transition : 1s;
    background: #f44336;
   }
.tab{
 background:#fff;
 
 border-color:orange ;
 border: 2px solid orange ;
  font-family:  Calendas Plus;
 
}
.hd{
background:pink ;
text-transform: capitalize;
}

.bg{
  background-image: url(../icons/sri5.gif);
height:100vh;
 background-position:center;
background-size: cover;

}
.contact-container::after,
.contact-container::before {
  content: "";
  width: 28.125rem;
  height: 28.125rem;
  border-radius: 20.125rem;
  background: #94069c;
  position: absolute;
  z-index: -1;
  filter: blur(200px);
}

.contact-container::after {
  top: -3rem;
  left: -5rem;

}

.contact-container::before {
  bottom:0rem;
  right: 0rem;
  background: #6f069c;
  
}
</style>
</head>
<body class="bg">
				  
<%@include file="navbar.jsp" %>


<br>
<div class="contact-container">
<div class="feed">
<h1 >  Feedback Results</h1>
</div>
<br>
 			 <form action="view_feedback.jsp" method="post">
              <div align="center">
              <div class="col-sm-4 ">
              <div class="input-group">
			   <input type="text" name="Search1" class="form-control" placeholder="YYYY-MM-DD"> 
			   <input type="text" name="Search2" class="form-control" placeholder="YYYY-MM-DD"> 
			   
			  <div class="input-group-btn">
			  <button type="submit" value="Search" class="btn2 btn-primary"><i class="fa-solid fa-magnifying-glass"></i>Search</button>
			  </div>
			  </div>
              </div>
              </div>		
		 
           
           

<%
  department user = (department) session.getAttribute("deptObj");

  String id = user.getFullname();


%>             
           

             
                
				      
<br>
             <div id="tblCustomers">
       <div align="center">
       <div class="col-md-11 " >
       

<%
boolean eventsExist = false;
        if(request.getParameter("Search1")==null){%>
        <div class="tab"></div>
       <table  class="table table-striped table-bordered tab">
			  
			    <thead class="hd">
			     <tr class="warning">
			        <th scope="col">S.NO</th>
			        <th scope="col">Name</th>
			        <th scope="col">Reg NO</th>
			      	<th scope="col">Dept Name</th>
			    
			        <th scope="col">Event date</th>
			     	<th scope="col">Event Topic</th>
			     <th scope="col">Event Time</th>
		
			     	<th scope="col">Comments</th>
			     	<th scope="col">Results</th>
			    </tr>
			    </thead>
			    
			    <%
			    try {
			    	String s1 = request.getParameter("Search1");
			    	String s2 = request.getParameter("Search2");
					Class.forName("com.mysql.cj.jdbc.Driver");
		            Connection conn =DriverManager.getConnection( "jdbc:mysql://localhost:3306/ems?characterEncoding=utf8","root","srivkp@2003");
		        
		            	
		            String sql = "SELECT * FROM feedback WHERE  dept_name  like'%"+id+"%' order by id desc";

		    		PreparedStatement ps = conn.prepareStatement(sql);
		    		
		    		
		    		ResultSet rs = ps.executeQuery();
		    		int serialNumber = 1;
		    		while(rs.next())
		    		{
		    			eventsExist = true;
		    		%>
		    			<tr>
		    		 <td><%=serialNumber++%></td>
		    		 <td><%=rs.getString("name")%></td>
		    		 	<td><%=rs.getString("reg_number")%></td>
		    		    <td><%=rs.getString("dept_name")%></td>
		    			
		    			<td><%=rs.getString("event_date")%></td> 
		    		    <td><%=rs.getString("event_topic")%></td> 
		    			<td><%=rs.getString("event_time")%></td> 
		    			<td><%=rs.getString("comments")%></td> 
		    			<td><%=rs.getString("sentiment")%></td> 
		    		
					    
		    			 	
		    			</tr>
		    			
		    		<%}
		            
				}
				catch(Exception ae) {
					ae.printStackTrace();
				}
			    %>
			  </tbody>

			  </tbody>
</table>

<%}
else{%>
       
             
	     <table  class="table table-striped table-bordered tab">
			    <thead class="hd">
			     <tr class="warning">
			        <th scope="col">S.NO</th>
			        <th scope="col">Name</th>
			        <th scope="col">Reg NO</th>
			      	<th scope="col">Dept Name</th>
			    
			        <th scope="col">Event date</th>
			     	<th scope="col">Event Topic</th>
			     <th scope="col">Event Time</th>
		
			     	<th scope="col">Comments</th>
			     	<th scope="col">Results</th>
			    </tr>
			    </thead>
			    
			    <%
			    try {
			    	String s1 = request.getParameter("Search1");
			    	String s2 = request.getParameter("Search2");
					Class.forName("com.mysql.cj.jdbc.Driver");
		            Connection conn =DriverManager.getConnection( "jdbc:mysql://localhost:3306/ems?characterEncoding=utf8","root","srivkp@2003");
		        
		            	
		            String sql = "SELECT * FROM feedback WHERE event_date BETWEEN '" + s1 + "' AND '" + s2 + "' AND dept_name  like'%"+id+"%' order by id desc";

		    		PreparedStatement ps = conn.prepareStatement(sql);
		    		
		    		
		    		ResultSet rs = ps.executeQuery();
		    		int serialNumber = 1;
		    		while(rs.next())
		    		{
		    			eventsExist = true;
		    		%>
		    			<tr>
		    		 <td><%=serialNumber++%></td>
		    		 <td><%=rs.getString("name")%></td>
		    		 	<td><%=rs.getString("reg_number")%></td>
		    		    <td><%=rs.getString("dept_name")%></td>
		    			
		    			<td><%=rs.getString("event_date")%></td> 
		    		    <td><%=rs.getString("event_topic")%></td> 
		    			<td><%=rs.getString("event_time")%></td> 
		    			<td><%=rs.getString("comments")%></td> 
		    			<td><%=rs.getString("sentiment")%></td> 
		    		
					    
		    			 	
		    			</tr>
		    			
		    		<%}
		            
				}
				catch(Exception ae) {
					ae.printStackTrace();
				}
			    %>
			  </tbody>
</table>

<%} %>
<br>
</div>
</div>
 </div>         
</form> 
  </div>
</body>


</html>