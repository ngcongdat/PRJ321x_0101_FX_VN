<%-- 
    Document   : Compose
    Created on : May 30, 2019, 10:58:52 PM
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

        <%--  Import navigation bar into pages  --%>
        <c:import url="/components/NavBar.jsp"/>

        <div class="container-fluid mb-5 text-editor">
          <div class="container pt-5 pb-5 shadow rounded">
            <c:choose>
              <c:when test="${requestScope.sendSuccess != null}">
                <div class="row">
                  <div class="col-12" style="padding: 0 2rem;">
                    <div class="alert alert-success text-center m-0" role="alert">
                      ${requestScope.sendSuccess}
                    </div>
                  </div>
                </div>
              </c:when>
              <c:when test="${requestScope.sendFail != null}">
                <div class="row">
                  <div class="col-12" style="padding: 0 2rem;">
                    <div class="alert alert-danger text-center m-0" role="alert">
                      ${requestScope.sendFail}
                    </div>
                  </div>
                </div>
              </c:when>
            </c:choose>
            <div class="card card-address" style="border: none; box-shadow: none;">
              <div class="card-body">
                <form class="form-address" id="sendEmail" action="Controller" method="post">
                  <input type="hidden" name="action" value="sendEmail">
                  <div class="form-label-group">
                    <input type="text" id="inputFrom" class="form-control" placeholder="From:" disabled="true">
                    <label for="inputFrom">From: ${sessionScope.user.username}</label>
                  </div>
                  <div class="form-label-group">
                    <c:choose>
                      <c:when test="${requestScope.invalidEmail != null}">
                        <input type="text" id="inputToAddress" class="form-control is-invalid" placeholder="To:">
                        <label for="inputToAddress">To:</label>
                        <div class="invalid-feedback text-center">
                          ${requestScope.invalidEmail}
                        </div>
                      </c:when>
                      <c:otherwise>
                        <input type="email" name="toAddress" value="" id="inputToAdress" class="form-control" placeholder="To:" required autofocus>
                        <label for="inputToAdress">To:</label>
                      </c:otherwise>
                    </c:choose>
                  </div>

                  <div class="form-label-group">
                    <input type="email" name="ccAddress" value="" id="inputCCAddress" class="form-control" placeholder="CC:">
                    <label for="inputCCAddress">CC:</label>
                  </div>

                  <div class="form-label-group">
                    <c:choose>
                      <c:when test="${requestScope.invalidSubject != null}">
                        <input type="text" name="subject" value="" id="inputSubject" class="form-control is-invalid" placeholder="Subject:" required>
                        <label for="inputSubject">Subject:</label>
                        <div class="invalid-feedback text-center">
                          ${requestScope.invalidSubject}
                        </div>
                      </c:when>
                      <c:otherwise>
                        <input type="text" name="subject" value="" id="inputSubject" class="form-control" placeholder="Subject:" required>
                        <label for="inputSubject">Subject:</label>
                      </c:otherwise>
                    </c:choose>
                  </div>
                  <input type="hidden" name="content" value="">
                </form>
              </div>
            </div>
            <div id="toolbar"></div>
            <div id="editor" style="height: 500px"></div>
            <hr class="my-4">
            <button id="save-delta" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Send</button>
          </div>
        </div>

        <%--  Import navigation bar into pages  --%>
        <c:import url="/components/Footer.jsp"/>

        <%-- Quill library --%>
        <script src="//cdn.quilljs.com/1.3.6/quill.min.js"></script>

        <%-- Initialize Quill editor --%>
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