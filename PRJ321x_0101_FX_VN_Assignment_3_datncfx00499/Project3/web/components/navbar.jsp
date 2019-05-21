<%-- 
    Document   : navbar
    Created on : May 21, 2019, 7:45:01 PM
    Author     : tiny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Navigation Bar</title>

    <!-- Meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Mono&display=swap" rel="stylesheet">

  </head>
  <body>

    <%
      if (session.getAttribute("user") == null) { %>
    <ul class="nav justify-content-center navbar navbar-light" style="background-color: #7DBBC3; font-family: 'Roboto Mono', monospace;">
      <li class="nav-item">
        <a class="nav-link text-white font-weight-bold" href="home">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white font-weight-bold" href="login">Login</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white font-weight-bold" href="signup">Sign Up</a>
      </li>
    </ul>
    <% } else {%>
    <ul class="nav justify-content-center navbar navbar-light" style="background-color: #7DBBC3; font-family: 'Roboto Mono', monospace;">
      <li class="nav-item">
        <a class="nav-link text-white font-weight-bold" href="home">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white font-weight-bold" href="profile">Profile</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white font-weight-bold" href="usercounter">Users</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white font-weight-bold" href="logoutprocess?username=${sessionScope.user.username}">Logout</a>
      </li>
    </ul>
    <% }%>
  </body>
</html>
