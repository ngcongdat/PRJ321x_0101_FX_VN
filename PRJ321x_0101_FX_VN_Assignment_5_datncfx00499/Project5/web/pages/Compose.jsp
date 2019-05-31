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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Compose New Email | Gmail SMTP WebApp</title>

    <%-- Customize CSS --%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">

    <%-- Bootstrap CSS --%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <%-- Quill CSS --%>
    <link href="//cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <link href="//cdn.quilljs.com/1.3.6/quill.bubble.css" rel="stylesheet">

  </head>
  <body>

    <c:choose>
      <c:when test="${sessionScope.user == null}">
        <c:redirect url="sign-in"></c:redirect>
      </c:when>
      <c:otherwise>

        <!--  Import navigation bar into pages  -->
        <c:import url="/components/NavBar.jsp"/>

        <div class="container-fluid mb-5 text-editor">
          <div class="container pt-5 pb-5 shadow rounded">
            <div class="card card-address" style="border: none; box-shadow: none;">
              <div class="card-body">
                <form class="form-address" id="sendEmail" action="Controller" method="post">
                  <input type="hidden" name="action" value="sendEmail">
                  <!--<label for="inputToAdress" class="font-weight-bold input-title">To:</label>-->
                  <div class="form-label-group">
                    <input type="email" name="toaddress" value="" id="inputToAdress" class="form-control" placeholder="To:" required autofocus>
                    <label for="inputToAdress">To:</label>
                  </div>
                  <!--<label for="inputCCAddress" class="font-weight-bold input-title">CC:</label>-->
                  <div class="form-label-group">
                    <input type="email" name="ccaddress" value="" id="inputCCAddress" class="form-control" placeholder="CC:">
                    <label for="inputCCAddress">CC:</label>
                  </div>
                  <!--<label for="inputSubject" class="font-weight-bold input-title">Subject:</label>-->
                  <div class="form-label-group">
                    <input type="text" name="subject" value="" id="inputSubject" class="form-control" placeholder="Subject:" required>
                    <label for="inputSubject">Subject:</label>
                  </div>
                  <input type="hidden" name="content" value="">
                </form>
                <!--<label onclick="focusEditor();" class="font-weight-bold input-title">Content:</label>-->
              </div>
            </div>
            <div id="toolbar"></div>
            <div id="editor" style="height: 500px"></div>
            <hr class="my-4">
            <button id="save-delta" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Send</button>
          </div>
        </div>

        <!--  Import navigation bar into pages  -->
        <c:import url="/components/Footer.jsp"/>

        <%-- Quill library --%>
        <script src="//cdn.quilljs.com/1.3.6/quill.min.js"></script>

        <!-- Initialize Quill editor -->
        <script>
          var toolbarOptions = [
            ['bold', 'italic', 'underline', 'strike'],
            [{'align': []}],
            [{'font': []}],
            [{'size': ['small', false, 'large', 'huge']}],
            [{'header': [1, 2, 3, 4, 5, 6, false]}],
            [{'list': 'ordered'}, {'list': 'bullet'}],
            [{'script': 'sub'}, {'script': 'super'}],
            [{'indent': '-1'}, {'indent': '+1'}],
            [{'direction': 'rtl'}],
            [{'color': []}, {'background': []}],
            ['link', 'image', 'video', 'formula'],
            ['blockquote', 'code-block'],
            ['clean']
          ];

          var quill = new Quill('#editor', {
            modules: {
              toolbar: toolbarOptions
            },
            placeholder: "Write your content email...",
            theme: 'snow'
          });

          function focusEditor() {
            quill.focus();
          }

          $('#save-delta').click(function () {
            var content = document.querySelector(".ql-editor").innerHTML;
            var form = document.getElementById("sendEmail");
            form.elements['content'].value = content;
            form.submit();
          });

        </script>

      </body>
    </html>
  </c:otherwise>
</c:choose>