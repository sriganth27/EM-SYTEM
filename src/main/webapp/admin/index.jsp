<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index page</title>
<%@include file="../component/allcss.jsp" %>
</head>
<body>
 <%@include file="navbar.jsp"%>
 
        <c:if test="${not empty sucMsg}">
				      <P class="text-center text-danger fs-3">${sucMsg}</P>
				      <c:remove var="sucMsg" scope="session"/>
				   </c:if>
				   
				   <c:if test="${not empty errorMsg}">
				      <P class="text-center text-info fs-3">${errorMsg}</P>
				      <c:remove var="errorMsg" scope="session"/>
				   </c:if>
</body>
</html>