<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	<%@ include file="./css/style.css" %>
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Homepage</title>
</head>
<body>

	<!-- Include navigation component -->
	<%@ include file="components/NavBar.jsp" %>

	<%@ include file="./components/SlideBar.jsp" %>	
	
	<%@ include file="./components/Services.jsp" %>
	
	<%@ include file="./components/Introduction.jsp" %>
	
	<%@ include file="./components/ProductsGallery.jsp" %>
	
	<%@ include file="./components/Footer.jsp" %>
</body>
</html>