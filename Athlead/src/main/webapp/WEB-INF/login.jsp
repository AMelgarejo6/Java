<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Athlead Login</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="d-flex flex-row">
		<div>
			<img class="loginimage" src="loginimage.png" alt="Tennis Photo" />
		</div>
		<div id="rightdiv">
			<div>
				<form:form action="/register" method="post" modelAttribute="newUser">
					<h1 style="color: black">Create a User!</h1>
					<hr />
					<form:errors path="*" />
					<p>
						<form:label style="display:block" path="userName">User Name</form:label>
						<%-- <form:errors path="title"/> --%>
						<form:input style="border-radius:10%" path="userName" />
					</p>
					<p>
						<form:label style="display:block" path="email">Email</form:label>
						<form:input style="border-radius:10%" path="email" />
					</p>
					<p>
						<form:label style="display:block" path="password">Password</form:label>
						<%-- <form:errors path="language"/> --%>
						<form:password style="border-radius:10%" path="password" />
					</p>
					<p>
						<form:label style="display:block" path="confirm">Confirm Password</form:label>
						<%-- <form:errors path="language"/> --%>
						<form:password style="border-radius:10%" path="confirm" />
					</p>

					<input class="btn btn-primary" type="submit" value="Submit" />
				</form:form>
			</div>
			<div>
				<form:form action="/login" method="post" modelAttribute="newLogin">
					<h1 style="color: black">Login User!</h1>
					<hr />
					<form:errors path="*" />
					<p>
						<form:label style="display:block" path="email">Email</form:label>
						<form:input style="border-radius:10%" path="email" />
					</p>
					<p>
						<form:label style="display:block" path="password">Password</form:label>
						<%-- <form:errors path="language"/> --%>
						<form:input style="border-radius:10%" path="password" />
					</p>
					<input class="btn btn-primary" type="submit" value="Submit" />
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>