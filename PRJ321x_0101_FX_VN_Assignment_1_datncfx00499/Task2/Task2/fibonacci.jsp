<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style type="text/css">
			<%@ include file="css/style.css"%>
		</style>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>Fibonacci</title>
	</head>
	<body>
		<%-- Function fibonacci calculation --%>
		<%!
			public static int fibonacci(int n) { 
				if (n < 0) {
	      	return -1;
	      } else if (n == 0 || n == 1) {
	        return n;
	      } else {
	        return fibonacci(n - 1) + fibonacci(n - 2);
	      }
		}
		%>
		<div class="container">
			<div class="row" style="height: 90px;">
				<div class="bg-primary
										text-white
										w-100
										d-flex
										justify-content-center
										align-items-center
										font-weight-bold"
							style="font-size: 2em"
				>Fibonacci Values</div>
			</div>
			<div class="row mt-5 mb-5">
				<div class="col-md-12">
					<table class="table">
						<thead>
							<tr>
								<th>n</th>
								<th>Value</th>
							</tr>
						</thead>
					
						<tbody>
							<%
								for (int i = 0; i < 22; i++) {
							%>
								<tr class="items">
									<td class="font-weight-bold"><%= i %></td>
									<td><%= fibonacci(i) %></td>
								</tr>
							<% } %>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	
	</body>
</html>