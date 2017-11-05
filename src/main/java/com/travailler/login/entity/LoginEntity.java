package com.travailler.login.entity;

import com.travailler.login.bean.LoginVO;

/**
 * Created by betterFLY on 2017. 10. 30.
 * Github : http://github.com/betterfly88
 */

public class LoginEntity {

    private String user_seq;
    private String user_name;
    private String user_email;
    private String user_gender;
    private String user_birth;
    private String user_job;
    private String user_tag;
    private String user_area;
    private String user_create_date;

    public LoginVO toLogin(){
        LoginVO vo = new LoginVO();
        vo.setUserSeq(this.getUser_seq());
        vo.setUserName(this.getUser_name());
        vo.setUserEmail(this.getUser_email());
        vo.setUserGender(this.getUser_gender());
        vo.setUserBirth(this.getUser_birth());
        vo.setUserJob(this.getUser_job());
        vo.setUserTag(this.getUser_tag());
        vo.setUserArea(this.getUser_area());
        vo.setUserCreateDate(this.getUser_create_date());
        return vo;
    }


    public String getUser_seq() {
        return user_seq;
    }

    public void setUser_seq(String user_seq) {
        this.user_seq = user_seq;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_gender() {
        return user_gender;
    }

    public void setUser_gender(String user_gender) {
        this.user_gender = user_gender;
    }

    public String getUser_birth() {
        return user_birth;
    }

    public void setUser_birth(String user_birth) {
        this.user_birth = user_birth;
    }

    public String getUser_job() {
        return user_job;
    }

    public void setUser_job(String user_job) {
        this.user_job = user_job;
    }

    public String getUser_tag() {
        return user_tag;
    }

    public void setUser_tag(String user_tag) {
        this.user_tag = user_tag;
    }

    public String getUser_area() {
        return user_area;
    }

    public void setUser_area(String user_area) {
        this.user_area = user_area;
    }

    public String getUser_create_date() {
        return user_create_date;
    }

    public void setUser_create_date(String user_create_date) {
        this.user_create_date = user_create_date;
    }
}
