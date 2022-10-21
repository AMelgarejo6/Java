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
        		<a href="/home"><img style="height:50px;" src="athlead.png" alt="Athlead photo" /></a>
   			</div>
       		 <div style="margin-right: 50px;">
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
    <div style="height:360px; display:flex; flex-direction:column; align-items:center">
    	<img style="height:350px; width: 100%; object-fit:fill" src="homepage-collage.webp" alt="Homepage Collage" />
    </div>
    <div style="display:flex; justify-content:center; flex-direction:column; align-items:center;">
	<table class="table" style="border: 2px solid black; width:70%;">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Title</th>
      <th scope="col">Location</th>
      <th scope="col">Date</th>
      <th scope="col">Posted By</th>
      <th scope="col">Actions</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach items="${allMeets }" var="meet">
         <tr>
         	<th>${meet.id }</th>
         	<th><a href="/meet/${meet.id }">${meet.title }</a></th>
         	<th>${meet.location }</th>
         	<th>${meet.dateofMeet}</th>
         	<th>${meet.creator.userName}</th>
         	<c:if test="${meet.attendees.contains(thisLoggedUser) eq false}">
	         	<th><a class="btn btn-primary" href="/rsvp/${meet.id }">RSVP</a></th>
         	</c:if>
         	<c:if test="${meet.attendees.contains(thisLoggedUser)}">
         		<th><p>RSVP'd!</p>
         	</c:if>
         </tr>
      </c:forEach>
  </tbody>
</table>
   <a class="btn btn-primary" href="/newmeet">Plan your next meeting, ${thisLoggedUser.userName }!</a>
   <div style="height:400px; width:70%; background-color:black; margin-top:20px;" id="map"></div>
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