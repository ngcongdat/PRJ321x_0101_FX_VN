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
	<!-- Navigation -->
	<%@ include file="components/header.html"%>

	<div class="container-fluid login-bg no-gutter">
		<div class="row">
			<div class="container no-gutter login-form shadow rounded pt-3 pb-5">
				<div class="row">
					<div class="col-12 col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<img id="login-img" class="img-fluid mb-5 d-block mx-auto"
							src="img/person.png" alt="">
						<h2 class="text-center">Welcome ${sessionScope.user}</h2>
					</div>

					<div class="col-12 col-xs-12 col-sm-12 col-md-8 col-lg-8">
						<h3 class="text-center">Register course</h3>
						<div class="d-flex justify-content-center pt-2">
							<form class="" action="coursevalidation" method="post">
								
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
</body>
</html>