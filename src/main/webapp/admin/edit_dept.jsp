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
   .bg{
   background:#fff;
   }
   .clink{
   text-decoration:none;
   }
  
  
    
   .as{
    font-size: 20px;
   font-weight: 600;
   
   }
  
  
  .p1{
 
    text-transform:capitalize;

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

 .mb-3 input{
  width: 100%;
  height: 40px;
  border: none;
  background:#efefef ;
 
     font-family:  Calendas Plus;
  }
  .mb-3 select{
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
	               <br>
				   <br>
				   
				   	 <div class="container-fluid p-3 project-container">
                     <div class="row">
                     <div class="col-md-4 offset-md-4">
			
						<p class="p1 fa2 fs-3 text-center">Edit Department</p>
						
				
				   		
				   <%
				   int id = Integer.parseInt(request.getParameter("id"));
				   DeptDao dao2= new DeptDao(DBconnect.getConn());
				   department d = dao2.getDeptById(id);
				   %>
				       <div class="card">
                     <div class="card-body">
				  	<form action="../updateDept" method="post">
				   
				   <div class="as mb-3">
				   <label class="form-label">Full Name</label>
				   	   <input value="<%=d.getFullname()%>" type="text" required 
				     name="fullname" class="form-control">
			
				   </div>
				   
				    <div class="as mb-3">
				   <label class="form-label">Email</label><input value="<%=d.getEmail()%>" type="email" required 
				     name="email" class="form-control">
				   </div>
				   	   
				    <div class="as mb-3">
				   <label class="form-label">Password</label><input value="<%=d.getPassword()%>" type="text" required 
				     name="password" class="form-control">
				   </div>
				   <input type="hidden" name="id" value="<%=d.getId()%>">
				   <div align="center">
				   <button class="buttons btn-hover color-7" type = "submit" class="btn " >UPDATE</button>
				   </div>
				   
				   </form>
					</div>
				</div>
			</div>
      	</div>
			</div>
	
	
       
       
   
				   	
				   	

</body>
</html>
