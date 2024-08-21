<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@page import="java.util.List"%>

<%@page import="com.db.DBconnect"%>
<%@page import="com.entity.*"%>
<%@page import="com.dao.*"%>
<%@page import="com.admin.servlet.*"%>
<%@page import="com.dept.servlet.*"%>

  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Event</title>
<%@include file="allcss.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 <style type="text/css">
  
   
  
 
   .clink{
   text-decoration:none;
   }


  * {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

..buttons {
    margin: 10%;
    text-align: center;
}

.btn-hover {
    width: 200px;
    font-size: 16px;
    font-weight: 600;
    color: #fff;
    cursor: pointer;
    margin: 20px;
    height: 55px;
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
           
   
   .as{
    font-size: 20px;
   font-weight: 450;
   
   }
   .fa2{
      text-transform:capitalize;
         font-size: 35px;
 color: #fff;

 font-family:  Calendas Plus;
 
              
   
   }
 .bg{
 background-image: url(../icons/sri5.gif);

 background-position:center;
background-size: cover;

}
.contact-container::after,
.contact-container::before {
  content: "";
  width: 28.125rem;
  height: 28.125rem;
  border-radius: 20.125rem;
  background: #5006bf;
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
  background: #095abd;
  
}
    .back{

 border-radius: 10px;
  padding:15px;


   border-radius: 0.2rem;
    border: 2px solid #d4afc7;



   }
.form-label{
color: #fff;
  font-family:  Calendas Plus;
font-weight:200px;
 text-transform: capitalize;
} 
.fs-3 {
         font-family: Spectral;
 } 
   .as input{
  width: 100%;
  height: 40px;

 
 
     font-family:  Calendas Plus;
  }
  .as select{
  width: 100%;
  height: 40px;
  border: none;
  background:#efefef ;
 
     font-family:  Calendas Plus;
  }
 </style>
</head>
<body class="bg">
 <%@include file="navbar.jsp"%>
<c:if test="${empty deptObj }">
	<c:redirect url="../department_login.jsp" ></c:redirect> 
 </c:if>

   <div class="container-fluid p-3 contact-container">
  
    <div class="row">
    
          <div class=" col-md-7 offset-md-3" >
				 
						<p class="fa2  text-center"> Register Event</p>
				
				  <div class="back">
                <div class="">
				   <form action="../addevent" method="post" class="row g-3" enctype="multipart/form-data">
				      <c:if test="${not empty succMsg}">
				         <script>
            Swal.fire({
              title: 'Success!',
              text: '${succMsg}',
              icon: 'success',
              confirmButtonText: 'OK',
                  width: '400px', // Customize width
                  heightAuto: false ,// Disable automatic height adjustment
            });
          </script>
				    
				      <c:remove var="succMsg" scope="session"/>
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
				   
				  <input type="hidden" name="deptid" value="${deptObj.id}">
				  		   
				   <div class="as col-md-6">
				   <label for="inputEmail4" class=" form-label">Dept Name*</label>
				   
				  
				      <select name="deptname" required class="form-control" >
				   <option>---select---</option>
				   <% DeptDao dao = new DeptDao(DBconnect.getConn());
				       List<department> list= dao.getAllDeptname();	
	       			 for(department d2: list)
	       			 {%>
	       				 <option><%=d2.getFullname()%></option>
	       			 <%}
				   %>
				   </select>
				
				   
				  
				   </div>
				   
				   <div class="as col-md-6">
				   <label for="inputEmail4" class=" form-label">Event Category*</label>
				   <select
				     name="eventcategory" for="dropdown" class="form-control" required >
				   <option>---select---</option>
				     <option value="Seminar">Seminar</option>
				     <option value="Webinar">Webinar</option>
				      <option value="Workshop">Workshop</option>
				      <option value="Guest Lecture">Guest Lecture</option>
				      
				      
				     </select>
				   </div>
				   
				   
				    <div class="as col-md-6">
				   <label for="inputEmail4" class="form-label">Event Date*</label><input type="date" required 
				     name="edate" class="form-control">
				   </div>
				   
				    <div class="as col-md-6">
				   <label for="inputEmail4" class="form-label">Event topic*</label><input type="text"required 
				     name="etopic" class="form-control">
				   </div>
				   
				   
				   <div class="as col-md-6">
				   <label for="inputEmail4" class="form-label">Event Time*</label><input type="text" required 
				     name="rpname" class="form-control">
				   </div>
				   
				    <div class="as col-md-6">
				   <label for="inputEmail4" class="form-label">Resource person details*</label><input type="text"required 
				     name="rpdetails" class="form-control">
				   </div>
				   
				    
				    <div class="as col-md-6">
				   <label for="inputEmail4" class="form-label">Broucher*</label><input type="file" required 
				     name="broucher" class="form-control">
				   </div>
				    
				    
				    <div class="as col-md-6">
				   <label for="fa inputEmail4" class="form-label">Image1</label><input type="file" 
				     name="photo1" maxlength="10" class="form-control">
				   </div>
				   
				     <div class="as col-md-6">
				   <label for="fa inputEmail4" class="form-label">Image2</label><input type="file" 
				     name="photo2" maxlength="10" class="form-control">
				   </div>
				   
				  
				   
				  <div class="as col-md-12">
				  <label for="fa inputEmail4" class="form-label">Description</label>				  	
				  <textarea  name ="description" class="form-control" rows ="4" cols="50"></textarea>
				  
				  </div>
								    
				    <div align="center">
				  <button class="buttons btn-hover color-7" type = "submit" class="btn " >SUBMIT</button>
				   </div>
				   </form>
					</div>
				</div>
			</div>
      
	
	
       
   
    </div>
</div>
</body>
</html>