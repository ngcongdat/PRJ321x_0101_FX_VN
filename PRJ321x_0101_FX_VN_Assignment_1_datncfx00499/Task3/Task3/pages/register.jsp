<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Register</title>
</head>
<body>

	<!-- Include navigation component -->
	<%@ include file="../components/nav.jsp"%>

	<div class="container">
		<div class="row mb-5">
			<div class="col-md-12">
				<form action="/Task3/register" method="post">
					<div class="form-group">
						<label class="font-weight-bold" for="exampleInputFirstname">First
							Name</label> <input type="text" class="form-control"
							id="exampleInputFirstname" placeholder="Your Firstname" value=""
							name="firstname" required="required">
					</div>
					<div class="form-group">
						<label class="font-weight-bold" for="exampleInputLastname">Last
							Name</label> <input type="text" class="form-control"
							id="exampleInputLastname" placeholder="Your Firstname" value=""
							name="lastname" required="required">
					</div>
					<div class="form-group">
						<label class="font-weight-bold" for="exampleInputPhone">Phone</label>
						<input type="text" class="form-control" id="exampleInputPhone"
							placeholder="Your Phone" value="" name="phone"
							required="required">
					</div>
					<div class="form-group">
						<label class="font-weight-bold" for="exampleInputEmail">Email
							address</label> <input type="email" class="form-control"
							id="exampleInputEmail" placeholder="Your Email" value=""
							name="email" required="required">
					</div>
					<!-- Checkbox options -->
					<div class="form-group form-check">
						<input type="checkbox" class="form-check-input" id="java"
							name="subject1" value="Java" checked="checked"> <label
							class="form-check-label font-weight-bold" for="java">Java</label>
					</div>
					<div class="form-group form-check">
						<input type="checkbox" class="form-check-input" id="javaScript"
							name="subject2" value="JavaScript"> <label
							class="form-check-label font-weight-bold" for="javaScript">JavaScript</label>
					</div>
					<div class="form-group form-check">
						<input type="checkbox" class="form-check-input" id="php"
							name="subject3" value="PHP"> <label
							class="form-check-label font-weight-bold" for="php">PHP</label>
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>