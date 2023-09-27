<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<%@ include file="all_component/AllCss.jsp"%>
</head>
<body>
	<%@include file="all_component/nvbr.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-4">

					<div class="card-header text-center text-black bg-white">
						<h4>Login</h4>
					</div>

					<%
					String loginFailedMsg = (String) session.getAttribute("loginFailed");

					if (loginFailedMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=loginFailedMsg%></div>
					<%
					session.removeAttribute("loginFailed");
					}
					%>

					<%
					// If user directly want to access add notes without login...then Login Error will be shown
					String withoutLogin = (String) session.getAttribute("Login-Error");
					if (withoutLogin != null) {
					%>


					<div class="alert alert-danger" role="alert"><%=withoutLogin%></div>
					<%
					session.removeAttribute("Login-Error");
					}
					%>

					<%
					// logout msg to be shown if user logout successfully
					String logoutmsg = (String) session.getAttribute("logoutmsg");
					if (logoutmsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=logoutmsg%></div>
					<%
					}
					session.removeAttribute("logoutmsg");
					%>


					<div class="card-body">
						<form action="login" method="post">
							<div class="form-group">
								<label for="email">Enter Email</label> <input type="email"
									class="form-control" id="email" name="email">

							</div>
							<div class="form-group">
								<label for="password">Enter Password</label> <input
									type="password" class="form-control" id="password"
									name="password">
							</div>

							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Login</button>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>