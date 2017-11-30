package com.travailler.webchatting.controller;

import com.travailler.common.BaseController;
import com.travailler.login.bean.LoginVO;
import org.springframework.social.google.api.plus.Person;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by betterFLY on 2017-11-07.
 */

@Controller
public class WebChattingController extends BaseController{

    @RequestMapping(value = "/webChatting/main")
    public ModelAndView chattingMain(HttpSession session, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("/webChatting/chatting_main");
        LoginVO vo = this.getUserInfo(request);
        mav.addObject("userInfo",vo);

        return mav;
    }
}