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

<script src="https://www.gstatic.com/firebasejs/4.6.0/firebase.js"></script>

<script>

    window.fbAsyncInit = function() {
        FB.init({
            appId            : 'your-app-id',
            autoLogAppEvents : true,
            xfbml            : true,
            version          : 'v2.10'
        });
        FB.AppEvents.logPageView();
    };

    (function(d, s, id){
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {return;}
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));



    // 로그인 form 액션
    function fn_loginAction(){
        $("#loginForm").submit();
    }

</script>

<body>


<form:form id="loginForm" action="/login/action" method="POST"  modelAttribute="loginVO">
    <form:input path="userId" value=""/>
    <form:input path="userPw" value=""/>
        <br/>
    <button onclick="fn_loginAction()">로그인</button>
    <button>회원가입</button>
</form:form>

</body>
</html>
