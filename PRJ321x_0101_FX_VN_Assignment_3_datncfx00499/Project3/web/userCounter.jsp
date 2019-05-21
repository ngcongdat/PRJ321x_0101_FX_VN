<%-- 
    Document   : userCounter
    Created on : May 18, 2019, 10:32:42 PM
    Author     : tiny
--%>

<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Total Users Online</title>

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

    <% HashMap<Integer, String> allUsers = (HashMap<Integer, String>) application.getAttribute("allUsers");%>

    <%-- Include navigation bar --%>
    <%@include file="components/navbar.jsp" %>

    <%-- Main container --%>
    <div class="container-fluid mt-5 mb-5">
      <div class="container pt-5 pb-5 shadow rounded profile-box">
        <div class="row">
          <div class="col-12 col-sm-12 col-md-12 col-lg-12 d-flex justify-content-center">
            <h2 class="text-white">All Users Online</h2>
          </div>
          <div class="col-12 col-sm-12 col-md-12 col-lg-12 mt-4 d-flex flex-column align-items-center justify-content-center">
            <h1 class="text-white">${applicationScope.countUserLogin}</h1>
            <h2 class="text-white mt-5">List Users</h2>
            <%
              Set<Integer> keySet = allUsers.keySet();
              for (Integer i : keySet) {%>
            <table class="table table-dark text-center w-50">
              <tbody>
                <tr>
                  <th scope="col">#</th>
                  <th scope="col">Username</th>
                </tr>
                <tr>
                  <td><%=i%></td>
                  <td><%=allUsers.get(i)%></td>
                </tr>
              </tbody>
            </table>
            <%
              }
            %>
          </div>
        </div>
      </div>
    </div>

    <!-- Include navigation bar -->
    <%@include file="components/footer.html" %>

    <% }%>
  </body>
</html>
