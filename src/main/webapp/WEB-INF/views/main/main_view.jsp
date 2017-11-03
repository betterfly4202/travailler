<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="headBody">


    </tiles:putAttribute>
    <tiles:putAttribute name="contentBody">


    <h1> Travailler Main Page</h1>
    ${userInfo.displayName}

    </tiles:putAttribute>
</tiles:insertDefinition>
<%--<h1> Travailler Main Page</h1>--%>
<%--${userInfo.displayName}--%>