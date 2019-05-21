<%-- 
    Document   : profile
    Created on : May 18, 2019, 10:32:33 PM
    Author     : tiny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Profile Page</title>

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

    <%
      if (session.getAttribute("user") == null) {
        response.sendRedirect("login");
      } else {%>

    <%-- Include navigation bar --%>
    <%@include file="components/navbar.jsp" %>

    <%-- Main container --%>
    <div class="container-fluid mt-5 mb-5">
      <div class="container pt-5 pb-5 shadow rounded" style="background-color: #E5B181;">
        <div class="row">
          <div class="col-12 col-sm-12 col-md-12 col-lg-12 d-flex justify-content-center">
            <h2 class="text-white">My Profile</h2>
          </div>
          <div class="col-12 col-sm-12 col-md-12 col-lg-12 mt-4 d-flex justify-content-center">
            <table class="table table-dark w-50">
              <tbody>
                <tr>
                  <th scope="col">Username</th>
                  <td>${user.username}</td>
                </tr>
                <tr>
                  <th scope="col">Password</th>
                  <td>${user.password}</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <!-- Include navigation bar -->
    <%@include file="components/footer.html" %>

    <% }%>
  </body>
</html>
