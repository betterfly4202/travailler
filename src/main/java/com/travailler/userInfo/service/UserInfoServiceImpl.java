package com.travailler.userInfo.service;

import com.travailler.login.bean.LoginVO;
import com.travailler.login.entity.LoginEntity;
import com.travailler.userInfo.bean.UserInfoVO;
import com.travailler.userInfo.dao.UserInfoMapperDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by betterFLY on 2017. 10. 30.
 * Github : http://github.com/betterfly88
 */

@Service
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    UserInfoMapperDao dao;

    @Override
    public LoginVO getUserInfo(String user_email){
        Map<String, Object> param = new HashMap();
        param.put("user_email",user_email);

        LoginEntity userEnt = dao.selectUserInfo(param);
        LoginVO loginVO = userEnt.toLogin();

        return loginVO;
    }

    @Override
    public void editUserInfo(LoginVO loginVO){
        Map<String, Object> param = new HashMap();
        param.put("user_gender",loginVO.getUserGender());
        param.put("user_birth",loginVO.getUserBirth());
        param.put("user_job",loginVO.getUserJob());
        param.put("user_tag",loginVO.getUserTag());
        param.put("user_area",loginVO.getUserArea());
        param.put("user_seq",loginVO.getUserSeq());

        dao.updateUserInfo(param);
    }


}
