<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="headBody">


    </tiles:putAttribute>
    <tiles:putAttribute name="contentBody">

        <style type="text/css">
            .tg  {border-collapse:collapse;border-spacing:0;}
            .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
            .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
            .tg .tg-yw4l{vertical-align:top}
        </style>
        <table class="tg">
            <tr>
                <th class="tg-yw4l">이름</th>
                <th class="tg-yw4l"></th>
            </tr>
            <tr>
                <td class="tg-yw4l">이메일</td>
                <td class="tg-yw4l"></td>
            </tr>
        </table>>
    </tiles:putAttribute>
</tiles:insertDefinition>