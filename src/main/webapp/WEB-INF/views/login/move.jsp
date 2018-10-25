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
    <script>


    </script>
</head>
<body>

    <h2>MOVE PAGE</h2>
    <h3>${name}</h3>
    <h3>
        <c:choose>
            <c:when test="vo != null">
                ${vo.caArea}
            </c:when>
            <c:otherwise>
                없음
            </c:otherwise>
        </c:choose>
    </h3>

</body>
</html>

<script>

</script>