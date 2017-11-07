<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="headBody">

        <script>
            function fn_authLogout() {
                window.open('https://accounts.google.com/logout','popup', 'width=600, height=400');

                $.post("<c:url value="/logout"/>",function(response){
                    if(response.error){
                        alert("응답 에러");
                    }else{
                        child.close();
                        location.reload();
                    }
                });
            }

            function fn_editUserInfo() {
                location.href = "<c:url value="/view/userInfo?email="/>"+'${user_email}';
            }

            function fn_webChatting(){
                location.href = "<c:url value="/webChatting/main"/>";
            }
        </script>

    </tiles:putAttribute>
    <tiles:putAttribute name="contentBody">

        <h1> Travailler Main Page</h1>
        Hello <b>${userInfo.displayName} (${user_email})</b>

        <br/>
        <button onclick="fn_authLogout()">logout</button>
        <button onclick="fn_editUserInfo()">개인 정보 수정</button>
        <button onclick="fn_webChatting()">웹 채팅 바로가기</button>


    </tiles:putAttribute>
</tiles:insertDefinition>