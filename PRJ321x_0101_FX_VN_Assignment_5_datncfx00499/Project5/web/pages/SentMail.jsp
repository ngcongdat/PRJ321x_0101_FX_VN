<%-- 
    Document   : SentMail
    Created on : Jun 1, 2019, 11:34:24 PM
    Author     : tiny
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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

        <sql:setDataSource var="ds" dataSource="jdbc/MailWebApp"/>

        <sql:query dataSource="${ds}" sql="SELECT * FROM MyMail WHERE user = ? ORDER BY dateSend DESC" var="allEmails">
          <sql:param>${sessionScope.userId}</sql:param>
        </sql:query>
        <div class="container" style="margin-top: 100px; margin-bottom: 20px">
          <div class="row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 content-area">
              <c:forEach var="email" items="${allEmails.rows}">
                <c:set var="dateSend" value="${email.dateSend}"/>
                <div class="row mt-3 mb-3 mr-2 ml-2 content-row">
                  <div class="col-12 col-sm-12 col-md-12 col-lg-12 shadow rounded pt-3 pb-3 post-box">
                    <h3 class="font-weight-bold">${email.subject}</h3>
                    <span>To: </span><span style="margin-left: 20px">${email.toAddress}</span>
                    <br>
                    <span>CC: </span><span style="margin-left: 13px">${email.ccAddress}</span>
                    <br>
                    <span>Date: </span><span style="margin-left: 2px"><fmt:formatDate pattern="dd-MM-yyyy" value="${dateSend}"/></span>
                    <div class="text-secondary">
                      ${email.content}
                    </div>
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
