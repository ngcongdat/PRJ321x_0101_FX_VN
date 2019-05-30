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
      <div class="container pt-5 pb-5 shadow rounded">
        <div id="toolbar"></div>
        <div id="editor" style="height: 500px"></div>
        <button id="save-delta">Save</button>
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
        theme: 'snow'
      });
      
      $('#save-delta').click(function () {
        var delta = quill.getContents();
        console.log(delta);
      });
    </script>

  </body>
</html>