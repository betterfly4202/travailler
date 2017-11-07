package com.travailler.webchatting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.WebSocketHandler;

/**
 * Created by betterFLY on 2017-11-07.
 */

@Controller
public class WebChattingController{

    @RequestMapping(value = "/webChatting/main")
    public ModelAndView chattingMain(){
        ModelAndView mav = new ModelAndView("/webChatting/chatting_main");

        return mav;
    }
}
