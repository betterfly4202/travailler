package com.travailler.user_info.dao;

import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * Created by betterFLY on 2017. 10. 30.
 * Github : http://github.com/betterfly88
 */

@Repository
public interface UserInfoMapperDao {
    int insertLoginUser(Map<String, Object> map);
}
