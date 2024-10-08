<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@page import="java.util.List"%>

<%@page import="com.db.DBconnect"%>
<%@page import="com.entity.*"%>
<%@page import="com.dao.*"%>
<%@page import="com.admin.servlet.*"%>
<%@page import="com.dept.servlet.*"%>

  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Report Generation </title>
<%@include file="allcss.jsp" %>
 <style type="text/css">
  
   
.rtext{
font-family: 'Times New Roman' , serif;
 text-transform: capitalize;
 font-size: 17px;
 justify-content: center;
 }
.ptext1{
text-align: left;
}

.ptext2{
text-align: right;

}
.fa2{
text-transform: uppercase;
font-family: 'Times New Roman' , serif;
font-weight: bold;
}
.buttons {
    margin: 10%;
    text-align: center;
}

.btn-hover {
    width: 150px;
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
   
 .rep{
 padding: 15px 15px 15px 15px;
 background-color: #fff;
 text-align: justify;


 }
 
 .bg{
 background-color: buttonface;

 }

 </style>
</head>
<body class="bg">
 <%@include file="navbar.jsp"%>
 <c:if test="${empty deptObj }">
	<c:redirect url="../department_login.jsp" ></c:redirect> 
 </c:if>
 		
   <div class="  container-fluid p-3">
    <div class="row">
	<div align="center">
          <div class=" col-md-7 " >
              <div class = "rep">
            <%
				   int id = Integer.parseInt(request.getParameter("id"));
				   EventDao dao2= new EventDao(DBconnect.getConn());
				   event d = dao2.getEventById(id);
				   %>
			
		
			       <div id="invoice">
			        
				                           <p class="text-center fa2">
						                   	 <img src="../image/dmi.jpeg" align="left" style="width: 120px; height: 120px;">
						                                dmi college of engineering <br>
						                                department of <%=d.getDeptname()%><br>
						                                organizes <%=d.getEventCategory()%> <br>
						                                on 
						                                <br> <%=d.getEventTopic()%>
						                                
						 </p>
						
				 
				  
				   <br>
				  
			
				       
				   <div class="rtext"><span style="font-weight: bold;">Event Date : </span>
				   <%=d.getEventDate()%>
				   </div>
				   <div class="rtext"><span style="font-weight: bold;"> Resource person name </span>
					  <%=d.getResourcePersonName()%></div>
				   
				   	  
				   <div>
				   <div class="rtext"><span style="font-weight: bold;"> Resource person details : </span>
					  <%=d.getResourcedPersonDetails()%></div>
				   
				   	 <br>
				   	 <br>
				   <div align="center">
				   <img src=../addevent?id=<%=d.getId()%> alt="image not found" width="300px" height="250px">
				   </div>
				 
				  <br>
				   
				   
				   <div align="center">
				 <img src=../addImage?id=<%=d.getId()%> alt="image not found" width="300px" height="250px">
				<img src=../addPhoto?id=<%=d.getId()%> alt="image not found" width="300px" height="250px">
				   </div>
				   <div></div>
					  
					   
					   <br>
					   <br>
					    <br>
					   <br>
					   
					 <div class="rtext"><span style="font-weight: bold;">  Description : </span><%=d.getDescription()%></div>
					
				
					</div>
				</div>
				</div>	
			</div>
			</div>
		</div></div>
			
                  <div align="center">
            <div class="input-group-btn">
			    <button class="buttons btn-hover color-7" type="submit" value="Search" class="btn btn-warning" id="download" >GENERATE</button>
			    
			    
			  </div>
			  </div>
			   <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
			  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
              <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
              <script type="text/javascript">
             window.onload = function () {
             document.getElementById("download")
             .addEventListener("click", () => {
              const invoice = this.document.getElementById("invoice");
              console.log(invoice);
              console.log(window);
              var opt = {
                margin: 1,
                filename: 'Event_report.pdf',
                image: { type: 'jpeg', quality: 0.98 },
                html2canvas: { scale: 2 },
                jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
            };
            html2pdf().from(invoice).set(opt).save();
        })
}
 </script>      
	
	
       
   
   
</body>
</html>