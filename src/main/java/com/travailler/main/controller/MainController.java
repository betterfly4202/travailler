package com.travailler.main.controller;

import org.apache.log4j.Logger;
import org.springframework.social.google.api.plus.Person;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by betterFLY on 2017-10-16.
 */

@Controller
public class MainController {
    Logger logger = Logger.getLogger(this.getClass());

    @RequestMapping(value = "/main")
    public ModelAndView mainView(
            HttpServletRequest request,
            HttpSession session){
        ModelAndView mav = new ModelAndView("/main/main_view");
        logger.debug(" 인터셉터 테스트");
        Person person = (Person)session.getAttribute("userInfo");

         mav.addObject("userInfo",person);
        return mav;
    }


    @RequestMapping(value = "/logout")
    public RedirectView logout(HttpServletRequest request, HttpServletResponse response){

        return new RedirectView("/main");
    }

}