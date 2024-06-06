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
<title>Feed Back</title>
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
      text-transform:uppercase;
      font-size: 30px;
  color:#dcdd12;
  font-family:  Calendas Plus;
  letter-spacing: 1.5px;
   
   }
 .bg{

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
     
 
    .card{
    border-radius:10px;
 box-shadow: 0 20px 40px rgb(0,0,0);
  background: rgb(1,44,128);
   border-radius: 0.5rem;
    border: 1.5px solid rgb(12, 88, 220);



   }
.form-label{
color: #9698bc;
  font-family:  Calendas Plus;
font-weight:200px;
 text-transform: capitalize;
} 
 </style>
</head>
<body class="bg">
 <%@include file="navbar.jsp"%>
 <c:if test="${empty studObj }">
	<c:redirect url="../department_login.jsp" ></c:redirect> 
 </c:if>
 
   <div class="container-fluid p-3 project-container">
    <div class="row">
    
          <div class=" col-md-6 offset-md-3" >
				
						<p class="fa2 fs-3 text-center">Feedback</p>
						
				   <%
				   int id = Integer.parseInt(request.getParameter("id"));
				   EventDao dao2= new EventDao(DBconnect.getConn());
				   event d = dao2.getEventById(id);
				   %>
				     <div class="card" >
                <div class="card-body">
				   <form action="../feedback" method="post" class="row g-3" enctype="multipart/form-data">
				      
				   
				  <input type="hidden" name="deptid" value="${deptObj.id}">
				  		   
				  
				   
				   <div class="as col-md-6">
				   <label for="inputEmail4" class=" form-label">Name*</label><input  type="text" required 
				     name="name" class="form-control"  >
				   </div>
				   
				   <div class="as col-md-6">
				   <label for="inputEmail4" class=" form-label">Register Number*</label><input  type="text" required 
				     name="regnumber" class="form-control"  >
				   </div>
				   
				   <div class="as col-md-6">
				   <label for="inputEmail4" class=" form-label">Dept Name*</label><input value="<%=d.getDeptname()%>" type="text" required 
				     name="deptname" class="form-control"  >
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
				   
				 <div class="as col-md-12">
				  <label for="fa inputEmail4" class="form-label">Comments*</label>				  	
				  <textarea  name ="description" class="form-control" rows ="4" cols="50"></textarea>
				  
				  </div>
								    
				    <div align="center">
				   <button class="buttons btn-hover color-7" type = "submit" class="btn" >SUBMIT</button>
				   </div>
				
				   </form>
				   	</div>
				</div>
				 </div>
					</div>
				</div>
			</div>
      
	
	
       
   
   
</body>
</html>