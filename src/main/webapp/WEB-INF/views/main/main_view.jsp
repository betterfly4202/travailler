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
                location.href = "<c:url value="/add/cafelist"/>";
            }

            function fn_uploadFile(){
                location.href = "<c:url value="/main/fileUpload"/>";
            }

            function fn_pluploadFile(){
                location.href = "<c:url value="/main/plupload"/>";
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
                <button onclick="fn_uploadFile()">파일 업로드</button>
                <button onclick="fn_pluploadFile()">파일 업로드222</button>
            </c:otherwise>
        </c:choose>


    </tiles:putAttribute>
</tiles:insertDefinition>