package com.travailler.oauth.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;

/**
 * Created by betterFLY on 2017-11-22.
 */
public class UserAuthenticationProvider implements AuthenticationProvider {
    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String user = authentication.getPrincipal().toString();
        String pwd = authentication.getCredentials().toString();

        boolean result = user.equals("myuser") && pwd.equals("mypassword");
        if(result){
            List<GrantedAuthority> grantedAuthorityList = new ArrayList<GrantedAuthority>();
            UserAuthenticationToken auth =
                    new UserAuthenticationToken(authentication.getPrincipal(), authentication.getCredentials(), grantedAuthorityList);
            return auth;
        }else{
            throw new BadCredentialsException("Bad User Credentials");
        }
    }

    @Override
    public boolean supports(Class<?> type){
        return true;
    }
}
