<%-- 
    Document   : Compose
    Created on : May 30, 2019, 10:58:52 PM
    Author     : tiny
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
  <head>

    <%-- Required meta tags --%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sign Up | Gmail SMTP WebApp</title>

    <%-- Customize CSS --%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">

    <%-- Bootstrap CSS --%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <%-- Quill CSS --%>
    <link href="//cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <link href="//cdn.quilljs.com/1.3.6/quill.bubble.css" rel="stylesheet">

  </head>
  <body>

    <!--  Import navigation bar into pages  -->
    <c:import url="/components/NavBar.jsp"/>

    <div class="container-fluid mb-5 text-editor">
      <div class="container pt-5 pb-5 shadow rounded">AAAA</div></div>

    <!--  Import navigation bar into pages  -->
    <c:import url="/components/Footer.jsp"/>

    <%-- Quill library --%>
    <script src="//cdn.quilljs.com/1.3.6/quill.min.js"></script>
    
  </body>
</html>