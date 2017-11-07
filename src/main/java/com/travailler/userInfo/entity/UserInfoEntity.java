package com.travailler.userInfo.entity;

import com.travailler.userInfo.bean.UserInfoVO;

/**
 * Created by betterFLY on 2017. 10. 30.
 * Github : http://github.com/betterfly88
 */

public class UserInfoEntity {

    private String user_id;
    private String user_pw;

    public UserInfoVO toLogin(){
        UserInfoVO vo = new UserInfoVO();
        vo.setUserId(this.getUser_id());
        vo.setUserPw(this.getUser_pw());

        return vo;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_pw() {
        return user_pw;
    }

    public void setUser_pw(String user_pw) {
        this.user_pw = user_pw;
    }
}
