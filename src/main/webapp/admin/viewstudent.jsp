<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@page import="java.util.List"%>

<%@page import="com.db.DBconnect"%>
<%@page import="com.entity.*"%>
<%@page import="com.dao.*"%>

  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Details</title>
<%@include file="allcss.jsp" %>
 <style type="text/css">
       body{
  background:  #fff;
 
  } 
  .tab{
background-color:#fff;
   border: 10px;
  border-color:orange;
 }
.hd{
background: pink;
text-transform: capitalize;
}
           .btn1 {
            background-image: linear-gradient(to right, #FF512F 0%, #F09819  51%, #FF512F  100%);
            margin: 10px;
            padding: 15px 45px;
            text-align: center;
            text-transform: uppercase;
            transition: 0.5s;
            background-size: 200% auto;
            color: white;            
            box-shadow: 0 0 20px #eee;
            border-radius: 10px;
            display: block;
          }

          .btn1:hover {
            background-position: right center; /* change the direction of the change here */
            color: #fff;
            text-decoration: none;
          }
               
         .btn2 {
            background-image: linear-gradient(to right, #DA22FF 0%, #9733EE  51%, #DA22FF  100%);
            margin: 10px;
            padding: 15px 45px;
            text-align: center;
            text-transform: uppercase;
            transition: 0.5s;
            background-size: 200% auto;
            color: white;            
            box-shadow: 0 0 20px #eee;
            border-radius: 10px;
            display: block;
          }

          .btn2:hover {
            background-position: right center; /* change the direction of the change here */
            color: #fff;
            text-decoration: none;
          }
         

             
         .btn3 {
            background-image: linear-gradient(to right, #02AAB0 0%, #00CDAC  51%, #02AAB0  100%);
            margin: 10px;
            padding: 15px 45px;
            text-align: center;
            text-transform: uppercase;
            transition: 0.5s;
            background-size: 200% auto;
            color: white;            
            box-shadow: 0 0 20px #eee;
            border-radius: 10px;
            display: block;
          }

          .btn3:hover {
            background-position: right center; /* change the direction of the change here */
            color: #fff;
            text-decoration: none;
          }
          
    .ps{
      text-transform:uppercase;

   color: #e70ca9;
 
    font-family: Spectral;
   letter-spacing: 1px;
   
   } 
   
 .bg{

    background-color: #05012c;
 
  } 
.project-container::after,
.project-container::before {
  content: "";
  width: 28.125rem;
  height: 28.125rem;
  border-radius: 20.125rem;

background: #064b35;
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
  background: #064b35;

}       
 </style>
  <script>
    function togglePasswordVisibility(cell) {
        var password = cell.innerText;
        cell.innerText = cell.getAttribute('data-password');
        cell.setAttribute('data-password', password);
    }
</script>
</head>
<body class="bg">
 <%@include file="navbar.jsp"%>
 <div class="container-fluid p-4 project-container">
    <div class="row">
          
      
	<div align="center">
	<div class="col-md-8">

               	   <c:if test="${not empty sucMsg}">
				      <P class="fs-3 text-center text-warning fs-3">${sucMsg}</P>
				      <c:remove var="sucMsg" scope="session"/>
				   </c:if>
				   
				   <c:if test="${not empty errorMsg}">
				      <P class="fs-3 text-center text-warning fs-3">${errorMsg}</P>
				      <c:remove var="errorMsg" scope="session"/>
				   </c:if>
				
			   <p class="ps fs-2 text-center">Student Details</p>
			   <table class=" table table-striped table-bordered tab">
			    <thead class="hd">
			     <tr>
			       	<th scope="col">S.NO</th>
			     	<th scope="col">Dept Name</th>
			     	<th scope="col">Email </th>
			     	<th scope="col">Password</th>
			     	<th scope="col">Action</th>
			     	
			     	
			    </tr>
			   
			   </thead>
			   <tbody>
			   <%
		
			   StudentDao dao = new  StudentDao(DBconnect.getConn());
			   List<student> list = dao.getAllStd();
				int serialNumber = 1;
			    
			   for(student ap:list)
			   { %>
			   
					   <tr>
					     <td><%=serialNumber++%></td>
					   <td><%=ap.getFullname()%></td>
					   <td><%=ap.getEmail() %></td>
						  <td>
                                <span onclick="togglePasswordVisibility(this)"
                                    data-password="<%= ap.getPassword() %>">*****</span>
                            </td>
					    <td><a href="edit_std.jsp?id=<%=ap.getId()%>" class=" btn btn-sm btn1">Edit</a>
					    
					         <a href="../deleteStd?id=<%=ap.getId()%>" class=" btn btn-sm btn2">Delete</a>
			                
			           </td>
					    
					  
					   </tr>

				   
				   
			   <%}
			   
			   %>
			  </tbody>
	
		   </table>
		
	 </div>
	 
	</div>
	
	 </div>
        
       </div>
 

</body>
</html>