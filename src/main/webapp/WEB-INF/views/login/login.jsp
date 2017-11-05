<%--
  * Created by betterFLY on 2017. 10. 29.
  * Github : http://github.com/betterfly88
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
    <script src="https://apis.google.com/js/api:client.js"></script>
    <script>

        function travaillerAuth() {
            location.href='${google_url}';
        }
    </script>
</head>
<body>
<br/>
<button onclick="travaillerAuth()">구글 계정 로그인하기</button>
<div id="name"></div>
</body>
</html>