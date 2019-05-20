<%-- 
    Document   : index
    Created on : May 18, 2019, 10:32:23 PM
    Author     : tiny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Index Page</title>
    
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

    <%-- <%
          if (session.getAttribute("logged") == null) {
            response.sendRedirect("login");
          } else {%> --%>

    <%-- Include navigation bar --%>
    <%@include file="components/navbar.html" %>

    <%-- Login form --%>
    <div class="container-fluid mt-5 mb-5">
      <div class="container shadow rounded">
        <div class="row">
          <div class="col-12 col-sm-12 col-md-6 col-lg-6 d-flex flex-column align-items-center justify-content-center pt-5 pb-5" style="background-color: #DE6B48;">
              <h1>Profile</h1>
              <p>View my profile</p>
            <a href="profile" class="btn btn-info">View</a>
          </div>
          <div class="col-12 col-sm-12 col-md-6 col-lg-6 d-flex flex-column align-items-center justify-content-center pt-5 pb-5"  style="background-color: #F4B9B2;">
            <h1>Counter User</h1>
              <p>Who is online?</p>
            <a href="usercounter" class="btn btn-info">View</a>
          </div>
        </div>
      </div>
    </div>

    <!-- Include navigation bar -->
    <%@include file="components/footer.html" %>

  </body>
</html>
