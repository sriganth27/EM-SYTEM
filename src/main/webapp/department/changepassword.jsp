<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Password change</title>

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
  background-image: url(../icons/sri.gif);
height: 100vh;
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

}

.contact-container::before {
  bottom:0rem;
  right: 0rem;
  background: #6f069c;
  
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
font-size:20px;
 text-transform: capitalize;
} 
.fs-3 {
         font-family: Spectral;
 } 
   .as input{
  width: 100%;
  height: 40px;
font-size:20px;
 
 
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
	 
	 <div class = "container p-5 contact-container">
	<div class = "row">
		<div class = "col-md-4 offset-md-4">
		
				   <p class="fa2  text-center">Change Password</p>
				   
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
				   	<form action="../changePassword" method="post">
						<div class ="mb-3">
							<label class="form-label">Your Old Password</label>
							<input required 
							name="Oldpassword" type="text" class="form-control" value="${deptObj.password }">
						</div>	
						
						<div class ="mb-3">
							<label class="form-label">Enter New Password</label>
							<input required 
							 name="Newpassword" type="password" class="form-control">
						</div>	
						<div align="center">
						<input type="hidden" value="${deptObj.id }" name="uid">	
						<button  class="buttons btn-hover color-7">SUBMIT</button>
						</div>	   			   	
				   	</form>
				   	</div>
				   	<div>
				   	
				</div>
			</div>
      </div>
   </div>
</div>

</body>
</html>