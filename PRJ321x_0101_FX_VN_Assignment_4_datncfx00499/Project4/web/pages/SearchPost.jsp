<%-- 
    Document   : SearchPost
    Created on : May 28, 2019, 7:09:24 PM
    Author     : tiny
--%>

<%@page import="com.bean.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  Users user = (Users) session.getAttribute("user");
  List<Post> posts = (List<Post>) request.getAttribute("post");
  if (posts == null) {
    response.sendRedirect("blogs");
  } else {
%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Search</title>
  </head>
  <body>

    <%-- Include navigation bar --%>
    <%@include file="../components/navbar.jsp" %>

    <div class="container">
      <div class="row">
        <div class="col-12 col-sm-12 col-md-9 col-lg-9 content-area">
          <div class="row mt-3 mb-3 mr-2 ml-2">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 shadow-sm rounded pt-3">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="blogs" class="text-decoration-none">Home</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Search</li>
                </ol>
              </nav>
            </div>
          </div>
          <%
            for (Post p : posts) {
          %>
          <div class="row mt-3 mb-3 mr-2 ml-2 content-row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 shadow rounded mt-3 pb-3 post-box">
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
          <% }%>
        </div>
        <div class="col-12 col-sm-12 col-md-3 col-lg-3 side-bar-area">
          <div class="row mt-3 mb-3 mr-2 ml-2 content-row">
            <%@include file="../components/sidebar.jsp" %>
          </div>
        </div>
      </div>
    </div>

    <%-- Include navigation bar --%>
    <%@include file="../components/footer.html" %>

  </body>
</html>
<% }%>