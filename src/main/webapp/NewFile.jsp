<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
 <%@ page import="java.util.Date" %>
 <%@ page import="java.text.SimpleDateFormat" %>
  <%@ page import="java.util.*" %>
     <%@page import="java.util.List"%>

<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
   Date today = new Date();
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
   String formattedDate = sdf.format(today);
%>

Today's date is: <%=formattedDate%>
 <p class="fa2 fs-3 text-center">Event details</p>
	     <table  class="table table-striped table-bordered tab">
			    <thead class="hd">
			     <tr class="warning">
			     	<th scope="col">Dept Id</th>
			      	<th scope="col">Dept Name</th>
			     	<th scope="col">Event Category</th>
			     	<th scope="col">Event date</th>
			     	<th scope="col">Event Topic</th>
			     	<th scope="col">RPName</th>
			     	<th scope="col">RPDeatils</th>
			     	<th scope="col">Broucher</th>
			     
			    </tr>
			    </thead>
			    
			    <%
			    try {
			    	String s1 = request.getParameter("Search1");
			    	
					Class.forName("com.mysql.cj.jdbc.Driver");
		            Connection conn =DriverManager.getConnection( "jdbc:mysql://localhost:3306/ems?characterEncoding=utf8","root","srivkp@2003");
		            String sql = "select * from event_details  where event_date  like'%"+formattedDate+"%' ";
		            	
		    		
		    		PreparedStatement ps = conn.prepareStatement(sql);
		    		
		    		
		    		ResultSet rs = ps.executeQuery();
		    		while(rs.next())
		    		{%>
		    			<tr>
		    			  <td><%=rs.getInt("dept_id")%></td>
		    		    <td><%=rs.getString("dept_name")%></td>
		    			<td><%=rs.getString("event_category")%></td> 
		    			<td><%=rs.getString("event_date")%></td> 
		    		    <td><%=rs.getString("event_topic")%></td> 
		    			<td><%=rs.getString("event_time")%></td> 
		    			<td><%=rs.getString("resource_person_details")%></td> 
		    	        <td><img src=../addevent?id=<%=rs.getInt("id")%> alt="image not found" width="100px" height="100px"></td> 
			           	
		    			</tr>
		    			
		    		<%}
		            
				}
				catch(Exception ae) {
					ae.printStackTrace();
				}
			    %>
			  </tbody>
</table>
</body>
</html>