<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//If user directly want to access add notes without login...then Login Error will be shown
User user1 = (User) session.getAttribute("userD");

if (user1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-Error", "Please Login");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<%@ include file="all_component/AllCss.jsp"%>
</head>
<body>
	<%@include file="all_component/nvbr.jsp"%>

	<div class="container-fluid p-0">
		<div class="card py-5">
			<div class="card-body text-center">
				<img alt="" src="img/book.jpg" class="img-fluid mx-auto"
					style="max-width: 300px">
				<h1>START TAKING YOUR NOTES</h1>
				<a href="addNotes.jsp" class="btn btn-outline-primary">Start
					Here</a>
			</div>


		</div>

	</div>
</body>
</html>