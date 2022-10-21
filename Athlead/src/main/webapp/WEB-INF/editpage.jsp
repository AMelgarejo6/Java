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
   <div class="mx-auto h-50 d-flex flex-column justify-content-center align-items-center" style="width:500px">
   <h1>Edit Meet</h1>
<form:form action="/meet/${myMeet.id}" method="put" modelAttribute="myMeet">
	<form:hidden path="creator"/>
	<form:hidden path="attendees"/>
	<form:errors path="*"/>
	<p>
        <form:label path="title">Title:</form:label>
        <form:input path="title"/>
    </p>
	
    <p>
        <form:label path="meetingdesc">What is happening at your meet:</form:label>
        <%-- <form:errors path="language"/> --%>
        <form:input path="meetingdesc"/>
    </p>
    <p>
        <form:label path="location">Location:</form:label>
        <%-- <form:errors path="language"/> --%>
        <form:input path="location"/>
    </p>
    <p>
        <form:label path="dateofMeet">Date of Meet:</form:label>
        <%-- <form:errors path="language"/> --%>
        <form:input type="date" path="dateofMeet"/>
    </p>
    <a href="/meets" class="btn btn-warning">Cancel</a>
    <input class="btn btn-primary" type="submit" value="Submit"/>
</form:form>
</div>
</body>
</html>