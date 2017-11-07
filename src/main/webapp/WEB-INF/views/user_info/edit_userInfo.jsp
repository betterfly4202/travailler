<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="headBody">


    </tiles:putAttribute>



    <script>
        function fn_modifyUserInfo(){
            var formData = $("#userInfoForm").serialize();

            console.log(formData);

            $.ajax({
                type: "POST",
//                data :formData,
                url: "<c:url value="/edit/userInfo"/>",
                success : function(data){
                    console.log(data);
                }
            });
            <%--$('#userInfoForm').attr("action",'<c:url value="/edit/userInfo"/>').submit();--%>
        }
    </script>


    <tiles:putAttribute name="contentBody">

        <style type="text/css">
            .tg  {border-collapse:collapse;border-spacing:0;}
            .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
            .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
            .tg .tg-yw4l{vertical-align:top}
        </style>

        <form:form id="userInfoForm" action="/edit/userInfo" method="POST" modelAttribute="loginVO">
            <form:hidden path="userSeq"/>
            <table class="tg">
            <tr>
                <th class="tg-yw4l">이름</th>
                <th class="tg-yw4l">
                    <form:input path="userName" id="inputTitle" ></form:input>
                </th>
            </tr>
            <br/>
            <tr>
                <td class="tg-yw4l">이메일</td>
                <td class="tg-yw4l">
                    <form:input type="text" path="userEmail" id="inputTitle" ></form:input>
                </td>
            </tr>
            <br/>
            <tr>
                <td class="tg-yw4l">성별</td>
                <td class="tg-yw4l">
                    남자 <form:radiobutton path="userGender" value="M" labe="남자"/>
                    여자 <form:radiobutton path="userGender" value="F" labe="여자"/>
                </td>
            </tr>
            <br/>
            <tr>
                <td class="tg-yw4l">생년월일</td>
                <td class="tg-yw4l">
                    <form:input type="text" path="userBirth" ></form:input>
                </td>
            </tr>
            <br/>
            <tr>
                <td class="tg-yw4l">직업</td>
                <td class="tg-yw4l">
                    <form:input type="text" path="userJob" ></form:input>
                </td>
            </tr>
            <br/>
            <tr>
                <td class="tg-yw4l">관심사</td>
                <td class="tg-yw4l">
                    <form:input type="text" path="userTag"></form:input>
                </td>
            </tr>
            <br/>
            <tr>
                <td class="tg-yw4l">지역</td>
                <td class="tg-yw4l">
                    <form:input type="text" path="userArea"></form:input>
                </td>
            </tr>

            <br/>

            </table>
            <button type="submit">저장</button>
            <%--<button type="button" onclick="fn_modifyUserInfo()">정보 수정</button>--%>
        </form:form>
    </tiles:putAttribute>
</tiles:insertDefinition>