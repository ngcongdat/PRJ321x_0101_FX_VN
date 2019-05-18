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

	<!-- Bootstrap core JavaScript -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

	<!-- Custom scripts for this template -->
	<script src="js/main.min.js"></script>
</body>
</html>