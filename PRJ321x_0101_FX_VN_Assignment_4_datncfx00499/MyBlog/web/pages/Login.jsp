<%-- 
    Document   : Login
    Created on : May 22, 2019, 10:03:11 PM
    Author     : tiny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>

    <!-- Meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <%-- Customize CSS --%>
    <link rel="stylesheet" href="../css/style.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Mono&display=swap" rel="stylesheet">

  </head>
  <body>

    <%-- Include navigation bar --%>
    <%--@include file="components/navbar.jsp" --%>

    <%-- Login form --%>
    <div class="container-fluid mt-5 mb-5">
      <div class="container pt-5 pb-5 shadow rounded">
        <div class="row">
          <div class="col-12 col-sm-12 col-md-12 col-lg-12 d-flex justify-content-center">
            <h2>Log In</h2>
          </div>
          <div class="col-12 col-sm-12 col-md-12 col-lg-12 d-flex justify-content-center">
            <form action="loginprocess" method="post" class="w-50">
              <input type="hidden" name="action" value="dologin" />
              <div>
                <h3 class="text-danger"><%= request.getAttribute("error") %></h3>
              </div>
              <div class="form-group">
                <label for="username" class="font-weight-bold">Username</label>
                <input type="text" class="form-control" id="username" required="required" name="username" value="">
              </div>
              <div class="form-group">
                <label for="password" class="font-weight-bold">Password</label> 
                <input type="password" class="form-control" id="password" required="required" name="password" value="">
              </div>
              <div class="text-center">
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
              <div class="text-center mt-3">
                <small>Don't have a account?</small>
                <small><a href="signup">Sign Up</a></small>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    <!-- Include navigation bar -->
    <%--@include file="components/footer.html" --%>

  </body>
</html>
