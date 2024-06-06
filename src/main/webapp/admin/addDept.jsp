<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Department</title>
<%@include file="allcss.jsp" %>
<style type="text/css">
**{
  font-family:  Calendas Plus;
}
.buttons {
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
            background-image: linear-gradient(to right, #02AAB0 0%, #00CDAC  51%, #02AAB0  100%);
    box-shadow: 0 4px 15px 0 rgba(126, 52, 161, 0.75);
}
   
 
    .paint-card{
   box-shadow: 0 0 10px 0 rgba(0, 0,0, .3);
   }
   
   .clink{
   text-decoration:none;
   }
  

   .as{
    font-size: 20px;
   font-weight: 600;
   
   }
  
  
    .p1{
 
   text-transform:uppercase;

   color: #e70ca9;
 
    font-family: Spectral;
   letter-spacing: 1px;
   
   }
   
    
      .card{


  
   border-radius: 10px;
  box-shadow: 0 20px 40px #0c0225;
  background:#10003a;
   border-radius: 0.5rem;
    border: 1.5px solid rgb(12, 88, 220);
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

.form-label{
color: #fff;
  font-family:  Calendas Plus;
font-weight:200px;
 text-transform: capitalize;
} 
 </style>

</head>
<body class="bg">
<%@include file="navbar.jsp"%>
	 
				   <br>
				   <br>
				   <div class="project-container">
				   	 <div class="container-fluid p-3 ">
                     <div class="row">
                     <div class="col-md-4 offset-md-4">
				
						<p class="p1 fa2 fs-2 text-center">Add Department</p>
						
				   <c:if test="${not empty sucMsg}">
				      <P class="fs-3 text-center text-warning fs-3">${sucMsg}</P>
				      <c:remove var="sucMsg" scope="session"/>
				   </c:if>
				   
				   <c:if test="${not empty errorMsg}">
				      <P class="fs-3 text-center text-warning fs-3">${errorMsg}</P>
				      <c:remove var="errorMsg" scope="session"/>
				   </c:if>
				   
				     <div class="card">
                     <div class="card-body">
				  	<form action="../deptregister" method="post">
				   
				   <div class="as mb-3">
				   <label class="form-label">Full Name*</label><input type="text" required 
				     name="fullname" class="form-control">
				   </div>
				   
				    <div class="as mb-3">
				   <label class="form-label">Email*</label><input type="email" required 
				     name="email" class="form-control">
				   </div>
				   	   
				    <div class="as mb-3">
				   <label class="form-label">Password*</label><input type="password" required 
				     name="password" class="form-control">
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
      
	</div>
	
       
       
   
				   	
				   	

</body>
</html>
