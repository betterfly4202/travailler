<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="headBody">

        <script>

            $(function(){
                $("#datePicker").datepicker({
                    showOn: "both",
                    dateFormat: "yy-mm-dd",
                    buttonImageOnly: true,
                    changeYear : true,
                    changeMonth : true,
                    prevText: '이전 달',
                    nextText: '다음 달',
                    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                    dayNames: ['일','월','화','수','목','금','토'],
                    dayNamesShort: ['일','월','화','수','목','금','토'],
                    dayNamesMin: ['일','월','화','수','목','금','토'],
                    showMonthAfterYear: true,
                    yearSuffix: '년',
                    yearRange: 'c-100:c'
                });
            });

            function fn_modifyUserInfo(){
                var formData = $("#userInfoForm").serialize();

                <%--$.ajax({--%>
                    <%--type: "POST",--%>
                    <%--data :formData,--%>
                    <%--url: "<c:url value="/edit/userInfo"/>",--%>
                    <%--success : function(data){--%>
                        <%--console.log(data);--%>
                        <%--alert("정보가 수정되었습니다.");--%>
                    <%--}--%>
                <%--});--%>

                $.ajax({
                    type: "POST",
                    data: formData,
                    url: "<c:url value="/edit/userInfo"/>"
                }).done(function (data){
                    console.log(data);
                    alert("수정 되었습니다.");
                });
                <%--$('#userInfoForm').attr("action",'<c:url value="/edit/userInfo"/>').submit();--%>
            }
        </script>

    </tiles:putAttribute>

    <tiles:putAttribute name="contentBody">

        <style type="text/css">
            .tg  {border-collapse:collapse;border-spacing:0;}
            .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
            .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
            .tg .tg-yw4l{vertical-align:top}
        </style>

        <form:form id="userInfoForm" method="POST" modelAttribute="loginVO">
            <form:hidden path="userSeq"/>
            <table class="tg">
            <tr>
                <td class="tg-yw4l">이름</td>
                <td class="tg-yw4l">
                    ${loginVO.userName}
                </td>
            </tr>
            <br/>
            <tr>
                <td class="tg-yw4l">이메일</td>
                <td class="tg-yw4l">
                    ${loginVO.userEmail}
                </td>
            </tr>
            <br/>
            <tr>
                <td class="tg-yw4l">성별</td>
                <td class="tg-yw4l">
                    <form:radiobutton path="userGender" value="M" label="남자ㅋ"/>
                    <form:radiobutton path="userGender" value="F" label="여자ㅋ"/>
                </td>
            </tr>
            <br/>
            <tr>
                <td class="tg-yw4l">생년월일</td>
                <td class="tg-yw4l">
                    <form:input type="text" id="datePicker" path="userBirth" readonly="true"></form:input>
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
            <%--<button type="submit">저장</button>--%>
            <button type="button" onclick="fn_modifyUserInfo()">정보 수정</button>
            <button type="button" onclick="history.back()">취소</button>
        </form:form>
    </tiles:putAttribute>
</tiles:insertDefinition>