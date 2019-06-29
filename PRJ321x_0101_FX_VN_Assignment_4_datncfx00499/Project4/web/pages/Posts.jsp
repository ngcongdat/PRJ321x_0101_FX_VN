<%-- 
    Document   : Posts
    Created on : May 22, 2019, 4:16:21 PM
    Author     : tiny
--%>

<%@page import="com.bean.Users"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.Post"%>
<%@page import="com.database.DBPosts"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.context.DBContext"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Blogs | Read news which you like</title>

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

    <%
      List<Post> posts = (List<Post>) application.getAttribute("posts");
      Users user = (Users) session.getAttribute("user");
    %>

    <%if (posts == null) {
        request.getRequestDispatcher("controller?action=getposts").forward(request, response);
      } else {%>

    <%-- Include navigation bar --%>
    <%@include file="../components/navbar.jsp" %>

    <div class="container">
      <div class="row">
        <div class="col-12 col-sm-12 col-md-9 col-lg-9 content-area">
          <div class="row mt-3 mb-3 mr-2 ml-2">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 shadow rounded pt-3 pb-3 d-flex flex-column align-items-center justify-content-center">
              <% if (user == null) { %>
              <h3>Hi Guest!</h3>
              <h3>Welcome to the broad!</h3>
              <% } else {%>
              <h3>Hi <%= user.getUsername()%></h3>
              <h3>Welcome back!</h3>
              <p>You have <strong class="text-danger">${sessionScope.countPost}</strong> on website. Continue to write at <a href="createpost">here</a>?</p>
              <% }%>
            </div>
          </div>
          <%
            for (Post p : posts) {
          %>
          <div class="row mt-3 mb-3 mr-2 ml-2 content-row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 shadow rounded pt-3 pb-3 post-box">
              <a href="/Project4/posts?action=viewpost&p=<%=p.getTitle()%>&id=<%=p.getPostID()%>" class="font-weight-bold text-dark text-decoration-none post-title" style="font-family: 'Roboto Mono', monospace"><%= p.getTitle()%></a>
              <div class="pb-3 text-secondary">
                <span><%= p.getDateCreate()%></span>
                <span>By <%=p.getAuthor()%></span>
                <%if (user != null) {
                    if (user.getUsername().equals(p.getAuthor())) {
                %>
                <span> - </span>
                <span class="btn-edit"><a href="/Project4/posts?action=editpost&id=<%=p.getPostID()%>" class="text-decoration-none text-secondary">Edit</a></span>
                <span> - </span>
                <span class="btn-edit"><a href="/Project4/posts?action=deletepost&id=<%=p.getPostID()%>" class="text-decoration-none text-secondary">Delete</a></span>
                <% }
                  }%>
              </div>
              <p class="text-secondary"><%= p.getDesc()%></p>
              <a class="btn btn-primary" href="/Project4/posts?action=viewpost&p=<%=p.getTitle()%>&id=<%=p.getPostID()%>">Read more</a>
            </div>
          </div>
          <% } %>
        </div>
        <div class="col-12 col-sm-12 col-md-3 col-lg-3 side-bar-area">
          <div class="row mt-3 mb-3 mr-2 ml-2 content-row">
            <%@include file="../components/sidebar.jsp" %>
          </div>
        </div>
      </div>
    </div>


    <% }%>
    <%-- Include navigation bar --%>
    <%@include file="../components/footer.html" %>

  </body>
</html>
