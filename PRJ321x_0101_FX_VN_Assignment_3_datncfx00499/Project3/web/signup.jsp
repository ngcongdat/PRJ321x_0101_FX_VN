<%-- 
    Document   : signup
    Created on : May 19, 2019, 8:46:33 AM
    Author     : tiny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sign Up</title>
    
    <!-- Meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
  </head>
  <body>

    <%-- Include navigation bar --%>
    <%@include file="components/navbar.html" %>

    <%-- Login form --%>
    <div class="container-fluid mt-5 mb-5">
      <div class="container pt-5 pb-5 shadow rounded">
        <div class="row">
          <div class="col-12 col-sm-12 col-md-12 col-lg-12 d-flex justify-content-center">
            <form action="signupprocess" method="post" class="w-50">
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
                <small>Have an account?</small>
                <small><a href="login">Login</a></small>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    <!-- Include navigation bar -->
    <%@include file="components/footer.html" %>
  </body>
</html>
