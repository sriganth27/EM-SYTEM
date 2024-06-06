<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feed back results</title>
<%@include file="../department/allcss.jsp" %>
 <style>
.bg{

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
 
        .card {
            max-width: 400px;
           height:200px;
            margin: auto;
            border-radius: 10px;
            border-top-color : fuchsia;
            border-top-width:30px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
                
 box-shadow: 0 20px 40px rgb(0,0,0);
 text-align: center;


   } 
        }
        .card-body.h1 {
            padding: 20px;
            color: #fff;
            
        }
        h1 {
            text-align: center;
        }
        .message {
            font-size: 18px;
            margin-bottom: 20px;
            text-align: center;
        }
        .database-info {
            font-size: 14px;
            margin-top: 30px;
            text-align: center;
        }
    </style>
</head>
<body class="bg">
<%@include file="navbar.jsp" %>
<div class="project-container">
  <div class="container">
  <br> <br> <br> <br> <br> <br>
        <div class="card">
            <div class="card-body">
                <h2 class="card-title">ThankYou!</h2>
              
                <div class="database-info">
                    <p>Your response has been recorded.</p>
                </div>
            </div>
        </div>
    </div>
    </div>
</body>
</html>