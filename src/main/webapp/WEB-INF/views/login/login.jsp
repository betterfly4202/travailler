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

        function travaillerAuth() {
            location.href='${google_url}';
        }
    </script>
</head>
<body>


    <h2>LOGIN PAGE</h2>

    <form:form id="infoForm" action="" modelAttribute="cafeInfoVO" method="POST">
        <form:input path="caArea" type="text"/>
        <input type="text" id="in_id"/>
        <select>
            <option>
                aa
            </option>
            <option>
                bb
            </option>
        </select>
        <button type="button" onclick="move()">이동</button>
        <form:button type="submit" onclick="submit()">submmit</form:button>
    </form:form>


</body>
</html>

<script>
    function move(){
        alert(document.getElementById("in_id").value());

        <%--location.href = "<c:url value="/move"/>"+"?name=abcd";--%>
        // location.href = "/move";
    }

    function submit(){
        $("#infoForm").attr("action", "<c:url value="/post"/>");
        $("#infoForm").submit();
    }
</script>