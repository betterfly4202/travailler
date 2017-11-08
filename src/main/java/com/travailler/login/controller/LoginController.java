package com.travailler.login.controller;

import com.travailler.common.OAuthConfiguration;
import com.travailler.login.bean.LoginVO;
import com.travailler.login.dao.LoginMapperDao;
import com.travailler.login.entity.LoginEntity;
import com.travailler.login.service.LoginMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.api.plus.Person;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;

/**
 * Created by betterFLY on 2017. 10. 29.
 * Github : http://github.com/betterfly88
 */

@Controller
public class LoginController extends OAuthConfiguration{
    @Autowired
    private LoginMemberService service;

    @Autowired
    private LoginMapperDao dao;

    // login base
    @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView login(HttpSession session){
        ModelAndView modelAndView = new ModelAndView("login/login_main");
        String url = oauthUrl();
        modelAndView.addObject("google_url",url);

        return modelAndView;
    }

    // success callback
    @RequestMapping(value = "/login/oauthCallback", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView authCallback(
            @RequestParam String code,
            HttpServletRequest request,
            HttpSession session) throws IOException {
        ModelAndView mav = new ModelAndView();

        // call OauthConfiguration class
        Person person = oauthCallback(request, code);

        // checking user existed
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("user_email", person.getAccountEmail());
        LoginEntity userEnt = dao.selectExistedUser(param);

        if(userEnt == null){
            LoginVO loginVO = new LoginVO();
            loginVO.setUserName(person.getDisplayName());
            loginVO.setUserEmail(person.getAccountEmail());
            service.addLogUser(loginVO);
        }

        String accessToken = (String)session.getAttribute("accessToken");

        mav.setView(new RedirectView("/main"));
        mav.addObject("userInfo",person);
        mav.addObject("accessToken",accessToken);
        return mav;
    }

    // auth logout...?
    @RequestMapping(value = "/auth/logout")
    public ModelAndView oauthLogout(HttpSession session,
                                    HttpServletRequest request,
                                    HttpServletResponse response,
                                    Principal principal){
        ModelAndView mav = new ModelAndView();

//        String authHeader = request.getHeader("Authorization");
//        if(authHeader != null){
//            String tokenValue = authHeader.replace("Bearer", "").trim();
//            OAuth2AccessToken accessToken = tokenStore.readAccessToken(tokenValue);
//            tokenStore.removeAccessToken(accessToken);
//        }

//        Cookie [] cookies = request.getCookies();
//        if(cookies != null){
//            for(int i=0 ; i<cookies.length; i++){
//                cookies[i].setMaxAge(0);
//                response.addCookie(cookies[i]);
//            }
//        }
        String accessToken = (String)session.getAttribute("accessToken");
//        consumerTokenServices.revokeToken(accessToken);


        mav.setViewName("/login/login_retry");

        return mav;
    }
}