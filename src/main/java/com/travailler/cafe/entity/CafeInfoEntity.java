package com.travailler.cafe.entity;

import com.travailler.cafe.bean.CafeInfoVO;

/**
 * Created by betterFLY on 2017-11-09.
 */
public class CafeInfoEntity {
    private String ca_seq;
    private String user_seq;
    private String cate_seq;
    private String ca_url;
    private String ca_name;
    private String ca_public_yn;
    private String ca_topic;
    private String ca_area;
    private String ca_tag;
    private String ca_create_date;
    private String ca_desc;
    private String ca_img;


    public CafeInfoVO toCafeinfoVO(){
        CafeInfoVO vo = new CafeInfoVO();
        vo.setCaSeq(this.getCa_seq());
        vo.setUserSeq(this.getUser_seq());
        vo.setCateSeq(this.getCate_seq());
        vo.setCaUrl(this.getCa_url());
        vo.setCaName(this.getCa_name());
        vo.setCaPublicYn(this.getCa_public_yn());
        vo.setCaCreateDate(this.getCa_create_date());
        vo.setCaTopic(this.getCa_topic());
        vo.setCaArea(this.getCa_area());
        vo.setCaTag(this.getCa_tag());
        vo.setCaDesc(this.getCa_desc());
        vo.setCaImg(this.getCa_img());
        return vo;
    }

    public String getCa_area() {
        return ca_area;
    }

    public void setCa_area(String ca_area) {
        this.ca_area = ca_area;
    }

    public String getCa_tag() {
        return ca_tag;
    }

    public void setCa_tag(String ca_tag) {
        this.ca_tag = ca_tag;
    }

    public String getCa_seq() {
        return ca_seq;
    }

    public void setCa_seq(String ca_seq) {
        this.ca_seq = ca_seq;
    }

    public String getUser_seq() {
        return user_seq;
    }

    public void setUser_seq(String user_seq) {
        this.user_seq = user_seq;
    }

    public String getCate_seq() {
        return cate_seq;
    }

    public void setCate_seq(String cate_seq) {
        this.cate_seq = cate_seq;
    }

    public String getCa_url() {
        return ca_url;
    }

    public void setCa_url(String ca_url) {
        this.ca_url = ca_url;
    }

    public String getCa_name() {
        return ca_name;
    }

    public void setCa_name(String ca_name) {
        this.ca_name = ca_name;
    }

    public String getCa_public_yn() {
        return ca_public_yn;
    }

    public void setCa_public_yn(String ca_public_yn) {
        this.ca_public_yn = ca_public_yn;
    }

    public String getCa_create_date() {
        return ca_create_date;
    }

    public void setCa_create_date(String ca_create_date) {
        this.ca_create_date = ca_create_date;
    }

    public String getCa_topic() {
        return ca_topic;
    }

    public void setCa_topic(String ca_topic) {
        this.ca_topic = ca_topic;
    }

    public String getCa_desc() {
        return ca_desc;
    }

    public void setCa_desc(String ca_desc) {
        this.ca_desc = ca_desc;
    }

    public String getCa_img() {
        return ca_img;
    }

    public void setCa_img(String ca_img) {
        this.ca_img = ca_img;
    }
}
