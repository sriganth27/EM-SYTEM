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
<title>Event details</title>
<%@include file="allcss.jsp" %>
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

.btn-hover {
    width: 150px;
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
  background: #94069c;
  position: absolute;
  z-index: -1;
  filter: blur(200px);
}

.contact-container::after {
  top: -3rem;
  left: -5rem;
   background: #095abd;

}

.contact-container::before {
  bottom:0rem;
  right: 0rem;
  background: #94069c;
  
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

.as input , 
.as textarea {
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
				
						<p class="fa2  text-center">Update Event</p>
						
				   <%
				   int id = Integer.parseInt(request.getParameter("id"));
				   EventDao dao2= new EventDao(DBconnect.getConn());
				   event d = dao2.getEventById(id);
				   %>
				     <div class="back">
                <div class="">
				   <form action="../update_event" method="post" class="row g-3" enctype="multipart/form-data">
				      
				   
				  <input type="hidden" name="deptid" value="${deptObj.id}">
				  		   
				   <div class="as col-md-6">
				   <label for="inputEmail4" class=" form-label">Dept Name*</label><input value="<%=d.getDeptname()%>" type="text" required 
				     name="deptname" class="form-control"  >
				   </div>
				   
				   <div class="as col-md-6">
				   <label for="inputEmail4" class=" form-label">Event Category*</label>
				   <input value="<%=d.getEventCategory()%>" type="text" required 
				    name="eventcategory" class="form-control"  >
				  
				   </div>
				   
				   
				    <div class="as col-md-6">
				   <label for="inputEmail4" class="form-label">Event Date*</label><input type="date" required 
				     name="edate" class="form-control" value="<%=d.getEventDate()%>">
				   </div>
				   
				    <div class="as col-md-6">
				   <label for="inputEmail4" class="form-label">Event topic*</label><input type="text"required 
				     name="etopic" class="form-control" value=" <%=d.getEventTopic()%>">
				   </div>
				   
				   
				   <div class="as col-md-6">
				   <label for="inputEmail4" class="form-label">Event Time*</label><input type="text" required 
				     name="rpname" class="form-control" value="<%=d.getResourcePersonName()%>" >
				   </div> 
				   
				    <div class="as col-md-6">
				   <label for="inputEmail4" class="form-label">Resource person details*</label><input type="text"required 
				     name="rpdetails" class="form-control" value="<%=d.getResourcedPersonDetails()%>" >
				   </div>
				   
				    
				    <div class="as col-md-6">
				   <label for="inputEmail4" class="form-label">Broucher*</label><input type="file" required 
				     name="broucher" class="form-control" value="<%=d.getBroucher()%>" >
				   </div>
				    
				    
				    <div class="as col-md-6">
				   <label for="fa inputEmail4" class="form-label">Image1*</label><input type="file" required 
				     name="photo1" maxlength="10" class="form-control" value="<%=d.getImage1()%>" >
				   </div>
				   
				     <div class="as col-md-6">
				   <label for="fa inputEmail4" class="form-label">Image2*</label><input type="file" required 
				     name="photo2" maxlength="10" class="form-control" value="<%=d.getImage2()%>">
				   </div>
				   
				  
				   
				  <div class="as col-md-12">
				   <label for="fa inputEmail4" class="form-label">Description*</label>	
				  	<textarea required name ="description" class="form-control" rows="4" cols=50" value="" ><%=d.getDescription()%></textarea>
				  
				  </div>
				<input type="hidden" name="id" value="<%=d.getId()%>">  
				    <div align="center">
				   <button class="buttons btn-hover color-7" type = "submit" class="btn" >UPDATE</button>
				   </div>
				   </form>
				   	</div>
				</div>
					</div>
				</div>
			</div>
      
	
	
       
   
   
</body>
</html>