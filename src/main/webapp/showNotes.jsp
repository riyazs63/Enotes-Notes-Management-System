<%@page import="com.Model.Note"%>
<%@page import="com.Dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
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
<title>Show Notes</title>
<%@ include file="all_component/AllCss.jsp"%>
</head>
<body>
	<%@include file="all_component/nvbr.jsp"%>

	<%
	// updateMsg to be shown in show notes page ..if notes updated succesfully.
	String updateMsg = (String) session.getAttribute("updateMsg");
	if (updateMsg != null) {
	%>


	<div class="alert alert-success" role="alert"><%=updateMsg%></div>
	<%
	session.removeAttribute("updateMsg");
	}
	%>
	<%
	// if notes not deleted.
	String notdeleteMsg = (String) session.getAttribute("notdeleteMsg");
	if (notdeleteMsg != null) {
	%>


	<div class="alert alert-success" role="alert"><%=notdeleteMsg%></div>
	<%
	session.removeAttribute("notdeleteMsg");
	}
	%>




	<div class="container">
		<h2 class="text-center">All Notes</h2>
		<div class="row">
			<div class="col-md-12">

				<%
				if (user1 != null) {

					ArrayList<Note> al = UserDao.displayContact(user1.getId());
					for (Note n : al) {
				%>

				<div class="card mt-3">
					<img alt="" src="img/book.jpg" class="card-img-top mt-2 mx-auto"
						style="max-width: 100px">
					<div class="card-body p-4">



						<h5 class="card-title"><%=n.getTitle()%></h5>

						<p><%=n.getContent()%></p>

						<p>
							<b class="text-success">Published By: <%=user1.getName()%>
							</b> <br> <b class="text-primary"></b>
						</p>

						<p>
							<b class="text-success">Published Date: <%=n.getDate()%>
							</b> <br> <b class="text-primary"></b>
						</p>


						<div class="container text-center mt-2">
							<a href="delete?id=<%=n.getId()%>" class="btn btn-danger">Delete</a>
							<a href="edit.jsp?id=<%=n.getId()%>" class="btn btn-primary">Edit</a>
						</div>
					</div>

				</div>


				<%
				}
				}
				%>




			</div>
		</div>
	</div>


</body>
</html>