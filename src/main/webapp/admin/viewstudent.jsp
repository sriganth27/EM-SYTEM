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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 <style type="text/css">
       body{
  background:  #fff;
 
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
         
  .tab{

  font-family:  Calendas Plus;
  background-color:#fff;
   border-bottom-width:10px;
  border-color: 3px solid orange;
  border: 3px solid orange;
 }
.hd{
background: pink;
text-transform: capitalize;
}
   
    .ps{
   text-transform:capitalize;

   color: #e70ca9;
 
    font-family: Spectral;
 
   } 
   
 .bg{
  background-image: url(../icons/sri5.gif);

 background-position:center;
background-size: cover;

}
.project-container::after,
.project-container::before {
  content: "";
  width: 28.125rem;
  height: 28.125rem;
  border-radius: 20.125rem;

background: #0355ac;
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
  background: #0355ac;

} 
.fs-3 {
         font-family: Spectral;
 } 
  
 </style>
 <script>
    function togglePasswordVisibility(cell) {
        var password = cell.innerText;
        cell.innerText = cell.getAttribute('data-password');
        cell.setAttribute('data-password', password);
    }
</script>
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

               	  <script>
    document.addEventListener('DOMContentLoaded', function () {
        // Select all delete links with class 'delete-link'
        const deleteLinks = document.querySelectorAll('.delete-link');

        deleteLinks.forEach(link => {
            link.addEventListener('click', function (event) {
                event.preventDefault();
                const url = this.getAttribute('href');

                // Show SweetAlert confirmation dialog
                Swal.fire({
                    title: 'Are you sure?',
                    text: 'You won\'t be able to revert this!',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        // If confirmed, redirect to the deletion URL
                        window.location.href = url;
                    }
                });
            });
        });
    });
</script>
               	   <c:if test="${not empty sucMsg}">
				      <script>
            Swal.fire({
              title: 'Success!',
              text: '${sucMsg}',
              icon: 'success',
              confirmButtonText: 'OK',
                  width: '400px', // Customize width
                  heightAuto: false ,// Disable automatic height adjustment
            });
          </script>
				      <c:remove var="sucMsg" scope="session"/>
				   </c:if>
				   
				   <c:if test="${not empty errorMsg}">
				      <script>
            Swal.fire({
              title: 'Error!',
              text: '${errorMsg}',
              icon: 'error',
              confirmButtonText: 'OK',
                  width: '400px', // Customize width
                  heightAuto: false ,// Disable automatic height adjustment
            });
          </script>
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
					    
					         <a href="../deleteStd?id=<%=ap.getId()%>" class=" btn btn-sm btn2 delete-link">Delete</a>
			                
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