package com.travailler.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by betterFLY on 2017. 10. 29.
 * Github : http://github.com/betterfly88
 */


@Controller
public class LoginController {
    @Autowired
    private GoogleConnectionFactory googleConnectionFactory;
    @Autowired
    private OAuth2Parameters googleOAuth2Parameters;

    public void setGoogleConnectionFactory(GoogleConnectionFactory googleConnectionFactory) {
        this.googleConnectionFactory = googleConnectionFactory;
    }

    public GoogleConnectionFactory getGoogleConnectionFactory() {
        return googleConnectionFactory;
    }

    public void setGoogleOAuth2Parameters(OAuth2Parameters googleOAuth2Parameters) {
        this.googleOAuth2Parameters = googleOAuth2Parameters;
    }

    public OAuth2Parameters getGoogleOAuth2Parameters() {
        return googleOAuth2Parameters;
    }

    //기본 로그인 화면
    @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView login(HttpSession session){
        ModelAndView modelAndView = new ModelAndView("/login/login");
        //구글 code 발행
        OAuth2Operations oAuth2Operations = googleConnectionFactory.getOAuthOperations();
        String url = oAuth2Operations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
        modelAndView.addObject("google_url",url);

        return modelAndView;
    }

    //인증 콜백 - success
    @RequestMapping(value = "/login/oauthCallback", method = {RequestMethod.GET, RequestMethod.POST})
    public String authCallback(@RequestParam String code) throws IOException {

        return "/login/auth_success";
    }
}