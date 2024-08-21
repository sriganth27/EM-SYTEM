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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
 
   text-transform:capitalize;

   color: #fff;
 
    font-family: Spectral;
   letter-spacing: 1px;
   
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
   
 .bg{
  background-image: url(../icons/sri5.gif);
height:100vh;
 background-position:center;
background-size: cover;

}
.project-container::after,
.project-container::before {
  content: "";
  width: 28.125rem;
  height: 28.125rem;
  border-radius: 20.125rem;

background: #1c03ac;
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
  background:#1c03ac;

} 


 .mb-3 input{
  width: 100%;
  height: 40px;
  border: none;
  background:#efefef ;
 
     font-family:  Calendas Plus;
  }
.fs-3 {
         font-family: Spectral;
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
        
        <div class="back">
          <div class="">
            <form action="../deptregister" method="post">
              <div class="as mb-3">
                <label class="form-label">Full Name*</label>
                <input type="text" required name="fullname" class="form-control">
              </div>
              
              <div class="as mb-3">
                <label class="form-label">Email*</label>
                <input type="email" required name="email" class="form-control">
              </div>
              
              <div class="as mb-3">
                <label class="form-label">Password*</label>
                <input type="password" required name="password" class="form-control">
              </div>
              
              <div align="center">
                <button class="buttons btn-hover color-7" type="submit" class="btn">SUBMIT</button>
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
