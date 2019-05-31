<%-- 
    Document   : SignUp
    Created on : May 30, 2019, 9:56:11 PM
    Author     : tiny
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
  <head>

    <%-- Required meta tags --%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Sign Up | Gmail SMTP WebApp</title>

    <%-- Customize CSS --%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">

    <%-- Bootstrap CSS --%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

  </head>
  <body>

    <!--  Import navigation bar into pages  -->
    <c:import url="/components/NavBar.jsp"/>

    <div class="container-fluid signin-signup d-flex align-items-center">
      <div class="container">
        <div class="row">
          <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-address my-5">
              <div class="card-body">
                <h5 class="card-title text-center">Sign Up</h5>
                <form class="form-address" action="Controller" method="post">
                  <input type="hidden" name="action" value="signup">
                  <div class="form-label-group">
                    <input type="email" name="email" value="" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                    <label for="inputEmail">Email address</label>
                  </div>
                  <div class="form-label-group">
                    <input type="text" name="username" value="" id="inputUsername" class="form-control" placeholder="Username" required>
                    <label for="inputUsername">Username</label>
                  </div>
                  <div class="form-label-group">
                    <input type="password" name="password" value="" id="inputPassword" class="form-control" placeholder="Password" required>
                    <label for="inputPassword">Password</label>
                  </div>
                  <hr class="my-4">
                  <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Sign up</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!--  Import navigation bar into pages  -->
    <c:import url="/components/Footer.jsp"/>

  </body>
</html>
