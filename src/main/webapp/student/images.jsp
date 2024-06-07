<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@page import="java.util.List"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="java.sql.*"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.entity.*"%>
<%@page import="com.dao.*"%>
<%@page import="com.admin.servlet.*"%>
<%@page import="com.dept.servlet.*"%>
<%@page import="com.student.servlet.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gallery</title>
<%@include file="../department/allcss.jsp" %>
<style type="text/css">

/* Apply padding to the left and right of the images */

/* Apply margin to each image to create space between them */
img:first-child {
    margin-right: 15px;
    margin-top: 15px;
     /* Add space to the right of the first image */
}

img:not(:first-child) {
    margin-left: 15px;
     margin-top: 15px; /* Add space to the left of all images except the first one */
}

body {
  margin: 0;
  padding: 0;
  height: 100vh; /* Make sure the body covers the entire viewport height */
  background-size: cover; /* Ensure the background covers the entire body */
  background-position: center; /* Center the background */
  background-color: #05012c;
  @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');
}

.project-container::after,
.project-container::before {
  content: "";
  width: 28.125rem;
  height: 28.125rem;
  border-radius: 20.125rem;
  background: #150364;
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
  background: #6f069c;
}    

/* Set fixed size for all images */
img.event-img {
  width: 350px;
  height: 350px;
  object-fit: cover; /* Ensure image covers the area */
  cursor: pointer; /* Make images clickable */
  padding: 15px; /* Add padding around images */
  box-sizing: border-box; /* Include padding in the width and height */
}

/* Modal styles */
.modal {
  display: none; 
  position: fixed; 
  z-index: 100; 
  left: 0;
  top: 0;
  width: 100%; 
  height: 100%; 
  overflow: auto; 
  background-color: rgba(0, 0, 0, 0.9); 
  justify-content: center; /* Center horizontally */
  align-items: center; /* Center vertically */
}

.modal-content {
  max-width: 90%; /* Adjust to fit within viewport */
  max-height: 90%; /* Adjust to fit within viewport */
  width: auto; /* Maintain aspect ratio */
  height: auto; /* Maintain aspect ratio */
  padding: 20px;
  box-sizing: border-box;
}

.close {
  position: absolute;
  top: 15px;
  right: 35px;
  color: #fff;
  font-size: 40px;
  font-weight: bold;
  transition: 0.3s;
  cursor: pointer;
}

.close:hover,
.close:focus {
  color: #bbb;
  text-decoration: none;
  cursor: pointer;
}

.modal-content, #caption {
  animation-name: zoom;
  animation-duration: 0.6s;
}

@keyframes zoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px; /* Adjust based on arrow size */
  color: #fff;
  font-weight: bold;
  font-size: 20px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
  text-decoration: none; /* Remove underline */
}

.next {
  right: 10px; /* Adjust to avoid the modal padding */
  border-radius: 3px 0 0 3px;
}

.prev {
  left: 10px; /* Adjust to avoid the modal padding */
}

.prev:hover, .next:hover {
  background-color: rgba(0, 0, 0, 0.8);
} 
</style>
</head>
<body class="bg">
<%@include file="navbar.jsp" %>
<%
   Date today = new Date();
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
   String formattedDate = sdf.format(today);
%>
<br>
<div class="project-container">
<br>
<%
    boolean eventsExist = false;
    try {
        String s1 = request.getParameter("Search1");
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems?characterEncoding=utf8", "root", "srivkp@2003");
        student user = (student) session.getAttribute("studObj");
        String deptName = user.getFullname();
        String sql = "SELECT * FROM event_details WHERE dept_name LIKE '%" + deptName + "%' ORDER BY id DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        int serialNumber = 1;
        while (rs.next()) {
            eventsExist = true;
%>
        <img src="../addImage?id=<%=rs.getInt("id")%>" alt="image not found" class="event-img" data-id="<%=rs.getInt("id")%>" data-index="<%=serialNumber%>">
        <img src="../addPhoto?id=<%=rs.getInt("id")%>" alt="image not found" class="event-img" data-id="<%=rs.getInt("id")%>" data-index="<%=serialNumber + 1%>">
<%
            serialNumber += 2;
        }
    } catch (Exception ae) {
        ae.printStackTrace();
    }
%>
</div>

<!-- Modal for displaying full-screen images -->
<div id="myModal" class="modal">
  <span class="close">&times;</span>
  <img class="modal-content" id="modalImage">
  <div class="caption-container">
    <p id="caption"></p>
  </div>
  <a class="prev">&#10094;</a>
  <a class="next">&#10095;</a>
</div>

<script>
document.addEventListener("DOMContentLoaded", function() {
    var modal = document.getElementById("myModal");
    var modalImg = document.getElementById("modalImage");
    var captionText = document.getElementById("caption");
    var images = document.getElementsByClassName("event-img");
    var currentIndex = 0;

    function showImage(index) {
        modalImg.src = images[index].src;
        captionText.innerHTML = images[index].alt;
        currentIndex = index;
    }

    for (var i = 0; i < images.length; i++) {
        images[i].onclick = function() {
            modal.style.display = "flex"; /* Use flex to center modal content */
            var index = parseInt(this.getAttribute("data-index")) - 1;
            showImage(index);
        }
    }

    var span = document.getElementsByClassName("close")[0];
    span.onclick = function() {
        modal.style.display = "none";
    }

    var next = document.getElementsByClassName("next")[0];
    next.onclick = function() {
        currentIndex = (currentIndex + 1) % images.length;
        showImage(currentIndex);
    }

    var prev = document.getElementsByClassName("prev")[0];
    prev.onclick = function() {
        currentIndex = (currentIndex - 1 + images.length) % images.length;
        showImage(currentIndex);
    }
});
</script>

</body>
</html>
