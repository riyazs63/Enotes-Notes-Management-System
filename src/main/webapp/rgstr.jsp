<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<%@ include file="all_component/AllCss.jsp"%>
</head>
<body>
	<%@include file="all_component/nvbr.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-4">

					<div class="card-header text-center text-black bg-custom">

						<h4>Registration</h4>
					</div>



					<%
					String SuccessMsg = (String) session.getAttribute("SuccessMsg");
					String ErrorMsg = (String) session.getAttribute("ErrorMsg");
					if (SuccessMsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=SuccessMsg%>
						Login <a href="login.jsp">Click Here</a>
					</div>

					<%
					session.removeAttribute("SuccessMsg");
					}

					if (ErrorMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=ErrorMsg%></div>
					<%
					session.removeAttribute("ErrorMsg");

					}
					%>



					<div class="card-body">
						<form action="register" method="post">
							<div class="form-group">
								<label for="name">Enter Full Name</label> <input type="text"
									class="form-control" id="name" name="name">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Email</label> <input
									type="email" class="form-control" id="email" name="email">

							</div>
							<div class="form-group">
								<label for="password">Enter Password</label> <input
									type="password" class="form-control" id="password"
									name="password">
							</div>

							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Register</button>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>