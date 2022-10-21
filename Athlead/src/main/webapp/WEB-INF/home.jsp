<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tacos</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/mainpage.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
   <nav style="padding-left:40px" class="navbar navbar-expand-lg">
   		<div class="d-flex flex-row align-items-center justify-content-between" style="height:60px; width:100%">
   			<div style="height:100%; width:400px;">
        		<a href="/home"><img style="height:50px;" src="athlead.png" alt="Athlead photo" /></a>
   			</div>
       		 <div style="margin-right: 50px">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/meets">Browse Meets</a>
                </li>

			<c:if test="${empty sessionScope.logged_id}">
				<li class="nav-item">
                    <a class="nav-link btn btn-primary" style="border-radius:50px; color:white;" href="/">Login</a>
                </li>
			</c:if>
			<c:if test="${!empty sessionScope.logged_id}">
				<li class="nav-item">
                    <a class="nav-link btn btn-danger" style="border-radius:50px; color:white;" href="/logout">Logout</a>
                </li>
			</c:if>
			</ul>
        </div>
        </div>
    </nav>
    <p>logged id= ${logged_id }</p>
    <div class="storediv">
    	<div class="topstorediv">
	    	<h1 style="color:#4454FE; font-weight:900" >GET CONNECTED WITH MEETUPS IN YOUR AREA</h1>
    	</div>
    	<div class="bottomstorediv">
    		<img class="storeimg" src="appstore.svg" alt="AppStore pic" />
    		<img class="storeimg" src="googlestore.svg" alt="GoogleStore pic" />
    	</div>
    </div>
    <div style="height:600px; display:flex; flex-direction:column; align-items:center">
    	<a style="margin-bottom:30px ; width:150px; border:2px solid black; font-weight:700; border-radius:20px" class="btn btn-warning" href="/meets">Find your next meet!</a>
    	<img style="height:550px; width: 100%; object-fit:fill" src="homepage-collage.webp" alt="Homepage Collage" />
    </div>
    
</body>
</html>