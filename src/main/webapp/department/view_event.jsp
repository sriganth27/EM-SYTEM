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
<title>Event Details</title>
<%@include file="allcss.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 <style type="text/css">
       body{
  background: #08030a;
 
  }
  
.buttons {
    margin: 10%;
    text-align: center;
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
   
 
  .tab{
   background:#fff;
   border: 2.5px solid #032455;
  border-color:orange;
  
  font-family:  Calendas Plus;
 }
.hd{
background: pink;
text-transform: capitalize;
}
   
    .ps{
   text-transform:uppercase;
   font-size: 27px;
  color: #94069c;


  letter-spacing: 1px;
 font-family:  Calendas Plus;
  text-shadow: 0px 1px 0px #ccc;

              
   }  
 }
 .bg{
  background: #08030a;

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
 <%@include file="navbar.jsp"%>
 <c:if test="${empty deptObj }">
	<c:redirect url="../department_login.jsp" ></c:redirect> 
 </c:if>
 
 <div class="container-fluid p-4 contact-container">
    <div class="row">
          
      
	<div align="center">
	<div class="col-md-12">
	<div id="tblCustomers">	
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
				   
			   <p class="ps  text-center">Event Details</p>
			   <table class=" table table-striped table-bordered tab">
			    <thead class="hd">
			     <tr>
			       <th scope ="col">SNO</th>
			     	<th scope="col">Dept Name</th>
			     	<th scope="col">Event Category</th>
			     	<th scope="col">Event date</th>
			     	<th scope="col">Event Topic</th>
			     	<th scope="col">Event Time</th>
			     	<th scope="col">RPDeatils</th>
			     	<th scope="col">Broucher</th>
			     	<th scope="col">Image1</th>
			     	<th scope="col">Image2</th>
			     	<th scope="col">Description</th>
			        <th scope="col">Action</th>
			       
			     	
			    </tr>
			   
			   </thead>
			   <tbody>
			   <%
			   department da = (department) session.getAttribute("deptObj");
			   EventDao dao = new EventDao(DBconnect.getConn());
			   List<event> list = dao.getAllEventByLoginDept(da.getId());
			   int serialNumber = 1;
			    
			   for(event ap:list)
			   { %>
			   
					   <tr>
					     <td><%= serialNumber++ %></td>
					   <td><%=ap.getDeptname()%></td>
					   <td><%=ap.getEventCategory() %></td>
					    <td><%=ap.getEventDate() %></td>
					    <td><%=ap.getEventTopic() %></td>
					    <td><%=ap.getResourcePersonName() %></td>
					    <td><%=ap.getResourcedPersonDetails() %></td>
					    <td><img src=../addevent?id=<%=ap.getId()%> alt="image not found" width="100px" height="100px"></td>
					    <td><img src=../addImage?id=<%=ap.getId()%> alt="image not found" width="100px" height="100px"></td>
					    <td><img src=../addPhoto?id=<%=ap.getId()%> alt="image not found" width="100px" height="100px"></td>
					
					    <td><%=ap.getDescription() %></td>
					    <td><a href="edit_event.jsp?id=<%=ap.getId()%>" class=" btn btn-sm btn1">Edit</a>
					    
					         <a href="../deleteEvent?id=<%=ap.getId()%>" class=" btn btn-sm btn2 delete-link" >Delete</a>
					          <a href="view_report.jsp?id=<%=ap.getId()%>" class=" btn btn-sm btn3 ">Report</a>
					       
			                
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
       </div>
 

</body>
</html>