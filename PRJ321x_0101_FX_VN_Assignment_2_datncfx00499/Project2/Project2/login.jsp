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

<title>Login Page</title>
</head>
<body>

	<!-- Navigation -->
	<%@ include file="components/header.html"%>

	<div class="container-fluid login-bg no-gutter">
		<div class="row">
			<div class="container no-gutter login-form shadow rounded pt-3 pb-5">
				<div class="row">
					<div class="col-12 col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<img id="login-img" class="img-fluid mb-5 d-block mx-auto"
							src="img/person.png" alt="">
						<h2 class="text-center">Login Page</h2>
						<div class="d-flex justify-content-center pt-2">
							<form class="w-50 text-center" action="login" method="post">
								<div class="form-group">
									<input type="text" class="form-control"
										aria-describedby="emailHelp" placeholder="Username" value=""
										name="username" required="required">
								</div>
								<div class="form-group">
									<input type="password" class="form-control"
										required="required" placeholder="Password" value="" name="password">
								</div>
								<button type="submit" class="btn btn-outline-info">Login</button>
							</form>
							
						</div>
						<div id="invalid" class="text-center pt-1">${requestScope.error}</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="components/footer.html"%>
</body>
</html>