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
    font-size: 35px;
    font-weight: 800;
     color: #2c9e87;
         font-family: 'Anydore';
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
    <a class="navbar-brand d" href="view_event.jsp"> <img class="imag" src="../image/dmice.png" style="width: 60px; height: 60px;"> eventalia</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0 d2">
     
           <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="view_event.jsp">Home</a>
        </li>
        <div class="dropdown">
   <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            View
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
        
            <li><a class="dropdown-item" href="view_department.jsp">View Department</a></li>
             
            <li><a class="dropdown-item" href="viewstudent.jsp">View student</a></li>
           
          </ul>
        </li>
        </div>
        <div class="dropdown">
   <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Add
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="addDept.jsp">Add Department</a></li>
         
             <li><a class="dropdown-item" href="addStudent.jsp">Add student </a></li>
           
           
          </ul>
        </li>
        </div>
          <div class="dropdown">
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Search Event
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="deptwise.jsp">Search</a></li>
            <li><a class="dropdown-item" href="datewise.jsp">Date Wise</a></li>
           
          </ul>
        </li>
        </div>
        </ul>
        <form>
      <div class="dropdown">
  		<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton1" 
  		data-bs-toggle="dropdown" aria-expanded="false">
    		Admin
 		 </button>
  
         <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
        <li><a class="dropdown-item" href="../adminLogout">Logout</a></li>
        
  </ul>
    </div>
    </form>
       </div>
     </div>
</nav>