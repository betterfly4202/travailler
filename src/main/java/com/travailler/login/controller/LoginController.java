package com.travailler.login.controller;

import com.travailler.login.bean.LoginVO;
import com.travailler.login.service.LoginMemberServiceImple;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by betterFLY on 2017. 10. 29.
 * Github : http://github.com/betterfly88
 */


@Controller
public class LoginController {

//    @Autowired
//    private LoginMemberServiceImple service;


    @RequestMapping(value = "/login")
    public ModelAndView loginBase(
            @ModelAttribute("loginVO") LoginVO loginVo
    ){
        ModelAndView modelAndView = new ModelAndView("/login/login");
        return modelAndView;
    }


    @RequestMapping(value = "/login/action", method = RequestMethod.POST)
    public ModelAndView loginAction(
            @ModelAttribute("loginVO") LoginVO loginVo){
        ModelAndView mav = new ModelAndView("/main/main_view");
//        service.addLogUser(loginVo);
        return mav;
    }
}