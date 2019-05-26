<%-- 
    Document   : navbar
    Created on : May 26, 2019, 11:14:24 PM
    Author     : tiny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
  </head>
  <body>
     <%
      if (session.getAttribute("user") == null) { %>
    <ul class="nav justify-content-center navbar navbar-light" style="background-color: #7DBBC3; font-family: 'Roboto Mono', monospace;">
      <li class="nav-item">
        <a class="nav-link text-white font-weight-bold" href="blogs">Home</a>
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
        <a class="nav-link text-white font-weight-bold" href="blogs">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white font-weight-bold" href="controller?action=dologout">Logout</a>
      </li>
    </ul>
    <% }%>
  </body>
</html>
