<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="headBody">

        <script>

            $(function(){


            });

            function fn_authLogout() {
                <%--location.href="<c:url value="/auth/logout"/>";--%>
                var url = '${accessToken}';
                location.href="https://accounts.google.com/o/oauth2/revoke?token="+url;
                location.reload();
                <%--location.href="<c:url value="/login"/>";--%>

                <%--$.ajax({--%>
                    <%--url : "https://accounts.google.com/o/oauth2/revoke?token="+url,--%>
                    <%--success : function(data){--%>
                        <%--location.href="<c:url value="/login"/>";--%>
                    <%--}--%>
                <%--})--%>

                <%--window.open('https://accounts.google.com/logout','popup', 'width=600, height=400');--%>

                <%--$.post("<c:url value="/logout"/>",function(response){--%>
                    <%--if(response.error){--%>
                        <%--alert("응답 에러");--%>
                    <%--}else{--%>
                        <%--child.close();--%>
                        <%--location.reload();--%>
                    <%--}--%>
                <%--});--%>
            }

            function fn_editUserInfo() {
                location.href = "<c:url value="/view/userInfo?email="/>"+'${userInfo.accountEmail}';
            }

            function fn_webChatting(){
                location.href = "<c:url value="/webChatting/main"/>";
            }


            function travaillerAuth() {
                location.href='${google_url}';
            }

            function fn_makeCafe(){
                location.href = "<c:url value="/webChatting/main"/>";
            }
        </script>

    </tiles:putAttribute>
    <tiles:putAttribute name="contentBody">

        <h1> Travailler Main Page</h1>
        <c:choose>
            <c:when test="${userInfo == null}">
                <img src="<c:url value="/resources/images/Red-signin_Google_base_44dp.png"/>" onclick="travaillerAuth()"/>
            </c:when>
            <c:otherwise>
                Hello <b>${userInfo.displayName} (${userInfo.accountEmail})</b>

                <img src="${userInfo.imageUrl}" style="width: 32px; height: 32px;"/>

                <br/>
                <button onclick="fn_authLogout()">logout</button>
                <button onclick="fn_editUserInfo()">개인 정보 수정</button>
                <button onclick="fn_webChatting()">웹 채팅 바로가기</button>
                <button onclick="fn_makeCafe()">카페 만들기</button>
            </c:otherwise>
        </c:choose>


    </tiles:putAttribute>
</tiles:insertDefinition>