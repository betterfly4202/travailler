package com.travailler.userInfo.service;

import com.travailler.login.bean.LoginVO;
import com.travailler.userInfo.bean.UserInfoVO;

/**
 * Created by betterFLY on 2017. 10. 30.
 * Github : http://github.com/betterfly88
 */

public interface UserInfoService {
    LoginVO getUserInfo(String user_email);
    void editUserInfo(LoginVO loginVO);
}
