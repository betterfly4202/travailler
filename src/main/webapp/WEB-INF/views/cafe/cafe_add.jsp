<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>



<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="headBody">
        <style type="text/css">
            .tg  {border-collapse:collapse;border-spacing:0;}
            .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
            .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
            .tg .tg-lqy6{text-align:right;vertical-align:top}
            .tg .tg-yw4l{vertical-align:top}
        </style>


        <script>
            $(function(){

            });
        </script>

    </tiles:putAttribute>
    <tiles:putAttribute name="contentBody">

        <button type="button" onclick="history.back()">이전</button> <br/>

        <form:form id="cafeInfoForm" modelAttribute="cafeInfoVO" method="POST">
        <table class="tg">
            <tr>
                <td class="tg-yw4l">카페 이름</td>
                <td class="tg-yw4l">
                    <form:input type="text" path="caName"/>
                </td>
            </tr>
            <tr>
                <th class="tg-lqy6">카페 URL</th>
                <th class="tg-yw4l">
                    http://shaiver.com/<form:input type="text" path="caUrl"/>
                </th>
            </tr>
            <tr>
                <td class="tg-yw4l">공개 여부</td>
                <td class="tg-yw4l">
                    <form:radiobutton path="caPublicYn" value="Y" label="공개"/>
                    <form:radiobutton path="caPublicYn" value="N" label="비공개"/>
                </td>
            </tr>
            <tr>
                <td class="tg-yw4l">주제</td>
                <td class="tg-yw4l">
                    <form:input type="text" path="caTopic"/>
                </td>
            </tr>
            <tr>
                <td class="tg-yw4l">설명</td>
                <td class="tg-yw4l">
                    <form:input type="text" path="caDesc"/>
                </td>
            </tr>
            <tr>
                <td class="tg-yw4l">태그</td>
                <td class="tg-yw4l">
                    <form:input type="text" path="caTag"/>
                </td>
            </tr>
            <tr>
                <td class="tg-yw4l">이미지</td>
                <td class="tg-yw4l">
                    <form:input type="text" path="caImg"/>
                </td>
            </tr>
        </table>
        </form:form>
    </tiles:putAttribute>
</tiles:insertDefinition>