<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="./css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">

<title>Welcome to page about Java</title>
</head>
<body>

	<%
		if (session.getAttribute("user") == null) {
			response.sendRedirect("login.jsp");
	%>

	<%
		} else {
	%>
	<!-- Navigation -->
	<%@ include file="components/header.html"%>

	<div class="container-fluid welcome-bg">
		<div class="row welcome-inner">
			<div class="container no-gutter welcome-box shadow rounded">
				<div class="row h-100">
					<div
						class="col-12 col-xs-12 col-sm-12 col-md-12 col-lg-12 welcome-box text-white d-flex flex-column justify-content-center align-items-center">
						<h2>Welcome ${user} to Java Page</h2>
						<hr class="divide-bar w-25" />
						<p>
							This is page about <strong>Java</strong>. You can get more
							information here. Good luck!
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="components/footer.html"%>

	<%
		}
	%>
</body>
</html>