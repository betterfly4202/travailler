<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  * Created by betterFLY on 2017. 10. 31.
  * Github : http://github.com/betterfly88
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<script>
    $(function(){
        var link = document.location.href;
        console.log(link);

        var tempUrl = link.split("=");
        var _url;
        for (var i=0;i<tempUrl.length;i++){
            _url = tempUrl[2].split("&");
        }
        $("#code").val(_url[0]);
    });

</script>

<style>
    input{
        width :300px;
    }

</style>

    <a href="<c:url value="/login/auth"/>">로그인 바로가기</a>

    <form action="https://www.googleapis.com//oauth2/v4/token" method="post" enctype="application/x-www-form-urlencoded">

        code : <input type="text" id="code" name="code" value=""/> <br/>
        client_id : <input type="text" name="client_id" value="1035245132871-nnfo3ic1reg003eocd28snnnes23k368.apps.googleusercontent.com"> <br/>
        client_secret : <input type="text" name="client_secret" value="eistGpA_8BrRZ8PPmg6ptQj8"> <br/>
        redirect_uri : <input type="text" name="redirect_uri" value="http://localhost:8080/login/receive/auth"> </br/>
        grant_type : <input type="text" name="grant_type" value="authorization_code"> <br/>
        <input type="submit">
    </form>

참고하기
http://blog.naver.com/PostView.nhn?blogId=p952973&logNo=221028025493&parentCategoryNo=&categoryNo=47&viewDate=&isShowPopularPosts=true&from=search
dispatcher servlet에서 client_id/secret key 설정
redirect 되는 컨트롤러(url)설정
그 외에 지금 jsp에서 구현한 로직들 자바로 구현하기
처음 접근해서

<!--&lt;!&ndash; google Class Bean설정 추가 &ndash;&gt;-->
<!--&lt;!&ndash; 클라이언트ID와 보안비밀 세팅&ndash;&gt;-->
<!--<beans:bean id="googleConnectionFactory"-->
                <!--class="org.springframework.social.google.connect.GoogleConnectionFactory">-->
<!--<beans:constructor-arg value="1035245132871-nnfo3ic1reg003eocd28snnnes23k368.apps.googleusercontent.com" />-->
<!--<beans:constructor-arg value="eistGpA_8BrRZ8PPmg6ptQj8" />-->
<!--</beans:bean>-->
<!--&lt;!&ndash; 승인된 자바스크립트 원본과 승인된 리디렉션 URI &ndash;&gt;-->
<!--<beans:bean id="googleOAuth2Parameters" class="org.springframework.social.oauth2.OAuth2Parameters">-->
<!--<beans:property name="scope" value="https://www.googleapis.com/auth/plus.login" />-->
<!--<beans:property name="redirectUri" value="http://localhost:8090/login_project/oauth2callback" />-->
<!--</beans:bean>-->


</body>
</html>
