<%--
  * Created by betterFLY on 2017. 10. 29.
  * Github : http://github.com/betterfly88
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Travailler's Home</title>
</head>

<script src="/resources/js/jquery-1.11.2.min.js"/>

<script>
    <%--$(document).ready(function(){--%>
        <%--location.href="<c:url value="/main"/>"--%>
    <%--});--%>
    document.location.href="<c:url value="/main"/>";
</script>

<body>

    <%--구글 로그인 성공--%>
<%--<br/>--%>
<%--<h2>이름 : ${personInfo.displayName} </h2>--%>
<%--<h2>이메일 : ${personInfo.emailAddresses}</h2>--%>

</body>
</html>
