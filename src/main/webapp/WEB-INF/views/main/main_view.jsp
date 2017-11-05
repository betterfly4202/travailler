<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="headBody">


    </tiles:putAttribute>
    <tiles:putAttribute name="contentBody">


        <script>

            <%--console.log(${email});--%>

            function fn_authLogout() {
                window.open('https://accounts.ggogle.com/logout','popup', 'width=600, height=400');
            }

            function fn_editUserInfo() {
                location.href = "<c:url value="/edit/userInfo"/>";
            }


        </script>

        <h1> Travailler Main Page</h1>
        <button onclick="fn_authLogout()">logout</button>
        Hello <b>${userInfo.displayName} (${user_email})</b>
        <br/>

        <button onclick="fn_editUserInfo()">개인 정보 수정</button>


    </tiles:putAttribute>
</tiles:insertDefinition>