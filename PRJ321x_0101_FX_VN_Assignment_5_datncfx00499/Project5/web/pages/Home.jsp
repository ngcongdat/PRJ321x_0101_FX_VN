<%-- 
    Document   : Home
    Created on : May 30, 2019, 6:14:04 PM
    Author     : tiny
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
  <head>

    <%-- Required meta tags --%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>HomePage | Gmail SMTP WebApp</title>

    <%-- Customize CSS --%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">

    <%-- Bootstrap CSS --%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  </head>
  <body>

    <!--  Import navigation bar into pages  -->
    <c:import url="/components/NavBar.jsp"/>

      <header class="home-header">
        <div class="container h-100">
          <div class="row h-100 align-items-center">
            <div class="col-12 text-center">
            <c:choose>
              <c:when test="${sessionScope.user == null}">
                <h1 class="font-weight-light">Welcome Guest!</h1>
                <p class="lead">We can help you send email via Gmail SMTP</p>
                <span><a class="btn btn-primary" href="sign-in">Sign In</a></span>
                <span class="pl-4 pr-4"></span>
                <span><a class="btn btn-primary" href="sign-up">Sign Up</a></span>
              </c:when>
              <c:otherwise>
                <h1 class="font-weight-light">Welcome back ${sessionScope.user.username}!</h1>
                <p class="lead">How are you today?</p>
                <span><a class="btn btn-primary" href="compose">Send mail now</a></span>
              </c:otherwise>
            </c:choose>

          </div>
        </div>
      </div>
    </header>

    <!--  Import navigation bar into pages  -->
    <c:import url="/components/Footer.jsp"/>

  </body>
</html>