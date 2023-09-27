<%@page import="com.Model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<%@ include file="AllCss.jsp"%>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="index.jsp">ENotes</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="home.jsp">
						</i> Home <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="addNotes.jsp"> Add Notes </a></li>

				<li class="nav-item active"><a class="nav-link"
					href="showNotes.jsp"> Show Notes</a></li>
			</ul>


			<%
			User user = (User) session.getAttribute("userD");
			if (user == null) {
			%>
			<form class="form-inline my-2 my-lg-0">
				<a href="login.jsp" class="btn btn-success"> Login</a> 
				<a href="rgstr.jsp" class="btn btn-danger ml-2"> Register</a>

			</form>
			<%
			} else {
			%>

			<form class="form-inline my-2 my-lg-0">
				<input type="submit" class="btn btn-success"
					value="<%=user.getName()%>"> <a href="logout"
					data-toggle="modal" data-target="#exampleModal"
					class="btn btn-danger ml-2 text-white">Logout</a>

				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Logout
									Confirmation</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body text-center">
								<h6>Do You Want To Logout</h6>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<a href="logout" class="btn btn-primary">Logout</a>
							</div>
							<div class="modal-footer"></div>
						</div>
					</div>
				</div>

			</form>
			<%
			}
			%>
		</div>

		<!-- Logout Popup -->



		<!-- Logout Popup -->
	</nav>

</body>
</html>