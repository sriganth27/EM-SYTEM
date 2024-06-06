<%@page import="com.db.DBconnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index Page</title>
 <%@include file="component/allcss.jsp" %>
 <style>

.bg{
    background-color: #05012c;
}
.project-container {
    position: relative;
    margin: 0 0;
}
.project-container::after,
.project-container::before {
    content: "";
    width: 28.125rem;
    height: 28.125rem;
    border-radius: 20.125rem;
    background: #150364;
    position: absolute;
    z-index: -1;
    filter: blur(200px);
}
.project-container::after {
    top: -3rem;
    left: -5rem;
}
.project-container::before {
    bottom: 0rem;
    right: 0rem;
    background: #6f069c;
}


.hero {
    
    
    background-color:#0d0145;
    
    background-size: 100% 300px;
    background-position: 0% 100%;
    padding: 2rem;
    text-align: center;
}


.hero h1 {
    font-size: 4rem;
    margin-bottom: 0.5rem;

      font-family:  Calendas Plus;
     
 color:#FF00BF;
}
.hero p {
    font-size: 1.2rem;
    color: #ccc;
        font-family:  Calendas Plus;
}
.hero button {
       font-size: 1.3rem;
    font-weight: 500;
    color: #fff;
    border-radius: 0.6rem;
    border: 1.5px solid #032455;
background:#008B8B;
    padding: 0.7rem;
    transition: all 0.3s ease;
    cursor: pointer;
    font-family:  Calendas Plus;
}
.hero button:hover {
       color: #d2c1dc;
    background: transparent;
    background-color: #000000;
    border: 1.5px solid #8e0793;
}
footer {
    background-color: #05012c;
      color: #c90d81;
      font-family:  Calendas Plus;
    padding: 0.5rem;
    text-align: center;
    clear: both;
    display: flex;
    flex-direction: unset;
    align-items: center;
    justify-content: center;
    margin-bottom: 0px;
    font-size: 20px;
   
}
.footer-content {
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 80%;
}
.footer-content p {
    margin: 0;
}
.footer-content a {
    color: #fff;
    text-decoration: none;
    margin: 0 10px;
}
.footer-content a:hover {
     background: linear-gradient(90deg, #a993fe 0%, #7e61e7 100%);
}

.tech-icon2 img {
    width: 2rem;
    height: 2rem;
    transition: all 0.3s ease;
    border-radius: 0.65rem;
    border-style: solid;
  }

  .tech-icon2 .image-container {
    display: inline-block;
    transition: background-color 0.3s ease;
    border-radius: 0.65rem;
  }

 </style>
</head>
<body class="bg">
    <%@include file="component/navbar.jsp" %>
    <div class="project-container">
        <img src="img/Screenshot (205).png" class="d-block w-100" alt="..." height="250px">
        <section class="hero">
         
            <h1>Welcome to our Event Management System</h1>
            <p>Designed to streamline and enhance the event process within our college.</p>
            <button class="btn">Explore Events</button>
        </section>
        
         <img src="img/Screenshot (209).png" class="d-block w-100"  alt="..." height="200px">
    </div>
    <footer>
        <div class="footer-content">
            <p>&copy; 2024 Event Management System </a></p>
            <div class="tech-icon2">
             <div class='image-container'>
                <a href="https://www.facebook.com/profile.php?id=100063820549223" target="_blank">
                    <img src="icons/facebook.png" alt="Facebook">
                </a>
                </div>
                
                 <div class='image-container'>
                <a href="https://dmice.ac.in/#" target="_blank">
                    <img src="icons/twitter.png" alt="Twitter">
                </a>
                </div>
                
                 <div class='image-container'>
                <a href="https://instagram.com" target="_blank">
                    <img src="icons/instagram.png" alt="Instagram">
                </a>
                </div>
                
                 <div class='image-container'>
                <a href="https://dmice.ac.in/#" target="_blank">
                    <img src="icons/linkedin-icon.png" alt="LinkedIn">
                </a>
                </div>
                
            
                
              </div>
            </div>
        </div>
    </footer>
</body>
</html>
