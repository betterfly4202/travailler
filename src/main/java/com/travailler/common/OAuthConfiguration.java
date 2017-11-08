package com.travailler.common;

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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by betterFLY on 2017-11-08.
 */
public class OAuthConfiguration {
    @Autowired
    private GoogleConnectionFactory googleConnectionFactory;
    @Autowired
    private OAuth2Parameters googleOAuth2Parameters;

    public String oauthUrl(){
        OAuth2Operations oAuth2Operations = googleConnectionFactory.getOAuthOperations();
        String url = oAuth2Operations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

        return url;
    }

    public Person oauthCallback(HttpServletRequest request,
                              String code){
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

        // setting to session
        HttpSession session = request.getSession();
        session.setAttribute("userInfo",person);
        session.setAttribute("accessToken",accessToken);

        return person;
    }

}
