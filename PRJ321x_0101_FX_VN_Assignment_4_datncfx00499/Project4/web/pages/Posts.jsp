<%-- 
    Document   : Posts
    Created on : May 22, 2019, 4:16:21 PM
    Author     : tiny
--%>

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
      Connection conn = null;
      try {
        conn = new DBContext().getConnection();
      } catch (Exception ex) {
        response.getWriter().println(ex.toString());
        return;
      }

      DBPosts DBPost = new DBPosts(conn);
      List<Post> posts = DBPost.showPost();
    %>

    <%-- Include navigation bar --%>
    <%@include file="../components/navbar.jsp" %>

    <div class="container">
      <div class="row">
        <div class="col-12 col-sm-12 col-md-9 col-lg-9 content-area">
          <%
            for (Post p : posts) {
          %>
          <div class="row mt-3 mb-3 mr-2 ml-2 content-row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 shadow rounded pt-3 pb-3 post-box">
              <a href="/Project4/posts?p=<%=p.getTitle()%>" class="font-weight-bold text-dark text-decoration-none post-title"><%= p.getTitle()%></a>
              <div class="pb-3 text-secondary">
                <span><%= p.getDateCreate()%></span>
                <span>By <%=p.getAuthor()%></span>
              </div>
              <p class="text-secondary"><%= p.getDesc()%></p>
              <a class="btn btn-primary" href="/Project4/posts?p=<%=p.getTitle()%>">Read more</a>
            </div>
          </div>
          <% } %>
        </div>
        <div class="col-12 col-sm-12 col-md-3 col-lg-3 mt-3 mb-3 side-bar-area">AA</div>
      </div>
    </div>

    <% try {
        conn.close();
      } catch (SQLException ex) {
        response.getWriter().println(ex.toString());
        return;
      }
    %>

    <%-- Include navigation bar --%>
    <%@include file="../components/footer.html" %>

  </body>
</html>
