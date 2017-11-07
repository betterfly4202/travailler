package com.travailler.webchatting.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by betterFLY on 2017-11-07.
 */
public class EchoHandler extends TextWebSocketHandler {
    private Logger logger = LoggerFactory.getLogger(EchoHandler.class);

    /**
     *  서버에 연결한 사용자들 저장 리스트
     */
    private List<WebSocketSession> connectedUsers;

    public EchoHandler(){
        connectedUsers = new ArrayList<WebSocketSession>();
    }

    /**
     *  Connecting Event Method
     *
     *  @Param WebSocketSession : connecting users
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        connectedUsers.add(session);

        logger.info(session.getId());
        logger.info("acccess IP : "+session.getRemoteAddress().getHostName());
    }


    /**
     *  Two kinds function Method
     *  1. send : send message [client to server]
     *  2. emit : send message that All of server connected user
     *
     *  @Param WebSocketSession : client who send messages
     *  @Param TextMessage : contents of messages
     */
    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        for(WebSocketSession webSocketSession : connectedUsers){
            // do not receive my messages
            if(!session.getId().equals(webSocketSession)){
                webSocketSession.sendMessage(new TextMessage("echo : "+message.getPayload()));
            }
        }

        /**
         *  Payload : client send messages
         */
        logger.info(session.getId()+ " 's message : "+message.getPayload());
    }


    /**
     *  Running method when client disconnected server
     *
     *  @Param WebSocketSession : disconnected client
     *  @Param CloseStatus : connecting status (required)
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
        connectedUsers.remove(session);
        logger.info(session.getId() + " 's leave");
    }
}