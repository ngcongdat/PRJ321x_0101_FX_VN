<%-- 
    Document   : home
    Created on : May 18, 2019, 10:36:29 PM
    Author     : tiny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome to Home page</title>

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
      Cookie cookies[] = request.getCookies();
    %>

    <%-- Include navigation bar --%>
    <%@include file="components/navbar.jsp" %>

    <%-- Main container --%>
    <div class="container-fluid mt-5 mb-5 home-page">
      <div class="container pt-5 pb-5 shadow rounded home-box" style="background: rgb(222,107,72);
           background: radial-gradient(circle, rgba(222,107,72,1) 0%, rgba(229,177,129,1) 25%, rgba(244,185,178,1) 50%, rgba(218,237,189,1) 75%, rgba(125,187,195,1) 100%);">
        <div class="row">
          <div class="col-12 col-sm-12 col-md-12 col-lg-12 d-flex justify-content-center">
            <h2 class="text-primary">Home Page</h2>
          </div>          
          <% if (cookies == null) {%> 
          <div class="col-12 col-sm-12 col-md-12 col-lg-12 mt-4 d-flex flex-column align-items-center justify-content-center">
            <h3>Hi Guest!</h3>
            <h3>Welcome to the broad!</h3>
          </div>

          <% } else {
          %>
          <div class="col-12 col-sm-12 col-md-12 col-lg-12 mt-4 d-flex flex-column align-items-center justify-content-center">
            <h3>Hi reader!</h3>
            <h3>Welcome back!</h3>
          </div>
          <% }%>
          <div class="col-12 col-sm-12 col-md-12 col-lg-12 mt-4 text-center">
            <a href="login" class="btn btn-info mr-3">Login</a>
            <a href="signup" class="btn btn-info ml-3">Sign Up</a>
          </div>
          <% if (cookies == null) {%> 
          <div class="col-12 col-sm-12 col-md-12 col-lg-12 mt-4 text-center">
            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#exampleModal">
              Save Cookies
            </button>
          </div>
          <% }%>
          <!-- Modal -->
          <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Save cookies</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  Do you want to save information in cookies?
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <a type="button" class="btn btn-info" href="cookies">Accept</a>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>

    <!-- Include navigation bar -->
    <%@include file="components/footer.html" %>


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>
