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
    <style>
    	#map{
    	height:400px;
    	width:100%;
    	}
    </style>
</head>
<body>
<h1>My google map</h1>
	<div style="height:400px; width:300px; background-color:black;" id="map"></div>
	<script>
		function initMap(){
			var options = {
					zoom: 9,
					center:{lat:37.3688, lng:-122.0363}
			};
			
			var map = new google.maps.Map(document.getElementById('map'), options);
		}
	</script>
	FIGURE OUT WHY API IS NOT WORKING????
   <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCw1N55cg-MnhGH7S30f-DsHfvWnd8u_pY&callback=initMap&v=weekly"
      defer
    ></script>
</body>
</html>