<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>
<%@page import="java.util.ArrayList"%>
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
<title>Register Information</title>
</head>
<body>

	<!-- Include navigation component -->
	<%@ include file="components/nav.jsp"%>

	<div class="container">
		<div class="row mt-5 mb-5">
			<div class="col-md-12 text-center">
				<h3>Please confirm your information???</h3>
			</div>
			<div class="col-md-12 d-flex justify-content-center">
				<table class="table w-50">
					<thead>
						<tr>
							<th></th>
							<th>Information</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="font-weight-bold">First Name</td>
							<td>${student.firstname}</td>
						</tr>
						<tr>
							<td class="font-weight-bold">Last Name</td>
							<td>${student.lastname}</td>
						</tr>
						<tr>
							<td class="font-weight-bold">Email</td>
							<td>${student.email}</td>
						</tr>
						<tr>
							<td class="font-weight-bold">Phone</td>
							<td>${student.phone}</td>
						</tr>
						<tr>
							<td class="font-weight-bold">Subjects</td>
							<td>${student.subject1} / ${student.subject2} / ${student.subject3}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-12 d-flex justify-content-center">
				<a class="btn btn-primary text-weight-bold" href="/Task3"
					role="button">Confirm</a>
			</div>
		</div>
	</div>
</body>
</html>