
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
   <%@page import="java.util.List"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.entity.*"%>
<%@page import="com.dao.*"%>
<%@page import="com.admin.servlet.*"%>
<%@page import="com.dept.servlet.*"%>
<%@ page import="java.util.*" %>

<%@page import="java.sql.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Event_details</title>
<%@include file="allcss.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style type="text/css">


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
   


        .fa2{
   text-transform:uppercase;
      font-size: 30px;
  color:  #df2387;
  letter-spacing: 1px;
 font-family:  Calendas Plus;
  text-shadow: 0px 1px 0px #ccc;
               
   }   
   .btn4{
   display : inline-block;
   text-decoration:none;
   border:1px solid #fff;
   padding : 5px 15px;
   position:relative;
  color:#fff;
  background: linear-gradient(to right , #5543ca , #00BCD4);
  
    font-size: 17px;
   font-weight: 600;
   cursor: pointer;
   
   }
   
   
   .btn :hover{
   border:1px solid #f44336;
    transition : 1s;
    background: #f44336;
   }
.tab{
 background:#fff;
 border:50px;
 border-color:orange ;
   font-family:  Calendas Plus;
 
}
.hd{
background:pink ;
text-transform: capitalize;
}

.bg{
  background-image: url(../icons/sri5.gif);
height:100vh;
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
  filter: blur(230px);
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
.btn1 {
            background-image: linear-gradient(to right, #FF512F 0%, #F09819  51%, #FF512F  100%);
            margin: 10px;
            padding: 15px 45px;
            text-align: center;
            text-transform: uppercase;
            transition: 0.5s;
            background-size: 200% auto;
            color: white;            
            box-shadow: 0 0 20px #eee;
            border-radius: 10px;
            display: block;
          }

          .btn1:hover {
            background-position: right center; /* change the direction of the change here */
            color: #fff;
            text-decoration: none;
          }
               
         .btn2 {
            background-image: linear-gradient(to right, #DA22FF 0%, #9733EE  51%, #DA22FF  100%);
            margin: 10px;
            padding: 15px 45px;
            text-align: center;
            text-transform: uppercase;
            transition: 0.5s;
            background-size: 200% auto;
            color: white;            
            box-shadow: 0 0 20px #eee;
            border-radius: 10px;
            display: block;
          }

          .btn2:hover {
            background-position: right center; /* change the direction of the change here */
            color: #fff;
            text-decoration: none;
          }
         

             
         .btn3 {
            background-image: linear-gradient(to right, #02AAB0 0%, #00CDAC  51%, #02AAB0  100%);
            margin: 10px;
            padding: 15px 45px;
            text-align: center;
            text-transform: uppercase;
            transition: 0.5s;
            background-size: 200% auto;
            color: white;            
            box-shadow: 0 0 20px #eee;
            border-radius: 10px;
            display: block;
          }

          .btn3:hover {
            background-position: right center; /* change the direction of the change here */
            color: #fff;
            text-decoration: none;
          }
               #tblCustomers{
      padding-left: 30px;
      padding-right: 30px;
      }   
</style>
</head>
<body class="bg">
				  
<%@include file="navbar.jsp" %>
<div class="contact-container">

<br>
 				 <script>
    document.addEventListener('DOMContentLoaded', function () {
        // Select all delete links with class 'delete-link'
        const deleteLinks = document.querySelectorAll('.delete-link');

        deleteLinks.forEach(link => {
            link.addEventListener('click', function (event) {
                event.preventDefault();
                const url = this.getAttribute('href');

                // Show SweetAlert confirmation dialog
                Swal.fire({
                    title: 'Are you sure?',
                    text: 'You won\'t be able to revert this!',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        // If confirmed, redirect to the deletion URL
                        window.location.href = url;
                    }
                });
            });
        });
    });
</script>
              	
		   <form action="datewise.jsp" method="post">
              <div align="center">
              <div class="col-sm-4 ">
              <div class="input-group">
			   <input type="text" name="Search1" class="form-control" placeholder="YYYY-MM-DD"> 
			   <input type="text" name="Search2" class="form-control" placeholder="YYYY-MM-DD"> 
			   
			  <div class="input-group-btn">
			  <button type="submit" value="Search" class="btn4 btn-primary"><i class="fa-solid fa-magnifying-glass"></i>Search</button>
			  </div>
			  </div>
              </div>
              </div>
             
           
           

<%
  department user = (department) session.getAttribute("deptObj");

  int id = user.getId();


%>             

             
                
				      
<br>
             <div id="tblCustomers">
       <div align="center">
       <div class="col-md-12 " >
       

<%
boolean eventsExist = false;
        if(request.getParameter("Search1")==null){%>
        <div class="tab"></div>
       <table  class="table table-striped table-bordered tab">
			  
			    

			  </tbody>
</table>

<%}
else{%>
       
             <p class="fa2 fs-3 text-center">Event details</p>
	     <table  class="table table-striped table-bordered tab">
			    <thead class="hd">
			     <tr class="warning">
			        <th scope="col">S.NO</th>
			      	<th scope="col">Dept Name</th>
			     	<th scope="col">Event Category</th>
			     	<th scope="col">Event date</th>
			     	<th scope="col">Event Topic</th>
			     	<th scope="col">RPName</th>
			     	<th scope="col">RPDeatils</th>
			     	<th scope="col">Broucher</th>
			     	<th scope="col">Image1</th>
			     	<th scope="col">Image2</th>
			     	<th scope="col">Description</th>
			     	<th scope="col">Action</th>
			    </tr>
			    </thead>
			    
			    <%
			    try {
			    	String s1 = request.getParameter("Search1");
			    	String s2 = request.getParameter("Search2");
					Class.forName("com.mysql.cj.jdbc.Driver");
		            Connection conn =DriverManager.getConnection( "jdbc:mysql://localhost:3306/ems?characterEncoding=utf8","root","srivkp@2003");
		        
		            	
		            String sql = "SELECT * FROM event_details WHERE event_date BETWEEN '" + s1 + "' AND '" + s2 + "' AND dept_id  like'%"+id+"%' order by id desc";

		    		PreparedStatement ps = conn.prepareStatement(sql);
		    		
		    		
		    		ResultSet rs = ps.executeQuery();
		    		int serialNumber = 1;
		    		while(rs.next())
		    		{
		    			eventsExist = true;
		    		%>
		    			<tr>
		    		 <td><%=serialNumber++%></td>
		    		    <td><%=rs.getString("dept_name")%></td>
		    			<td><%=rs.getString("event_category")%></td> 
		    			<td><%=rs.getString("event_date")%></td> 
		    		    <td><%=rs.getString("event_topic")%></td> 
		    			<td><%=rs.getString("event_time")%></td> 
		    			<td><%=rs.getString("resource_person_details")%></td> 
		    		    <td><img src=../addevent?id=<%=rs.getInt("id")%> alt="image not found" width="100px" height="100px"></td> 
		    		    <td><img src=../addImage?id=<%=rs.getInt("id")%> alt="image not found" width="100px" height="100px"></td> 
		    			<td><img src=../addPhoto?id=<%=rs.getInt("id")%> alt="image not found" width="100px" height="100px"></td> 
		    			<td><%=rs.getString("description")%></td>
		    			 <td><a href="edit_event.jsp?id=<%=rs.getInt("id")%>" class=" btn btn-sm btn1">Edit</a>
					    
					         <a href="../deleteEvent?id=<%=rs.getInt("id")%>" class=" btn btn-sm btn2 delete-link">Delete</a>
					          <a href="view_report.jsp?id=<%=rs.getInt("id")%>" class=" btn btn-sm btn3">Report</a>
			                
			           </td>
					    
		    			 	
		    			</tr>
		    			
		    		<%}
		            
				}
				catch(Exception ae) {
					ae.printStackTrace();
				}
			    %>
			  </tbody>
</table>

<%} %>
</div>
</div>
 </div>         
</form> 
<br> 
</div>
</body>


</html>