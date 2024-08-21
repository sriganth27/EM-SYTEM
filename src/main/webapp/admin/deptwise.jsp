
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
   <%@page import="java.util.List"%>

<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Event_details</title>
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

   color: #e70ca9;
 
    font-family: Spectral;
   letter-spacing: 1px;
   }   
   .btn2{
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
background-color:#fff;
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
 
</style>
</head>
<body class="bg">
				  
<%@include file="navbar.jsp" %>

<br>
 			<div class="project-container">
		   <form action="deptwise.jsp" method="post">
              <div align="center">
              <div class="col-md-4 ">
              <div class="input-group">
			   <input type="text" name="Search1" class="form-control" placeholder="Enter Dept_name OR Event_catrgory "> 
			  
			   
			  <div class="input-group-btn">
			  <button type="submit" value="Search" class="btn2 btn-primary"><i class="fa-solid fa-magnifying-glass"></i>Search</button>
			  </div>
			  </div>
              </div>
              </div>
<br>
             <div id="tblCustomers">
       <div align="center">
       <div class="col-md-11 " >
        
     
<%
         boolean eventsExist = false;
        if(request.getParameter("Search1")==null){%>
        
        <div class="tab"></div>
       <table  class="table table-striped table-bordered tab">
			   
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
			     
			    </tr>
			    </thead>
			    
			    <%
			 
			    try {
			    	String s1 = request.getParameter("Search1");
			    	
					Class.forName("com.mysql.cj.jdbc.Driver");
		            Connection conn =DriverManager.getConnection( "jdbc:mysql://localhost:3306/ems?characterEncoding=utf8","root","srivkp@2003");
		            String sql = "select * from event_details  where dept_name  like'%"+s1+"%' || event_category  like'%"+s1+"%' ";
		            	
		    		
		    		PreparedStatement ps = conn.prepareStatement(sql);
		    		
		    		int serialNumber = 1;
		    		ResultSet rs = ps.executeQuery();
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
        <div align="center">
            <div class="input-group-btn">
			 	      <% if(eventsExist) { %>
                    <div class="input-group-btn">
                        <button class="buttons btn-hover color-7" type="submit" value="Search" class="btn btn-warning" id="btnExport" onclick="Export()">GENERATE</button>
                    </div>
                <% }  %>
			  </div>
			  </div>   
			  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
 <script type="text/javascript">
     function Export() {
         html2canvas(document.getElementById('tblCustomers'), {
             onrendered: function (canvas) {
                 var data = canvas.toDataURL();
                 var docDefinition = {
                     content: [{
                         image: data,
                         width: 500
                     }]
                 };
                 pdfMake.createPdf(docDefinition).download("event_details.pdf");
             }
         });
     }
 </script>
 </div>	
</body>


</html>