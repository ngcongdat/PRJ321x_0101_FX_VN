<%-- 
    Document   : Home
    Created on : May 30, 2019, 6:14:04 PM
    Author     : tiny
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/components/NavBar.jsp">
  <c:param name="title" value="HomePage | Gmail SMTP Webapp"></c:param>
</c:import>

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
            <a class="lead" href="compose">Send mail now</a>
          </c:otherwise>
        </c:choose>

      </div>
    </div>
  </div>
</header>


<c:import url="/components/Footer.jsp"></c:import>