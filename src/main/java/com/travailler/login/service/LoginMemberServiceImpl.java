package com.travailler.login.service;

import com.travailler.login.bean.LoginVO;
import com.travailler.login.dao.LoginMapperDao;
import com.travailler.login.entity.LoginEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by betterFLY on 2017. 10. 30.
 * Github : http://github.com/betterfly88
 */

@Service
public class LoginMemberServiceImpl implements LoginMemberService {

    @Autowired
    LoginMapperDao loginMapperDao;

    @Override
    public void addLogUser(LoginVO loginVO){
        Map<String, Object> param = new HashMap();
        param.put("user_name",loginVO.getUserName());
        param.put("user_email",loginVO.getUserEmail());

        loginMapperDao.insertLoginUser(param);
    }
}
