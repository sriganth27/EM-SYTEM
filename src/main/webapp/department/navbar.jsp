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
    font-size: 25px;
    font-weight: 800;
     color:#07be87;
         font-family: cursive;
  font-style :inherit;
   
}
#navbarSupportedContent a{
    color: #fff;
    border-bottom: 2px solid transparent;
}
#navbarSupportedContent a:hover{
 
 border-bottom: 2px solid #fff;
}
#navbarSupportedContent button{
     background-color: teal;
}
 .dropdown-item{
       background-color: fuchsia;
        font-family: cursive;
   }
 
 .dropdown-menu a:hover{

background:purple;
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
    <a class="navbar-brand d" href="addEvent.jsp"> <img class="imag"src="../image/dmice.png" style="width: 60px; height: 60px;"> Eventalia</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
     
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0 d2">
               <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="addEvent.jsp">Add Event</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="view_event.jsp">View Event</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="view_feedback.jsp">View Feedback</a>
        </li>
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Search Event
          </a>
           <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
         
            <li><a class="dropdown-item" href="datewise.jsp">Date Wise</a></li>
              <li><a class="dropdown-item" href="Search.jsp">Event Category Wise</a></li>
           
           
          </ul>
        </li>
         </ul> 
    
         <form >         
      <div class="dropdown">
  		<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton1" 
  		data-bs-toggle="dropdown" aria-expanded="false">
    			<i class="fas fa-user-circle"></i>
 		 </button>
  
         <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
          <li><a class="dropdown-item" href="changepassword.jsp">changepassword</a></li>
        <li><a class="dropdown-item" href="../deptLogout">Logout</a></li>
        
        </ul>
    </div>
          
    </form> 
        
    
    </div>
  </div>
</nav>
  
