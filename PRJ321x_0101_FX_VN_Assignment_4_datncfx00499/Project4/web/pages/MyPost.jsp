<%-- 
    Document   : MyPost
    Created on : May 28, 2019, 2:57:41 PM
    Author     : tiny
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.Post"%>
<%@page import="com.database.DBPosts"%>
<%@page import="com.context.DBContext"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bean.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My Posts</title>

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
      Users user = (Users) session.getAttribute("user");
      Connection conn = null;
      try {
        conn = new DBContext().getConnection();
      } catch (Exception ex) {
        response.getWriter().println(ex.toString());
        return;
      }

      DBPosts DBPost = new DBPosts(conn);
      List<Post> mPosts = DBPost.showMyPosts(user);
    %>

    <%-- Include navigation bar --%>
    <%@include file="../components/navbar.jsp" %>

    <div class="container">
      <div class="row">
        <div class="col-12 col-sm-12 col-md-9 col-lg-9 content-area">
          <%
            for (Post p : mPosts) {
          %>
          <div class="row mt-3 mb-3 mr-2 ml-2 content-row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 shadow rounded pt-3 pb-3 post-box">
              <a href="/Project4/posts?action=viewpost&p=<%=p.getTitle()%>&id=<%=p.getPostID()%>" class="font-weight-bold text-dark text-decoration-none post-title" style="font-family: 'Roboto Mono', monospace"><%= p.getTitle()%></a>
              <div class="pb-3 text-secondary">
                <span><%= p.getDateCreate()%></span>
                <span> - </span>
                <span><a href="/Project4/posts?action=editpost&id=<%=p.getPostID()%>" class="text-decoration-none text-secondary btn-edit">Edit</a></span>
                <span> - </span>
                <span class="btn-edit"><a href="/Project4/posts?action=deletepost&id=<%=p.getPostID()%>" class="text-decoration-none text-secondary">Delete</a></span>
              </div>
              <p class="text-secondary"><%= p.getDesc()%></p>
              <a class="btn btn-primary" href="/Project4/posts?action=viewpost&p=<%=p.getTitle()%>&id=<%=p.getPostID()%>">Read more</a>
            </div>
          </div>
          <% } %>
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
