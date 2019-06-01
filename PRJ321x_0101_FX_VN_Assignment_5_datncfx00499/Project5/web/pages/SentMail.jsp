<%-- 
    Document   : SentMail
    Created on : Jun 1, 2019, 11:34:24 PM
    Author     : tiny
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
  <head>

    <%-- Required meta tags --%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Sent Mail | Gmail SMTP WebApp</title>

    <%-- Customize CSS --%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">

    <%-- Bootstrap CSS --%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

  </head>
  <body>

    <%--  Import navigation bar into pages  --%>
    <c:import url="/components/NavBar.jsp"/>

    <div class="container" style="margin-top: 100px; margin-bottom: 20px">
      <div class="row">

        <div class="col-12 col-sm-12 col-md-12 col-lg-12 content-area">

          <div class="row mt-3 mb-3 mr-2 ml-2 content-row">

            <div class="col-12 col-sm-12 col-md-12 col-lg-12 shadow rounded pt-3 pb-3 post-box">
              <a href="#" class="font-weight-bold text-dark text-decoration-none post-title" style="font-family: 'Roboto Mono', monospace">...</a>
              <div class="pb-3 text-secondary">

              </div>
              <p class="text-secondary">...</p>
              <a class="btn btn-primary" href="#">Read more</a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <%--  Import navigation bar into pages  --%>
    <c:import url="/components/Footer.jsp"/>

  </body>
</html>