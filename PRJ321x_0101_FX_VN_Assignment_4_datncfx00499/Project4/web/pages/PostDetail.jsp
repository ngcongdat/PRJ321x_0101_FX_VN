<%-- 
    Document   : PostDetail
    Created on : May 22, 2019, 4:10:54 PM
    Author     : tiny
--%>

<%@page import="com.bean.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
  Post post = (Post) request.getAttribute("post");
  if (post == null) {
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

    <%-- Include navigation bar --%>
    <%@include file="../components/navbar.jsp" %>

    <div class="container">
      <div class="row">
        <div class="col-12 col-sm-12 col-md-9 col-lg-9 content-area">
          <div class="row mt-3 mb-3 mr-2 ml-2 content-row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 shadow-sm rounded pt-3">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="blogs" class="text-decoration-none">Home</a></li>
                  <li class="breadcrumb-item active" aria-current="page"><%= post.getTitle()%></li>
                </ol>
              </nav>
            </div>
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 shadow rounded mt-3 pb-3 post-box">
              <h1><%= post.getTitle()%></h1>
              <div class="pb-3 text-secondary">
                <span><%= post.getDateCreate()%></span>
                <span>By <%=post.getAuthor()%></span>
              </div>
              <div class="post-desc">
                <p><%= post.getDesc()%></p>
              </div>
              <div class="post-content">
                <%= post.getContent()%>
              </div>
            </div>
          </div>
        </div>
        <div class="col-12 col-sm-12 col-md-3 col-lg-3 side-bar-area">
          <div class="row mt-3 mb-3 mr-2 ml-2 content-row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 shadow rounded pt-3 pb-3">
              <form>
                <div class="form-group m-0">
                  <input type="text" name="title" value="" placeholder="Search" class="form-control"/>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

    <%-- Include navigation bar --%>
    <%@include file="../components/footer.html" %>

  </body>
</html>

<% }%>
