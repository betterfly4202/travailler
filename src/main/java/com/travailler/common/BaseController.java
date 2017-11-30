package com.travailler.common;

import com.travailler.login.bean.LoginVO;
import com.travailler.userInfo.bean.UserInfoVO;
import com.travailler.userInfo.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.api.plus.Person;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by betterFLY on 2017-11-30.
 */

public class BaseController {
    @Autowired
    private UserInfoService service;

    public LoginVO getUserInfo(HttpServletRequest request){
        Person person = (Person)request.getSession().getAttribute("userInfo");
        LoginVO loginVO = service.getUserInfo(person.getAccountEmail());
        return loginVO;
    }
}