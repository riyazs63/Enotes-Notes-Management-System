<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
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
<title>Add Notes Page</title>
<%@ include file="all_component/AllCss.jsp"%>
</head>
<body>

	<div class="container-fluid p-0">
		<%@include file="all_component/nvbr.jsp"%>
		<h1 align="center">Add Your Notes</h1>
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<form action="addNote" method="post">

						<div class="form-group">

							<%
							User us = (User) session.getAttribute("userD");
							if (us != null) {
							%>
							<input type="hidden" value="<%=us.getId()%>" name="uid">

							<%
							}
							%>





							<label for="title">Enter Title</label> <input type="text"
								class="form-control" id="title" name="title" required="required">

						</div>

						<div class="form-group">
							<label for="content">Enter Content</label>
							<textarea rows="8" class="form-control" name="content"
								required="required"></textarea>
						</div>


						<div class="container text-center mt-2">
							<button type="submit" class="btn btn-primary">Save Notes</button>
					</form>

				</div>
			</div>
		</div>
	</div>

	</div>
</body>
</html>