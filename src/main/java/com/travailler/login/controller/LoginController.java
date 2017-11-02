package com.travailler.login.controller;

import com.travailler.login.bean.LoginVO;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by betterFLY on 2017. 10. 29.
 * Github : http://github.com/betterfly88
 */


@Controller
public class LoginController {

//    @Autowired
//    private LoginMemberServiceImple service;
    private GoogleConnectionFactory googleConnectionFactory;
    private OAuth2Parameters googleOAuth2Parameters;

    public void setGoogleConnectionFactory(GoogleConnectionFactory googleConnectionFactory) {
        this.googleConnectionFactory = googleConnectionFactory;
    }

    public void setGoogleOAuth2Parameters(OAuth2Parameters googleOAuth2Parameters) {
        this.googleOAuth2Parameters = googleOAuth2Parameters;
    }

    @RequestMapping(value = "/login/googleSignIn", method = RequestMethod.POST)
    public ModelAndView doGoogleSignInActionPage(HttpServletResponse response) {
        ModelAndView mav = new ModelAndView("/login/login_222");

        OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
        String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
        //System.out.println("/member/googleSignIn, url : " + url);

        PrintWriter out;
        try {
            out = response.getWriter();
            out.write(url);
            out.flush();
            out.close();
        } catch (IOException e) {
            throw new RuntimeException(e.getMessage(), e);
        }

        return mav;

    }

    @RequestMapping("/login/googleSignInCallback")
    public ModelAndView doSessionAssignActionPage(HttpServletRequest request){
        ModelAndView mav = new ModelAndView("/login/login_callback");
        System.out.println("/member/googleSignInCallback");
        String code = request.getParameter("code");

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


//        HttpSession session = request.getSession();
//        MemberVO member = new MemberVO();
//        member.setNickName(person.getDisplayName());
//        member.setAuth("USR");
//        session.setAttribute("_MEMBER_", member );

        System.out.println(person.getDisplayName());

//        return "redirect:/";
        return mav;
		/*System.out.println(person.getAccountEmail());
		System.out.println(person.getAboutMe());
		System.out.println(person.getDisplayName());
		System.out.println(person.getEtag());
		System.out.println(person.getFamilyName());
		System.out.println(person.getGender());
		*/


    }

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

    @RequestMapping(value = "/login/auth")
    public ModelAndView loginAuth(){
        ModelAndView modelAndView = new ModelAndView("/login/oauth");

        return modelAndView;
    }

    @RequestMapping(value = "/login/receive/auth")
    public ModelAndView receiveAuth(){
        ModelAndView modelAndView = new ModelAndView("/login/loginOauth");

        return modelAndView;
    }

    @RequestMapping(value = "/login/refresh/token")
    public ModelAndView refreshToken(){
        ModelAndView modelAndView = new ModelAndView("/login/refreshToken");

        return modelAndView;
    }

}