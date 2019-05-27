<%-- 
    Document   : PostDetail
    Created on : May 22, 2019, 4:10:54 PM
    Author     : tiny
--%>

<%@page import="com.bean.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Post post = (Post) request.getAttribute("post");%>

<% if (post == null) {
    response.sendRedirect("blogs");
  } else {
%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><%= post.getTitle()%></title>

    <%-- Meta tags --%>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <%-- Customize CSS --%>
    <link rel="stylesheet" href="./css/style.css">

    <%-- Bootstrap CSS --%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <%-- Google Fonts --%>
    <link href="https://fonts.googleapis.com/css?family=Roboto+Mono&display=swap" rel="stylesheet">

  </head>
  <body>
    <h1><%= post.getTitle()%></h1>
    <p><%= post.getContent()%></p>

  </body>
</html>

<% }%>
