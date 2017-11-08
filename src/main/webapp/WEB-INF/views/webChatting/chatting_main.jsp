<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


<script src="<c:url value="/resources/js/sockjs.js"/>"></script>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="headBody">

        <script>

            var sock;
            var userId = '${userInfo.accountEmail}';
            sock = new SockJS("<c:url value="/webChatting/main"/>");
            sock.onmessage = onMessage;
            sock.onclose = onClose;
            sock.onopen = onOpen;

            $(function(){
                $("#sendBtn").click(function(){
                    sendMessage();
                });
            });

            function fn_enter(event) {
                if (event.keyCode == 13) {
                    sendMessage();
                    return false;
                }
            }

            function sendMessage(){
                // send message by websocket
                sock.send($("#message").val());
                $("#message").val("");
            }

            // evt = websocket data
            function onMessage(evt){
                var data = evt.data;
                console.log(data);
                $("#chat_data").append(userId + " : "+data+"<br/>");
            }

            function onOpen(evt){
                $("#chat_data").append("enter the room <br/>");
            }

            function onClose(evt){
                $("#chat_data").append("연결 끊김");
            }

            // 채팅 많아질 경우 자동 스크롤링
            window.setInterval(function() {
                var elem = $("#chat_data");
                elem.scrollTop = elem.scrollHeight;
            }, 0);

        </script>

    </tiles:putAttribute>
    <tiles:putAttribute name="contentBody">
        <button type="button" onclick="history.back()">이전</button> <br/>

        <div>
            <input type="text" id="message" onkeydown="fn_enter(event);" value="">
            <input type="button" id="sendBtn" value="전송"> </input>
            <br/>
             <div id="chat_data"></div>
        </div>

    </tiles:putAttribute>
</tiles:insertDefinition>