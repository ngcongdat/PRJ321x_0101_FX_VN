<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Courses</title>

<link href="./css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
</head>
<body>

	<%
		if (session.getAttribute("user") == null) {
			response.sendRedirect("login.jsp");
		} else {
			if (session.getAttribute("user").equals("admin")) {
	%>
	<!-- Get attribute from CourseValidation servlet -->
	<%
		List<String> errors = (List<String>) request.getAttribute("errors");
	%>

	<!-- Navigation -->
	<%@ include file="components/header.html"%>

	<div class="container-fluid register-bg no-gutter">
		<div class="row">
			<div class="container no-gutter login-form shadow rounded pt-3 pb-5">
				<div class="row">

					<!-- Information Box -->
					<div
						class="col-12 col-xs-12 col-sm-12 col-md-4 col-lg-4 d-flex flex-column justify-content-center align-items-center">
						<img id="login-img" class="img-fluid mb-5 d-block mx-auto"
							src="img/person.png" alt="">
						<h2 class="text-center">Welcome ${sessionScope.user}</h2>
						<%
							if (errors != null) {
										for (int i = 0; i < errors.size(); i++) {
						%>
						<div class="text-center text-danger"><%=errors.get(i)%></div>

						<%
							}
									}
						%>
					</div>

					<!-- Register Form -->
					<div class="col-12 col-xs-12 col-sm-12 col-md-8 col-lg-8">
						<h3 class="text-center">Register course</h3>
						<div class="d-flex justify-content-center pt-2">
							<form class="" action="coursevalidation" method="post">
								<div class="name-box form-group">
									<label for="name">Full Name</label> <input class="form-control"
										type="text" name="name" value="" id="name"
										placeholder="Your Full Name" required="required">
								</div>
								<div class="age-box form-group">
									<label for="age">Age</label> <input class="form-control"
										type="number" name="age" value="" id="age"
										placeholder="Your Age">
								</div>
								<div class="countries-box form-group">
									<label>Your Country</label> <select class="form-control"
										name="countries">
										<option value="Vietnam">Viet Nam</option>
										<option value="Usa">Mỹ</option>
										<option value="England">Anh</option>
										<option value="China">Trung Quốc</option>
										<option value="French">Pháp</option>
									</select>
								</div>
								<div class="courses-box form-group">
									<label>Courses</label> <select name="courses"
										multiple="multiple" class="form-control" size="5"
										required="required">
										<option value="CShape">C#</option>
										<option value="Java">Java</option>
										<option value="CPlusPlus">C++</option>
										<option value="Python">Python</option>
										<option value="Rail">Ruby on Rail</option>
									</select>
								</div>
								<div class="languages-box form-group">
									<label class="d-block">Languages</label> <input type="checkbox"
										name="language1" value="Vietnam" checked="checked">
									Tiếng Việt <br> <input type="checkbox" name="language2"
										value="English"> Tiếng Anh<br> <input
										type="checkbox" name="language3" value="French"> Tiếng
									Pháp<br>
								</div>

								<button type="submit" class="btn btn-outline-info">Login</button>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="components/footer.html"%>

	<%
		} else {
				response.sendRedirect("login.jsp");
	%>

	<%
		}
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