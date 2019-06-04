<%-- 
    Document   : Inbox
    Created on : Jun 2, 2019, 10:38:47 PM
    Author     : tiny
--%>

<%@page import="com.business.InboxMail"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:choose>
  <c:when test="${sessionScope.user == null}">
    <c:redirect url="sign-in"></c:redirect>
  </c:when>
  <c:otherwise>

    <c:set var="listMail" value="<%= new InboxMail().getInboxMail()%>"/>

    <!DOCTYPE html>
    <html>
      <head>

        <%-- Required meta tags --%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Inbox | Gmail SMTP WebApp</title>

        <%-- Customize CSS --%>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">

        <%-- Bootstrap CSS --%>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

      </head>
      <body>

        <%--  Import navigation bar into pages  --%>
        <c:import url="/components/NavBar.jsp"/>

        <div class="container" style="margin-top: 100px; margin-bottom: 20px">
          <div class="row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12">
              <c:forEach var="email" items="${listMail}">
                <c:set var="dateReceive" value="${email.dateReceive}"/>
                <div class="row mt-3 mb-3 mr-2 ml-2">
                  <div class="col-12 col-sm-12 col-md-12 col-lg-12 shadow rounded pt-3 pb-3">
                    <h3 class="font-weight-bold">${email.subject}</h3>
                    <span>From: </span><span style="margin-left: 5px">${email.from}</span>
                    <br>
                    <span>Date: </span><span style="margin-left: 8px"><fmt:formatDate pattern="dd-MM-yyyy" value="${dateReceive}"/></span>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>

        <%--  Import navigation bar into pages  --%>
        <c:import url="/components/Footer.jsp"/>
      </body>
    </html>
  </c:otherwise>
</c:choose>
