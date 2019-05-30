<%-- 
    Document   : SignUp
    Created on : May 30, 2019, 9:56:11 PM
    Author     : tiny
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/components/NavBar.jsp">
  <c:param name="title" value="Login | Gmail SMTP Webapp"></c:param>
</c:import>

<div class="container-fluid signin-signup d-flex align-items-center">
  <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin-signup my-5">
          <div class="card-body">
            <h5 class="card-title text-center">Sign Up</h5>
            <form class="form-signin-signup" action="Controller" method="post">
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

<c:import url="/components/Footer.jsp"></c:import>
