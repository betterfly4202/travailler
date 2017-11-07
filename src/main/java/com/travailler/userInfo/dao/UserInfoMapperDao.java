package com.travailler.userInfo.dao;

import com.travailler.login.entity.LoginEntity;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * Created by betterFLY on 2017. 10. 30.
 * Github : http://github.com/betterfly88
 */

@Repository
public interface UserInfoMapperDao {
    LoginEntity selectUserInfo(Map<String, Object> map);
    void updateUserInfo(Map<String, Object> map);
}
