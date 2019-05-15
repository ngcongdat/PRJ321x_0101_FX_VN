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
<title>Print Odd Nums</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<ul class="nav justify-content-center">
				<li class="nav-item"><a class="nav-link active" href="#">Active</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
				<li class="nav-item"><a class="nav-link disabled" href="#"
					tabindex="-1" aria-disabled="true">Disabled</a></li>
			</ul>
		</div>
		<div class="row" style="height: 90px;">
			<div
				class="bg-danger
										text-white
										w-100
										d-flex
										justify-content-center
										align-items-center
										font-weight-bold"
				style="font-size: 2em">Odd Numbers</div>
		</div>
		<div class="row mt-5 mb-5">
			<%
				for (int i = 0; i < 500; i++) {
			%>
			<%
				if (i % 2 == 1) {
			%>
			<div
				class="col-xs-12 col-sm-12 col-md-3 col-lg-3 col-xl-3 text-center mt-2 mb-2"
				style="font-size: 1.2rem">
				<%
					if (i % 5 == 0) {
				%>
				<p class="font-weight-bold text-danger"><%=i%></p>
				<%
					} else {
				%>
				<p><%=i%></p>
				<%
					}
				%>
			</div>
			<%
				}
			%>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>