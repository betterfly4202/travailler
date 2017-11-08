package com.travailler.webchatting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.social.google.api.plus.Person;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.WebSocketHandler;

import javax.servlet.http.HttpSession;

/**
 * Created by betterFLY on 2017-11-07.
 */

@Controller
public class WebChattingController{

    @RequestMapping(value = "/webChatting/main")
    public ModelAndView chattingMain(HttpSession session){
        ModelAndView mav = new ModelAndView("/webChatting/chatting_main");
        Person person = (Person)session.getAttribute("userInfo");

        mav.addObject("user_email",person.getAccountEmail());

        return mav;
    }
}
