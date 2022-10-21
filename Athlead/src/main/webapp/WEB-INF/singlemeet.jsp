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
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<nav style="padding-left:40px" class="navbar navbar-expand-lg">
   		<div class="d-flex flex-row align-items-center justify-content-between" style="height:60px; width:100%">
   			<div style="height:100%; width:400px;">
        		<h4>Hello, ${logged_name }</h4>
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
   <div class="p-5 d-flex w-80 flex-column" style="height:700px">
   	<div class="d-flex flex-column justify-content-left">
	   	<h1>${myMeet.title } </h1>
	   	<h4>(added by ${myMeet.creator.userName })</h4>
	   	<hr />
   	</div>
   	<div class="d-flex flex-column w-70">
   	<h3>Date: ${myMeet.dateofMeet}</h3>
   	<h4>Location: ${myMeet.location }</h4>
   	<c:if test="${myMeet.attendees.contains(thisLoggedUser) }">
   		<h4 style="color:purple;">You are RSVP'd for this meet.</h4>
   	</c:if>
   	
   	<br />
   	<br />
   	<br />
   	<p style="font-style:italic">Description: ${myMeet.meetingdesc }</p>
   		
   		<c:if test="${logged_id eq myMeet.creator.id}">
   		<div style="width:250px" class="d-flex flex-row justify-content-around">
   			<form action="/meet/${myMeet.id}" method="post">
    				<input type="hidden" name="_method" value="delete">
    				<input class="btn btn-danger" type="submit" value="Delete">
			</form>
   			<a href="/meet/edit/${myMeet.id }" class="btn btn-warning" style="width:60px">Edit</a>
   			<a href="/meets" class="btn btn-warning" style="border:2px solid black">All meets</a>
   		</div>
   		</c:if>
   		<c:if test="${logged_id ne myMeet.creator.id }">
   		<div style="width:100px">
   			<a href="/meets" class="btn btn-primary" style="border:2px solid black">Home</a>
   		</div>
   		</c:if>
   		<br>
   		<div>
   			<h4>See who's attending!</h4>
   			<ul>
   				<c:forEach items="${myMeet.attendees}" var="attendee">
   					<li>${attendee.userName }</li>
   				</c:forEach>
   			</ul>
   		</div>
   		
   		</div>
   		<div style="height:600px; width:500px; background-color:black;" id="map"></div>
   		
   	</div>
   	<script>
		function initMap(){
			var options = {
					zoom: 9,
					center:{lat:37.3688, lng:-122.0363}
			};
			
			var map = new google.maps.Map(document.getElementById('map'), options);
			
			var marker = new google.maps.Marker({
				position:{lat:37.3835417, lng:-122.013194},
				map:map
			});
			
		}
	</script>
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCw1N55cg-MnhGH7S30f-DsHfvWnd8u_pY&callback=initMap&v=weekly"
      defer
    ></script>
</body>
</html>