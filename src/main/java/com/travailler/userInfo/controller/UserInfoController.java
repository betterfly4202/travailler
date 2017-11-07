package com.travailler.userInfo.controller;

import com.travailler.login.bean.LoginVO;
import com.travailler.userInfo.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by betterFLY on 2017. 10. 29.
 * Github : http://github.com/betterfly88
 */


@Controller
public class UserInfoController {
    @Autowired
    private UserInfoService service;

    @RequestMapping(value = "/view/userInfo")
    public ModelAndView viewUserInfo(
            @RequestParam(value="email", required = true) String user_email,
            @ModelAttribute("loginVO") LoginVO loginVO){
        ModelAndView mav = new ModelAndView("/user_info/edit_userInfo");

//        LoginVO userVO = service.getUserInfo(user_email);
        loginVO = service.getUserInfo(user_email);
        mav.addObject("loginVO", loginVO);

        return mav;
    }

    @RequestMapping(value="/edit/userInfo", method = RequestMethod.POST)
    public String editUserInfo(
            @ModelAttribute("loginVO") LoginVO loginVO){
        ModelAndView mav = new ModelAndView("");

        return "";
    }
}