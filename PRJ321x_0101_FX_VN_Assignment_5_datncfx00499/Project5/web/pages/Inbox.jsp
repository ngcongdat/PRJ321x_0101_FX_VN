<%-- 
    Document   : Inbox
    Created on : Jun 2, 2019, 10:38:47 PM
    Author     : tiny
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
  <c:when test="${sessionScope.user == null}">
    <c:redirect url="sign-in"></c:redirect>
  </c:when>
  <c:otherwise>
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

        <!--  Import navigation bar into pages  -->
        <c:import url="/components/NavBar.jsp"/>


        <!--  Import navigation bar into pages  -->
        <c:import url="/components/Footer.jsp"/>
      </body>
    </html>
  </c:otherwise>
</c:choose>
