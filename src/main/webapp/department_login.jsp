<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>department Login Page</title>
 <%@include file="component/allcss.jsp" %>
  <style type="text/css">
  
    
   
  body{
  margin: 0;
    padding: 0;
    height: 100vh; /* Make sure the body covers the entire viewport height */
    
    background-size: cover; /* Ensure the background covers the entire body */
    background-position: center; /* Center the background */
    background-color: #05012c;
  @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');
  } 
  .project-container {
    margin: 4rem 0;
    position: relative;
    padding-left: 10px;
    padding-right: 20px;
}

.project-container::after,
.project-container::before {
  content: "";
  width: 28.125rem;
  height: 28.125rem;
  border-radius: 20.125rem;

  background: #150364;
  position: absolute;
  z-index: -1;
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
   
  form
  {
  width: 500px;
  margin: 8% auto;
  padding: 50px 0;
  text-align: center;
  box-shadow: 0 20px 40px rgb(0,0,0);
 
     border-radius:5%;

  }
  .mb-3{
  margin:30px auto;
  width:80%;
  position :relative;
  box-shadow: 0 8px 10px -10px rgb(0,0,0);
  }
  
  .mb-3 input{
  width: 100%;
  height: 40px;
  border: none;
  background:#efefef ;
  padding-left: 50px;
  }
  span{
  position: absolute;
  left: 0;
  right: 0;
  height: 40px;
  width: 40px;
background: rgb(120,0,123);
background-image: linear-gradient(to top, #cc208e 0%, #6713d2 100%);
  }
  
  span .fa{
    padding: 10px;
    color: #fff;
  }
  button{
  width: 130 px;
  height: 40px;
  margin-left: 10%;
  display: block;
  color:#fff;
  border: 0;
  font-size: 16px;
  outline: none;
 background: rgb(120,0,123);
background-image: linear-gradient(to top, #cc208e 0%, #6713d2 100%);
  box-shadow: 0 8px 10px -10px rgb(0,0,0);
  cursor: pointer;
  }
  
  button .fa{
  margin-right: 10px;
  }
 .p1{
 text-transform:uppercase;
  font-size: 30px;
  color: #fff;
  letter-spacing: 1px;
    font-family: Spectral;
  text-shadow: 0px 1px 0px #ccc;
              
   
   
   </style>
</head>
<body >

 <%@include file="component/navbar.jsp"%>
 <div class="project-container">
             
				
                 	<form action="deptLogin" method="post">
                 	  <c:if test="${not empty sucMsg}">
				      <P class="text-center text-white fs-3">${sucMsg}</P>
				      <c:remove var="sucMsg" scope="session"/>
				    </c:if>
				   
				   <c:if test="${not empty errorMsg}">
				      <P class="text-center text-white fs-3">${errorMsg}</P>
				      <c:remove var="errorMsg" scope="session"/>
				   </c:if>
				   	 <p class="p1 text-center">department Login</p>
						<div class ="mb-3">
							<span><i class=" fa fa-solid fa-envelope"></i></span><input name="email" required 
							 placeholder="Email Id " type="email" class="form-control">
						</div>	
						
						<div class ="mb-3">
							<span><i class=" fa fa-solid fa-key"></i></span><input name="password" required 
							 placeholder="Password" type="password" class="form-control">
						</div>		
						<button type="submit" ><i class=" fa fa-solid fa-sign-in"></i>login</button>	   			   	
				   	</form>

 
</div>
</body>
</html>