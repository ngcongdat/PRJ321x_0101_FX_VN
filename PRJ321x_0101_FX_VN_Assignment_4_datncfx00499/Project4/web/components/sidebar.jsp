<%-- 
    Document   : sidebar
    Created on : May 28, 2019, 6:23:06 PM
    Author     : tiny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Side Bar</title>

    <%-- Meta tags --%>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <%-- Customize CSS --%>
    <link rel="stylesheet" href="./css/style.css">

    <%-- Bootstrap CSS --%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <%-- Google Fonts --%>
    <link href="https://fonts.googleapis.com/css?family=Roboto+Mono&display=swap" rel="stylesheet">

  </head>
  <body>
    <div class="col-12 col-sm-12 col-md-12 col-lg-12 shadow rounded pt-3 pb-3">
      <form action="controller" method="post">
        <div class="form-group m-0">
          <input type="hidden" name="action" value="search" class="form-control"/>
          <input type="text" name="search" value="" placeholder="Search" class="form-control"/>
        </div>
      </form>
    </div>
  </body>
</html>

