 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.List"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page import="com.dao.DeptDao"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.entity.department"%>
<style>
 @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');
@font-face {
    font-family: 'Anydore';
    src: url('fonts/anydore.regular.otf') format('truetype');
    /EMSFinal/src/main/webapp/fonts/
}

***{
 font-family: cursive;
  font-style :inherit;
}

.nav-item{
 padding: .2rem 2rem;
 font-size: 20px;
 font-weight: 500;
 }
 .navbar-brand{
 font-size: 20px;
 font-weight: 500;
 }
 
 .navbar {
 position: sticky;
 top: 0;
 left: 0;
 z-index: 100;
 padding: .5rem 5rem;
 box-shadow: 5px 5px 20px rgba(0, 0,0, .5);
background :black;


}
.navbar .navbar-brand
{
    font-size: 35px;
    font-weight: 800;
     color: #2c9e87;
         font-family: 'Anydore';
   
}
#navbarSupportedContent a{
    color: #fff;
     
       font-size: 18px;
    border-bottom: 2px solid transparent;
}
#navbarSupportedContent a:hover{
 
 border-bottom: 2px solid #fff;
}
#navbarSupportedContent button{
 font-family: cursive;
  font-style :inherit;
    background:#2a96e0;
}
   .dropdown-item{
   color:red;
   font-family: cursive;
   background:#de2272;
   }
 .dropdown-menu a:hover{
 
background:purple;
}

 .dropdown-menu a{
 
 font-family: cursive;
  font-style :inherit;
}
 .bg3{
  background-color: #05012c;
 height: 80px;
}
  .d{
 font-family: cursive;
 font-style :inherit;
 text-transform: capitalize;

 
 }
  .d2{
 font-family: cursive;
 font-style :inherit;
 text-transform: capitalize;

 }
 .imag{
 border-radius: 50%;
 width:200px;
 height:200px;
 background-size:cover;
 background-position: center;
  border: 1.5px solid #6852ba;
 }
</style>

        <nav class="navbar navbar-expand-lg navbar-dark bg3">
  <div class="container-fluid">
    <a class="navbar-brand d" href="index.jsp"> <img class ="imag" src="image/dmice.png" style="width: 60px; height: 60px;"> eventalia</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse d2" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="admin_login.jsp"><i class="fa-sharp fa-solid fa-right-to-bracket"> </i>Admin</a>
        </li>
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="department_login.jsp">Department</a>
        </li>
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="student_login.jsp">Student</a>
        </li>
                
      </ul>
    
    </div>
  </div>
</nav>
      
        
       