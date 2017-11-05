package com.travailler.login.controller;

import com.travailler.login.bean.LoginVO;
import com.travailler.login.service.LoginMemberService;
import com.travailler.login.service.LoginMemberServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
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

//    @Autowired
//    private LoginMemberServiceImpl service;

    public void setGoogleConnectionFactory(GoogleConnectionFactory googleConnectionFactory) {
        this.googleConnectionFactory = googleConnectionFactory;
    }

    public void setGoogleOAuth2Parameters(OAuth2Parameters googleOAuth2Parameters) {
        this.googleOAuth2Parameters = googleOAuth2Parameters;
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
    public ModelAndView authCallback(
            @RequestParam String code,
            HttpServletRequest request) throws IOException {
//        ModelAndView mav = new ModelAndView("login/auth_callback");
        ModelAndView mav = new ModelAndView();

        OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
        AccessGrant accessGrant = oauthOperations.exchangeForAccess(code , googleOAuth2Parameters.getRedirectUri(),
                null);

        String accessToken = accessGrant.getAccessToken();
        Long expireTime = accessGrant.getExpireTime();
        if (expireTime != null && expireTime < System.currentTimeMillis()) {
            accessToken = accessGrant.getRefreshToken();
            System.out.printf("accessToken is expired. refresh token = {}", accessToken);
        }
        Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
        Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();

        PlusOperations plusOperations = google.plusOperations();
        Person person = plusOperations.getGoogleProfile();


        LoginVO loginVO = new LoginVO();
        loginVO.setUserName(person.getDisplayName());
        loginVO.setUserEmail(person.getAccountEmail());



        mav.setView(new RedirectView("/main"));
        HttpSession session = request.getSession();
        session.setAttribute("userInfo",person);
        mav.addObject("userInfo",person);
        return mav;
    }
}