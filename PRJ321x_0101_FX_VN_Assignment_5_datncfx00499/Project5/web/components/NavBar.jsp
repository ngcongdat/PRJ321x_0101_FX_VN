<%-- 
    Document   : NavBar
    Created on : May 30, 2019, 7:02:34 PM
    Author     : tiny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!-- Navigation -->
    <div class="container-fluid">
      <div class="row">
        <nav class="navbar navbar-expand-lg navbar-light bg-light shadow fixed-top pt-3 pb-3">
          <div class="container">
            <a class="navbar-brand" href="home">Gmail WebApp</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="home">Home
                    <span class="sr-only">(current)</span>
                  </a>
                </li>
                <c:choose>
                  <c:when test="${sessionScope.user == null}">
                    <li class="nav-item">
                      <a class="nav-link" href="sign-in">Sign In</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="sign-up">Sign Up</a>
                    </li>
                  </c:when>
                  <c:otherwise>
                    <li class="nav-item">
                      <a class="nav-link" href="compose">Compose</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="sent">Sent</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="Controller?action=logout">Log Out</a>
                    </li>
                  </c:otherwise>
                </c:choose>
              </ul>
            </div>
          </div>
        </nav>
      </div>
    </div>


