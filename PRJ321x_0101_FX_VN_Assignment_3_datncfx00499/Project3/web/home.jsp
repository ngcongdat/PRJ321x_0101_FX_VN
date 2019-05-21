<%-- 
    Document   : home
    Created on : May 18, 2019, 10:36:29 PM
    Author     : tiny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome to Home page</title>

    <!-- Meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <%-- Customize CSS --%>
    <link rel="stylesheet" href="./css/style.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Mono&display=swap" rel="stylesheet">

  </head>
  <body>

    <%-- Include navigation bar --%>
    <%@include file="components/navbar.jsp" %>

    <%-- Main container --%>
    <div class="container-fluid mt-5 mb-5 home-page">
      <div class="container pt-5 pb-5 shadow rounded home-box" style="background: rgb(222,107,72);
           background: radial-gradient(circle, rgba(222,107,72,1) 0%, rgba(229,177,129,1) 25%, rgba(244,185,178,1) 50%, rgba(218,237,189,1) 75%, rgba(125,187,195,1) 100%);">
        <div class="row">
          <div class="col-12 col-sm-12 col-md-12 col-lg-12 d-flex justify-content-center">
            <h2 class="text-primary">Home Page</h2>
          </div>          
          <%
            if (session.getAttribute("user") == null) {%> 
          <div class="col-12 col-sm-12 col-md-12 col-lg-12 mt-4 d-flex flex-column align-items-center justify-content-center">
            <h3>Hi Guest!</h3>
            <h3>Welcome to the broad!</h3>
          </div>
          <% } else {%>
          <div class="col-12 col-sm-12 col-md-12 col-lg-12 mt-4 d-flex flex-column align-items-center justify-content-center">
            <h3>Hi ${sessionScope.user.username}!</h3>
            <h3>Welcome back!</h3>
          </div>
          <% }%>
          <div class="col-12 col-sm-12 col-md-12 col-lg-12 mt-4 text-center">
            <a href="login" class="btn btn-info mr-3">Login</a>
            <a href="signup" class="btn btn-info ml-3">Sign Up</a>
          </div>
        </div>
      </div>
    </div>

    <!-- Include navigation bar -->
    <%@include file="components/footer.html" %>

  </body>
</html>
