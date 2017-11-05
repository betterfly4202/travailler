package com.travailler.user_info.service;

import com.travailler.user_info.bean.UserInfoVO;
import com.travailler.user_info.dao.UserInfoMapperDao;
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
    UserInfoMapperDao loginMapperDao;

    @Override
    public void addLogUser(UserInfoVO loginVO){
        Map<String, Object> param = new HashMap();
        param.put("user_id",loginVO.getUserId());
        param.put("user_pw",loginVO.getUserPw());

        loginMapperDao.insertLoginUser(param);
    }

}
