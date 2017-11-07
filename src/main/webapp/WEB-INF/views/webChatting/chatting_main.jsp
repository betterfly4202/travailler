<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


<script src="<c:url value="/resources/js/sockjs.js"/>"></script>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="headBody">

        <script>

            $(function(){

            });

            var sock;
            function sendMessage(){
                sock = new SockJS("<c:url value="/echoChat"/>");

                sock.onmessage = onMessage;
                sock.onclose = onClose;
                sock.onopen = function(){
                    sock.send($("#message").val());
                }
            }
        </script>

    </tiles:putAttribute>
    <tiles:putAttribute name="contentBody">
        <button type="button" onclick="history.back()">이전</button> <br/>
        CHATTING ROOM

    </tiles:putAttribute>
</tiles:insertDefinition>