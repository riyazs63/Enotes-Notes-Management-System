<%@page import="com.Model.Note"%>
<%@page import="com.Dao.UserDao"%>
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
<title>Edit Notes Page</title>
<%@ include file="all_component/AllCss.jsp"%>
</head>
<body>

	<%
	Integer noteid = Integer.parseInt(request.getParameter("id"));
	Note n =  UserDao.editNoteById(noteid);
	%>

	<div class="container-fluid p-0">
		<%@include file="all_component/nvbr.jsp"%>
		<h1 align="center">Edit Your Notes</h1>
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<form action="updateNote" method="post">


						<input type="hidden" value="<%=noteid%>" name="noteid">

						<div class="form-group">


							<label for="title">Enter Title</label> <input type="text"
								class="form-control" id="title" name="title" required="required" value="<%=n.getTitle()%>">

						</div>

						<div class="form-group">
							<label for="content">Enter Content</label>
							<textarea rows="8" class="form-control" name="content"
								required="required" ><%=n.getContent()%></textarea>
						</div>


						<div class="container text-center mt-2">
							<button type="submit" class="btn btn-primary">Update Notes</button>
					</form>

				</div>
			</div>
		</div>
	</div>

	</div>
</body>
</html>